
package com.arunbhardwaj.adv_basics

import com.chaquo.python.Python
import com.chaquo.python.android.AndroidPlatform
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import org.json.JSONObject
import java.util.UUID
import java.util.concurrent.CompletableFuture
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicBoolean

class MainActivity : FlutterActivity() {

    private val channelName =
        "com.arunbhardwaj.adv_basics/python_playground"

    private lateinit var channel: MethodChannel

    private val runCancelled = AtomicBoolean(false)

    private val pendingInputs =
        ConcurrentHashMap<String, CompletableFuture<String?>>()

    private val inputBridge = object {

        fun isCancelled(): Boolean = runCancelled.get()

        fun writeOutput(text: String) {
            if (text.isEmpty() || runCancelled.get()) return

            runOnUiThread {
                if (::channel.isInitialized && !runCancelled.get()) {
                    channel.invokeMethod(
                        "pythonOutput",
                        mapOf("text" to text)
                    )
                }
            }
        }

        fun readLine(prompt: String): String? {
            if (runCancelled.get()) return null

            val requestId = UUID.randomUUID().toString()
            val future = CompletableFuture<String?>()
            pendingInputs[requestId] = future

            runOnUiThread {
                if (runCancelled.get() || !::channel.isInitialized) {
                    future.complete(null)
                } else {
                    channel.invokeMethod(
                        "requestInput",
                        mapOf(
                            "requestId" to requestId,
                            "prompt" to prompt
                        )
                    )
                }
            }

            return try {
                future.get(5, TimeUnit.MINUTES)
            } catch (_: Exception) {
                null
            } finally {
                pendingInputs.remove(requestId)
            }
        }
    }

    override fun configureFlutterEngine(
        flutterEngine: FlutterEngine
    ) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channelName
        )

        channel.setMethodCallHandler { call, result ->
            when (call.method) {

                "runPython" -> {
                    val code = call.argument<String>("code")

                    if (code == null) {
                        result.error(
                            "INVALID_CODE",
                            "Python code is missing",
                            null
                        )
                        return@setMethodCallHandler
                    }

                    // Reset cancellation for this run.
                    runCancelled.set(false)

                    Thread {
                        try {
                            if (!Python.isStarted()) {
                                Python.start(
                                    AndroidPlatform(applicationContext)
                                )
                            }

                            val module = Python.getInstance()
                                .getModule("playground")

                            val jsonResult = module.callAttr(
                                "run_code",
                                code,
                                inputBridge
                            ).toString()

                            val parsed = JSONObject(jsonResult)
                            val output = parsed.optString("output", "")

                            val errorValue = parsed.opt("error")
                            val error = if (
                                errorValue == null ||
                                errorValue == JSONObject.NULL ||
                                errorValue.toString() == "None"
                            ) {
                                null
                            } else {
                                errorValue.toString()
                            }

                            runOnUiThread {
                                result.success(
                                    mapOf(
                                        "output" to output,
                                        "error" to error
                                    )
                                )
                            }
                        } catch (e: Exception) {
                            runOnUiThread {
                                result.error(
                                    "PYTHON_ERROR",
                                    e.message ?: "Python execution failed",
                                    null
                                )
                            }
                        }
                    }.start()
                }

                "submitInput" -> {
                    val requestId =
                        call.argument<String>("requestId")
                    val value = call.argument<String>("value")
                    val cancelled =
                        call.argument<Boolean>("cancelled") ?: false

                    requestId?.let { pendingInputs[it] }?.complete(
                        if (cancelled || runCancelled.get()) {
                            null
                        } else {
                            value ?: ""
                        }
                    )

                    result.success(null)
                }

                "stopPython" -> {
                    // Set this immediately; don't wait for Python.
                    runCancelled.set(true)

                    // Release any Python input() currently waiting.
                    pendingInputs.values.forEach { future ->
                        future.complete(null)
                    }

                    result.success(null)
                }

                else -> result.notImplemented()
            }
        }
    }

    override fun onDestroy() {
        runCancelled.set(true)

        pendingInputs.values.forEach { future ->
            future.complete(null)
        }
        pendingInputs.clear()

        super.onDestroy()
    }
}

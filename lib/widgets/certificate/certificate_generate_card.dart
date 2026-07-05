import 'package:flutter/material.dart';
import '../../models/certificate.dart';

class CertificateGenerateCard extends StatelessWidget {
  const CertificateGenerateCard({
    super.key,
    required this.selectedLevel,
    required this.earnedLevel,
    required this.onGenerate,
  });

  final CertificateLevel selectedLevel;
  final CertificateLevel earnedLevel;
  final VoidCallback onGenerate;

  bool get isUnlocked => selectedLevel == earnedLevel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isUnlocked
                  ? Icons.download_rounded
                  : Icons.lock_outline_rounded,
              size: 52,
              color: isUnlocked
                  ? Colors.green
                  : Colors.grey,
            ),

            const SizedBox(height: 16),

            Text(
              isUnlocked
                  ? "Certificate Ready"
                  : "Certificate Locked",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              isUnlocked
                  ? "Generate and download your certificate."
                  : "Complete the requirements to unlock this certificate.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: isUnlocked ? onGenerate : null,
                icon: Icon(
                  isUnlocked
                      ? Icons.download
                      : Icons.lock,
                ),
                label: Text(
                  isUnlocked
                      ? "Generate Certificate"
                      : "Locked",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
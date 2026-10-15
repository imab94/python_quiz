import 'package:flutter/foundation.dart';

class AppRefreshService {

  static final ValueNotifier<int> refreshNotifier =
  ValueNotifier(0);

  static void refresh() {
    refreshNotifier.value++;
  }
}
import 'package:flutter/services.dart';

class PluginWizzitdigital {
  static const methodChannel = MethodChannel('plugin_wizzitdigital');

  static Future<Map<String, dynamic>?> init(Map<String, dynamic> config) {
    return methodChannel.invokeMethod<Map<String, dynamic>>(
      'init',
      config,
    );
  }

  static Future<Map<String, dynamic>?> transaction(
      Map<String, dynamic> transaction) {
    return methodChannel.invokeMethod<Map<String, dynamic>>(
      'transaction',
      transaction,
    );
  }
}

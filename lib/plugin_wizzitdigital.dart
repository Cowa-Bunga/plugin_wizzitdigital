import 'package:flutter/services.dart';

class PluginWizzitdigital {
  static const methodChannel = MethodChannel('plugin_wizzitdigital');

  static Future<dynamic> init(Map<String, dynamic> config) {
    return methodChannel.invokeMethod('init', config);
  }

  static Future<dynamic> transaction(Map<String, dynamic> transaction) {
    return methodChannel.invokeMethod('transaction', transaction);
  }
}

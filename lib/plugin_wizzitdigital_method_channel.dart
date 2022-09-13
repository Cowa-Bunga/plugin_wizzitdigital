import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'plugin_wizzitdigital_platform_interface.dart';

/// An implementation of [PluginWizzitdigitalPlatform] that uses method channels.
class MethodChannelPluginWizzitdigital extends PluginWizzitdigitalPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('plugin_wizzitdigital');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

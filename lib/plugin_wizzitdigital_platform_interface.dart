import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'plugin_wizzitdigital_method_channel.dart';

abstract class PluginWizzitdigitalPlatform extends PlatformInterface {
  /// Constructs a PluginWizzitdigitalPlatform.
  PluginWizzitdigitalPlatform() : super(token: _token);

  static final Object _token = Object();

  static PluginWizzitdigitalPlatform _instance = MethodChannelPluginWizzitdigital();

  /// The default instance of [PluginWizzitdigitalPlatform] to use.
  ///
  /// Defaults to [MethodChannelPluginWizzitdigital].
  static PluginWizzitdigitalPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PluginWizzitdigitalPlatform] when
  /// they register themselves.
  static set instance(PluginWizzitdigitalPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

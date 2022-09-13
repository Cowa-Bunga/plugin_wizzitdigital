import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'plugin_wizzitdigital_method_channel.dart';

abstract class PluginWizzitdigitalPlatform extends PlatformInterface {
  /// Constructs a PluginWizzitdigitalPlatform.
  PluginWizzitdigitalPlatform() : super(token: _token);

  static final Object _token = Object();

  static PluginWizzitdigitalPlatform _instance =
      MethodChannelPluginWizzitdigital();

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

  Future<void> init() {
    throw UnimplementedError('init() has not been implemented.');
  }

  Stream<int> onCreate() {
    throw UnimplementedError('onCreate() has not been implemented.');
  }

  Stream<int> onResume() {
    throw UnimplementedError('onResume() has not been implemented.');
  }

  Stream<int> onAdapterInitializing() {
    throw UnimplementedError(
      'onAdapterInitializing() has not been implemented.',
    );
  }

  Stream<int> onSessionInitComplete() {
    throw UnimplementedError(
      'onSessionInitComplete() has not been implemented.',
    );
  }

  Stream<int> onSessionCountdown() {
    throw UnimplementedError('onSessionCountdown() has not been implemented.');
  }

  Stream<int> onSessionTimeout() {
    throw UnimplementedError('onSessionTimeout() has not been implemented.');
  }

  Stream<int> onCardProcessing() {
    throw UnimplementedError('onCardProcessing() has not been implemented.');
  }

  Stream<int> onCardProcessingComplete() {
    throw UnimplementedError(
      'onCardProcessingComplete() has not been implemented.',
    );
  }

  Stream<int> onCardProcessingNotify() {
    throw UnimplementedError(
      'onCardProcessingNotify() has not been implemented.',
    );
  }

  Stream<int> onCardRemoved() {
    throw UnimplementedError('onCardRemoved() has not been implemented.');
  }

  Stream<int> onCheckDeviceRegistrationComplete() {
    throw UnimplementedError(
      'onCheckDeviceRegistrationComplete() has not been implemented.',
    );
  }

  Stream<int> onAdapterInitComplete() {
    throw UnimplementedError(
      'onAdapterInitComplete() has not been implemented.',
    );
  }

  Stream<int> onDeviceRegistrationComplete() {
    throw UnimplementedError(
      'onDeviceRegistrationComplete() has not been implemented.',
    );
  }

  Stream<int> onSessionComplete() {
    throw UnimplementedError('onSessionComplete() has not been implemented.');
  }
}

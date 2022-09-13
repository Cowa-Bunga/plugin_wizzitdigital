import 'plugin_wizzitdigital_platform_interface.dart';

class PluginWizzitdigital {
  Future<String?> getPlatformVersion() {
    return PluginWizzitdigitalPlatform.instance.getPlatformVersion();
  }

  Future<void> init() {
    return PluginWizzitdigitalPlatform.instance.init();
  }

  Stream<int> onCreate() {
    return PluginWizzitdigitalPlatform.instance.onCreate();
  }

  Stream<int> onResume() {
    return PluginWizzitdigitalPlatform.instance.onResume();
  }

  Stream<int> onAdapterInitializing() {
    return PluginWizzitdigitalPlatform.instance.onAdapterInitializing();
  }

  Stream<int> onSessionInitComplete() {
    return PluginWizzitdigitalPlatform.instance.onSessionInitComplete();
  }

  Stream<int> onSessionCountdown() {
    return PluginWizzitdigitalPlatform.instance.onSessionCountdown();
  }

  Stream<int> onSessionTimeout() {
    return PluginWizzitdigitalPlatform.instance.onSessionTimeout();
  }

  Stream<int> onCardProcessing() {
    return PluginWizzitdigitalPlatform.instance.onCardProcessing();
  }

  Stream<int> onCardProcessingComplete() {
    return PluginWizzitdigitalPlatform.instance.onCardProcessingComplete();
  }

  Stream<int> onCardProcessingNotify() {
    return PluginWizzitdigitalPlatform.instance.onCardProcessingNotify();
  }

  Stream<int> onCardRemoved() {
    return PluginWizzitdigitalPlatform.instance.onCardRemoved();
  }

  Stream<int> onCheckDeviceRegistrationComplete() {
    return PluginWizzitdigitalPlatform.instance
        .onCheckDeviceRegistrationComplete();
  }

  Stream<int> onAdapterInitComplete() {
    return PluginWizzitdigitalPlatform.instance.onAdapterInitComplete();
  }

  Stream<int> onDeviceRegistrationComplete() {
    return PluginWizzitdigitalPlatform.instance.onDeviceRegistrationComplete();
  }

  Stream<int> onSessionComplete() {
    return PluginWizzitdigitalPlatform.instance.onSessionComplete();
  }
}

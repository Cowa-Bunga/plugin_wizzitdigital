
import 'plugin_wizzitdigital_platform_interface.dart';

class PluginWizzitdigital {
  Future<String?> getPlatformVersion() {
    return PluginWizzitdigitalPlatform.instance.getPlatformVersion();
  }
}

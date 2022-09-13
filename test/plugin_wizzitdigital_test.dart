import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_wizzitdigital/plugin_wizzitdigital.dart';
import 'package:plugin_wizzitdigital/plugin_wizzitdigital_platform_interface.dart';
import 'package:plugin_wizzitdigital/plugin_wizzitdigital_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPluginWizzitdigitalPlatform 
    with MockPlatformInterfaceMixin
    implements PluginWizzitdigitalPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PluginWizzitdigitalPlatform initialPlatform = PluginWizzitdigitalPlatform.instance;

  test('$MethodChannelPluginWizzitdigital is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPluginWizzitdigital>());
  });

  test('getPlatformVersion', () async {
    PluginWizzitdigital pluginWizzitdigitalPlugin = PluginWizzitdigital();
    MockPluginWizzitdigitalPlatform fakePlatform = MockPluginWizzitdigitalPlatform();
    PluginWizzitdigitalPlatform.instance = fakePlatform;
  
    expect(await pluginWizzitdigitalPlugin.getPlatformVersion(), '42');
  });
}

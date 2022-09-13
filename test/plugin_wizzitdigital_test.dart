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

  @override
  Future<void> init() => Future.value();
}

void main() {
  final PluginWizzitdigitalPlatform initialPlatform = PluginWizzitdigitalPlatform.instance;

  test('$MethodChannelPluginWizzitdigital is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPluginWizzitdigital>());
  });

  test('getPlatformVersion', () async {
    final pluginWizzitdigitalPlugin = PluginWizzitdigital();
    final fakePlatform = MockPluginWizzitdigitalPlatform();
    PluginWizzitdigitalPlatform.instance = fakePlatform;
  
    expect(await pluginWizzitdigitalPlugin.getPlatformVersion(), '42');
  });


  test('init', () async {
    final pluginWizzitdigitalPlugin = PluginWizzitdigital();
    final fakePlatform = MockPluginWizzitdigitalPlatform();
    PluginWizzitdigitalPlatform.instance = fakePlatform;

    // expect(await pluginWizzitdigitalPlugin.getPlatformVersion(), toBe('42'));
  });
}

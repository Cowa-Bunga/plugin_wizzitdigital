import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_wizzitdigital/plugin_wizzitdigital_method_channel.dart';

void main() {
  MethodChannelPluginWizzitdigital platform = MethodChannelPluginWizzitdigital();
  const MethodChannel channel = MethodChannel('plugin_wizzitdigital');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}

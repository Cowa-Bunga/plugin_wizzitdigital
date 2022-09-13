import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'plugin_wizzitdigital_platform_interface.dart';

/// An implementation of [PluginWizzitdigitalPlatform] that uses method channels.
class MethodChannelPluginWizzitdigital extends PluginWizzitdigitalPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('plugin_wizzitdigital');

  final onCreateEventChannel = const EventChannel('onCreate');
  final onResumeEventChannel = const EventChannel('onResume');
  final onAdapterInitializingEventChannel = const EventChannel(
    'onAdapterInitializing',
  );
  final onSessionInitCompleteEventChannel = const EventChannel(
    'onSessionInitComplete',
  );
  final onSessionCountdownEventChannel = const EventChannel(
    'onSessionCountdown',
  );
  final onSessionTimeoutEventChannel = const EventChannel('onSessionTimeout');
  final onCardProcessingEventChannel = const EventChannel('onCardProcessing');
  final onCardProcessingCompleteEventChannel = const EventChannel(
    'onCardProcessingComplete',
  );
  final onCardProcessingNotifyEventChannel = const EventChannel(
    'onCardProcessingNotify',
  );
  final onCardRemovedEventChannel = const EventChannel('onCardRemoved');
  final onCheckDeviceRegistrationCompleteEventChannel = const EventChannel(
    'onCheckDeviceRegistrationComplete',
  );
  final onDeviceRegistrationCompleteEventChannel = const EventChannel(
    'onDeviceRegistrationComplete',
  );
  final onSessionCompleteEventChannel = const EventChannel('onSessionComplete');

  @override
  Future<String?> getPlatformVersion() async {
    return methodChannel.invokeMethod<String>('getPlatformVersion');
  }

  @override
  Future<void> init() async {
    print("calling init");
    return methodChannel.invokeMethod<void>('init');
  }

  @override
  Stream<int> onCreate() {
    return onCreateEventChannel.receiveBroadcastStream().cast();
  }

  @override
  Stream<int> onResume() {
    return onResumeEventChannel.receiveBroadcastStream().cast();
  }

  @override
  Stream<int> onAdapterInitializing() {
    return onAdapterInitializingEventChannel.receiveBroadcastStream().cast();
  }

  @override
  Stream<int> onSessionInitComplete() {
    return onSessionInitCompleteEventChannel.receiveBroadcastStream().cast();
  }

  @override
  Stream<int> onSessionCountdown() {
    return onSessionCountdownEventChannel.receiveBroadcastStream().cast();
  }

  @override
  Stream<int> onSessionTimeout() {
    return onSessionTimeoutEventChannel.receiveBroadcastStream().cast();
  }

  @override
  Stream<int> onCardProcessing() {
    return onCardProcessingEventChannel.receiveBroadcastStream().cast();
  }

  @override
  Stream<int> onCardProcessingComplete() {
    return onCardProcessingCompleteEventChannel.receiveBroadcastStream().cast();
  }

  @override
  Stream<int> onCardProcessingNotify() {
    return onCardProcessingNotifyEventChannel.receiveBroadcastStream().cast();
  }

  @override
  Stream<int> onCardRemoved() {
    return onCardRemovedEventChannel.receiveBroadcastStream().cast();
  }

  @override
  Stream<int> onCheckDeviceRegistrationComplete() {
    return onCheckDeviceRegistrationCompleteEventChannel
        .receiveBroadcastStream()
        .cast();
  }

  @override
  Stream<int> onDeviceRegistrationComplete() {
    return onDeviceRegistrationCompleteEventChannel
        .receiveBroadcastStream()
        .cast();
  }

  @override
  Stream<int> onSessionComplete() {
    return onSessionCompleteEventChannel.receiveBroadcastStream().cast();
  }
}

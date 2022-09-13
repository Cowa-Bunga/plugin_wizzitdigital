package com.loop.plugin_wizzitdigital

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

data class Events(
    var onCreate: EventChannel,
    var onResume: EventChannel,
    var onAdapterInitializing: EventChannel,
    var onAdapterInitComplete: EventChannel,
    var onSessionInitComplete: EventChannel,
    var onSessionCountdown: EventChannel,
    var onSessionTimeout: EventChannel,
    var onCardProcessing: EventChannel,
    var onCardProcessingComplete: EventChannel,
    var onCardProcessingNotify: EventChannel,
    var onCardRemoved: EventChannel,
    var onCheckDeviceRegistrationComplete: EventChannel,
    var onDeviceRegistrationComplete: EventChannel,
    var onSessionComplete: EventChannel,
)

/** WizzitdigitalPlugin */
class WizzitdigitalPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var tapToPay: TapToPay

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "plugin_wizzitdigital")
        channel.setMethodCallHandler(this)

        val onCreate = EventChannel(flutterPluginBinding.binaryMessenger, "onCreate")
        val onResume = EventChannel(flutterPluginBinding.binaryMessenger, "onResume")
        val onAdapterInitializing = EventChannel(flutterPluginBinding.binaryMessenger, "onAdapterInitializing")
        val onAdapterInitComplete = EventChannel(flutterPluginBinding.binaryMessenger, "onAdapterInitComplete")
        val onSessionInitComplete = EventChannel(flutterPluginBinding.binaryMessenger, "onSessionInitComplete")
        val onSessionCountdown = EventChannel(flutterPluginBinding.binaryMessenger, "onSessionCountdown")
        val onSessionTimeout = EventChannel(flutterPluginBinding.binaryMessenger, "onSessionTimeout")
        val onCardProcessing = EventChannel(flutterPluginBinding.binaryMessenger, "onCardProcessing")
        val onCardProcessingComplete = EventChannel(flutterPluginBinding.binaryMessenger, "onCardProcessingComplete")
        val onCardProcessingNotify = EventChannel(flutterPluginBinding.binaryMessenger, "onCardProcessingNotify")
        val onCardRemoved = EventChannel(flutterPluginBinding.binaryMessenger, "onCardRemoved")
        val onCheckDeviceRegistrationComplete =
            EventChannel(flutterPluginBinding.binaryMessenger, "onCheckDeviceRegistrationComplete")
        val onDeviceRegistrationComplete =
            EventChannel(flutterPluginBinding.binaryMessenger, "onDeviceRegistrationComplete")
        val onSessionComplete = EventChannel(flutterPluginBinding.binaryMessenger, "onSessionComplete")
    
        tapToPay = TapToPay(
            Events(
                onCreate,
                onResume,
                onAdapterInitializing,
                onAdapterInitComplete,
                onSessionInitComplete,
                onSessionCountdown,
                onSessionTimeout,
                onCardProcessing,
                onCardProcessingComplete,
                onCardProcessingNotify,
                onCardRemoved,
                onCheckDeviceRegistrationComplete,
                onDeviceRegistrationComplete,
                onSessionComplete,
            )
        )
    }

    // New

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        // Leave this one as as simple test calle
        if (call.method.equals("getPlatformVersion")) {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else if (call.method.equals("init")) {
            tapToPay.onCreate(null)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}

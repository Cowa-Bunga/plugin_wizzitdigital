package com.loop.plugin_wizzitdigital

import android.os.Bundle
import android.provider.Settings
import com.wizzitdigital.emv.sdk.*
import androidx.appcompat.app.AppCompatActivity
import io.flutter.plugin.common.EventChannel

class TapToPay(var events: Events): AppCompatActivity(), EMVAdapterListener {
    private lateinit var emvAdapter: EMVAdapter
    private var deviceId: String = ""

    public override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        println("INITIALIZING ADAPTER")
        try {
            emvAdapter = EMVAdapter(this, null)

            println("CHECKPOINT CHECKING DEVICE REGISTRATION")
            deviceId = Settings.Secure.getString(contentResolver, Settings.Secure.ANDROID_ID)
            emvAdapter.checkDeviceRegistration()
            println("ADAPTER INITIALIZED")
        } catch (ex: Exception) {
            println("ERROR INITIALIZING ADAPTER: ${ex.message}")
        }
    }

    override fun onResume() {
        super.onResume()
        events.onResume.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                events?.success("event")
            }

            override fun onCancel(arguments: Any?) {
            }
        })
    }

    // Deprecated
    override fun onAdapterInitializing() {}

    override fun onAdapterInitComplete(isInitialized: Boolean, reason: String) {
        println("CHECKPOINT - RECEIVED ADAPTER INITIALIZED EVENT. ISINITIALIZED: $isInitialized")
        if (isInitialized) {
            events.onAdapterInitComplete.setStreamHandler(object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    events?.success("event")
                }

                override fun onCancel(arguments: Any?) {
                }
            })
        }
    }

    override fun onSessionInitComplete(isInitialized: Boolean, reason: String) {}

    override fun onSessionCountdown(remainingSeconds: Int) {}

    override fun onSessionTimeout() {}

    override fun onCardProcessing() {}

    override fun onCardProcessingComplete() {}

    override fun onCardProcessingNotify(message: String) {}

    override fun onCardRemoved() {}

    override fun onCheckDeviceRegistrationComplete(
        isRegistered: Boolean,
        reason: String,
        merchantId: String,
        merchantCode: String,
        merchantName: String,
        terminalId: String
    ) {}

    override fun onDeviceRegistrationComplete(isRegistered: Boolean, reason: String) {}

    override fun onSessionComplete(
        isSuccessful: Boolean,
        statusCode: String,
        reason: String,
        sessionData: Map<String, String>
    ) {}
}

package com.loop.plugin_wizzitdigital

import android.app.Activity
import android.content.Intent
import android.provider.ContactsContract
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.Registrar

class WizzitdigitalPlugin : FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {

    val TRIGGER_TJ = 36
    var act: Activity? = null
    private lateinit var channel: MethodChannel
    private lateinit var result: Result

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "plugin_wizzitdigital")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        this.result = result
        if (call.method == "init") {
            val intent = Intent("com.wizzitdigital.emv.sdk.EMVCONFIG")
            val config = call.arguments as Map<String, Any>

            for ((key, value) in config) {
                intent!!.putExtra(key, value)
            }

            act?.startActivityForResult(intent, TRIGGER_TJ)
        } else if (call.method == "transaction") {
            val intent = Intent("com.wizzitdigital.emv.sdk.EMVTX")
            val config = call.arguments as Map<String, Any>

            for ((key, value) in config) {
                intent!!.putExtra(key, value)
            }

            act?.startActivityForResult(intent, TRIGGER_TJ)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        act = binding.activity
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        act = null;
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        act = binding.activity
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivity() {
        act = null;
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode == TRIGGER_TJ) {
            if (resultCode == Activity.RESULT_OK) {
                println("we have landed in the success area")
                var resultMap = mutableMapOf<String, Any>()
                val bundle = data?.extras

                val keys = if (bundle?.keySet() == null) {
                    listOf()
                } else {
                    bundle.keySet()
                }
                for (key in keys) {
                    val value = bundle?.get(key)
                    val resultValue = if (value == null) "null" else value as Any
                    println("CHECKPOINT Sending app received ${key}: ${resultValue.toString()}")
                    resultMap.put(key, resultValue)

                }
                
                result.success(resultMap.toMap<String, Any>())
            }
        }
        return true
    }


    private fun Intent.putExtra(key: String, value: Any) {
        when (value) {
            is String ->
                putExtra(key, value.toString())

            is Int ->
                putExtra(key, value.toInt())

            is Byte ->
                putExtra(key, value.toByte())

            is Char ->
                putExtra(key, value.toChar())

            is Short ->
                putExtra(key, value.toShort())

            is Double ->
                putExtra(key, value.toDouble())

            is Boolean ->
                putExtra(key, value)
        }
    }
}

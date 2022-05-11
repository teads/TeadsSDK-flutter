package tv.teads.teadssdkflutter.teads_sdk_flutter

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** TeadsSdkFlutterPlugin */
class TeadsSdkFlutterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channelAdPlacementSettings : MethodChannel
  private lateinit var channelAdRequestSettings : MethodChannel
  private lateinit var channelTeads : MethodChannel
  private lateinit var channelTeadsAd :MethodChannel
  private lateinit var channelInReadAdPlacement: MethodChannel


  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    //FLTAdPlacementSettings Handler
    channelAdPlacementSettings = MethodChannel(flutterPluginBinding.binaryMessenger, "teads_sdk_flutter/teads_ad_placement_settings")
    channelAdPlacementSettings.setMethodCallHandler(FLTAdPlacementSettings())
    //FLTAdRequestSettings Handler
    channelAdRequestSettings = MethodChannel(flutterPluginBinding.binaryMessenger, "teads_sdk_flutter/teads_ad_request_settings")
    channelAdRequestSettings.setMethodCallHandler(FLTAdRequestSettings())
    //FLTTeads Handler
    channelTeads = MethodChannel(flutterPluginBinding.binaryMessenger, "teads_sdk_flutter/teads")
    channelTeads.setMethodCallHandler(FLTTeads(flutterPluginBinding.applicationContext))
    //FLTAd Handler
    channelTeadsAd= MethodChannel(flutterPluginBinding.binaryMessenger,"teads_sdk_flutter/teads_ad")
    channelTeadsAd.setMethodCallHandler(FLTAd())
    //FLTInReadAdPlacement
    channelInReadAdPlacement= MethodChannel(flutterPluginBinding.binaryMessenger,"teads_sdk_flutter/teads_inread_ad_placement")
    channelInReadAdPlacement.setMethodCallHandler(FLTInReadAdPlacement(channelInReadAdPlacement,channelTeadsAd))

  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
      result.notImplemented()
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channelAdPlacementSettings.setMethodCallHandler(null)
  }
}

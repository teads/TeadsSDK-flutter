package tv.teads.teadssdkflutter.teads_sdk_flutter

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel

/** TeadsSdkFlutterPlugin */
class TeadsSdkFlutterPlugin : FlutterPlugin {
    private lateinit var adPlacementSettingsChannel: MethodChannel
    private lateinit var adRequestSettingsChannel: MethodChannel
    private lateinit var teadsChannel: MethodChannel
    private lateinit var teadsAdChannel: MethodChannel
    private lateinit var teadsAdViewChannel: MethodChannel
    private lateinit var inReadAdPlacementChannel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        //FLTAdPlacementSettings Handler
        adPlacementSettingsChannel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            "teads_sdk_flutter/teads_ad_placement_settings"
        )
        adPlacementSettingsChannel.setMethodCallHandler(FLTAdPlacementSettings())

        //FLTAdRequestSettings Handler
        adRequestSettingsChannel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            "teads_sdk_flutter/teads_ad_request_settings"
        )
        adRequestSettingsChannel.setMethodCallHandler(FLTAdRequestSettings())

        //FLTTeads Handler
        teadsChannel =
            MethodChannel(flutterPluginBinding.binaryMessenger, "teads_sdk_flutter/teads")
        teadsChannel.setMethodCallHandler(FLTTeads(flutterPluginBinding.applicationContext))

        //FLTAd Handler
        teadsAdChannel =
            MethodChannel(flutterPluginBinding.binaryMessenger, "teads_sdk_flutter/teads_ad")
        teadsAdChannel.setMethodCallHandler(FLTAd())

        //FLTInReadAdPlacement Handler
        inReadAdPlacementChannel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            "teads_sdk_flutter/teads_inread_ad_placement"
        )
        inReadAdPlacementChannel.setMethodCallHandler(
            FLTInReadAdPlacement(
                inReadAdPlacementChannel,
                teadsAdChannel
            )
        )

        //FLTInReadAdView Hander
        teadsAdViewChannel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            "teads_sdk_flutter/teads_ad_view"
        )
        val fltInReadAdView = FLTTeadsInReadAdView()
        teadsAdViewChannel.setMethodCallHandler(fltInReadAdView)

        flutterPluginBinding
            .platformViewRegistry
            .registerViewFactory(
                "FLTTeadsInReadAdView",
                FLTTeadsInReadAdViewFactory(fltInReadAdView)
            )

    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        adPlacementSettingsChannel.setMethodCallHandler(null)
        adRequestSettingsChannel.setMethodCallHandler(null)
        teadsChannel.setMethodCallHandler(null)
        teadsAdChannel.setMethodCallHandler(null)
        inReadAdPlacementChannel.setMethodCallHandler(null)
    }
}

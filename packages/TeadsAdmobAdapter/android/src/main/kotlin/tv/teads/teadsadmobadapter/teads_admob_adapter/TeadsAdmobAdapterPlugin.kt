package tv.teads.teadsadmobadapter.teads_admob_adapter

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel

/** TeadsAdmobAdapterPlugin */
class TeadsAdmobAdapterPlugin: FlutterPlugin {
  private lateinit var adapterSettingsChannel: MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    adapterSettingsChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "teads_admob_adapter/teads_adapter_settings")
    adapterSettingsChannel.setMethodCallHandler(FLTTeadsAdapterSettings.instance)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    adapterSettingsChannel.setMethodCallHandler(null)
  }
}

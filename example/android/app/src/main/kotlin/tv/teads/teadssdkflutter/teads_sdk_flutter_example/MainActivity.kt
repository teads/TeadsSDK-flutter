package tv.teads.teadssdkflutter.teads_sdk_flutter_example

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import tv.teads.teadssdkflutter.teads_sdk_flutter.TeadsSdkFlutterPlugin

class MainActivity: FlutterActivity() {

    private val factoryId = "exampleNativeAd"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        TeadsSdkFlutterPlugin.registerNativeAdViewFactory(factoryId, TeadsNativeAdViewFactory(context))
    }

    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        super.cleanUpFlutterEngine(flutterEngine)

        TeadsSdkFlutterPlugin.unregisterNativeAdViewFactory(factoryId)
    }

}

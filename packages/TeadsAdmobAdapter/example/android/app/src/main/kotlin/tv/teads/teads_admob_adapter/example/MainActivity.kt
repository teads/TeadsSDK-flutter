package tv.teads.teads_admob_adapter.example

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin
import tv.teads.teadsadmobadapter.teads_admob_adapter.FLTTeadsMediationInReadNetworkExtras

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Register your MediationNetworkExtrasProvider to provide network extras to ad requests.
        GoogleMobileAdsPlugin.registerMediationNetworkExtrasProvider(
            flutterEngine, FLTTeadsMediationInReadNetworkExtras()
        )
    }
}

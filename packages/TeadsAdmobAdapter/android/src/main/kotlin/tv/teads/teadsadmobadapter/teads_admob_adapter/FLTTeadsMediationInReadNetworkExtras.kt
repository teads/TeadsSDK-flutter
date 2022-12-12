package tv.teads.teadsadmobadapter.teads_admob_adapter

import android.os.Bundle

import com.google.android.gms.ads.mediation.MediationExtrasReceiver

import io.flutter.plugins.googlemobileads.MediationNetworkExtrasProvider
import tv.teads.adapter.admob.TeadsAdapter

class FLTTeadsMediationInReadNetworkExtras : MediationNetworkExtrasProvider {
    override fun getMediationExtras(adUnitId: String, identifier: String?): Map<Class<out MediationExtrasReceiver?>, Bundle>? {
        val teadsBundle: Bundle = FLTTeadsAdapterSettings.instance.mediationSettingsBuilder.build().toBundle()
        val extras: MutableMap<Class<out MediationExtrasReceiver?>, Bundle> = HashMap()
        extras[TeadsAdapter::class.java] = teadsBundle
        return extras
    }
}
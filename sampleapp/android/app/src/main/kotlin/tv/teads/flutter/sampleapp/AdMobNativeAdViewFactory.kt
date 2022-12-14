package tv.teads.flutter.sampleapp

import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import com.google.android.gms.ads.nativead.MediaView
import com.google.android.gms.ads.nativead.NativeAd
import com.google.android.gms.ads.nativead.NativeAdView
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin


class AdMobNativeAdViewFactory(private val layoutInflater: LayoutInflater): GoogleMobileAdsPlugin.NativeAdFactory {
    override fun createNativeAd(
        nativeAd: NativeAd?,
        customOptions: MutableMap<String, Any>?
    ): NativeAdView {
        val adView = layoutInflater.inflate(R.layout.admob_native_ad_view, null) as NativeAdView
        // Set the media view. Media content will be automatically populated in the media view once
        // adView.setNativeAd() is called.
        val mediaView: MediaView = adView.findViewById(R.id.ad_mob_media)
        adView.mediaView = mediaView

        // Set other ad assets.
        adView.headlineView = adView.findViewById(R.id.ad_mob_headline)
        adView.bodyView = adView.findViewById(R.id.ad_mob_body)
        adView.callToActionView = adView.findViewById(R.id.ad_mob_cta)
        adView.iconView = adView.findViewById(R.id.ad_mob_icon)
        adView.advertiserView = adView.findViewById(R.id.ad_mob_sponsor)

        // The headline is guaranteed to be in every NativeAd.
        (adView.headlineView as TextView).text = nativeAd?.headline

        // These assets aren't guaranteed to be in every NativeAd, so it's important to
        // check before trying to display them.
        if (nativeAd?.body == null) {
            adView.bodyView?.visibility = View.INVISIBLE
        } else {
            adView.bodyView?.visibility = View.VISIBLE
            (adView.bodyView as TextView).text = nativeAd.body
        }
        if (nativeAd?.callToAction == null) {
            adView.callToActionView?.visibility = View.INVISIBLE
        } else {
            adView.callToActionView?.visibility = View.VISIBLE
            (adView.callToActionView as Button).text = nativeAd.callToAction
        }
        if (nativeAd?.icon == null) {
            adView.iconView?.visibility = View.GONE
        } else {
            (adView.iconView as ImageView).setImageDrawable(
                nativeAd.icon?.drawable)
            adView.iconView?.visibility = View.VISIBLE
        }
        if (nativeAd?.advertiser == null) {
            adView.advertiserView?.visibility = View.INVISIBLE
        } else {
            (adView.advertiserView as TextView).text = nativeAd.advertiser
            adView.advertiserView?.visibility = View.VISIBLE
        }

        // This method tells the Google Mobile Ads SDK that you have finished populating your
        // native ad view with this native ad. The SDK will populate the adView's MediaView
        // with the media content from this native ad.
        adView.setNativeAd(nativeAd!!)

        return adView
    }
}
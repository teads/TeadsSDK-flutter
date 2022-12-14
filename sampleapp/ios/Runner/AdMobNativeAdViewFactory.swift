//
//  AdMobNativeAdViewFactory.swift
//  Runner
//
//  Created by Thibaud Saint-Etienne on 17/11/2022.
//

import TeadsSDK
import google_mobile_ads

class AdMobNativeAdViewFactory: FLTNativeAdFactory {
    func createNativeAd(_ nativeAd: GADNativeAd, customOptions: [AnyHashable : Any]? = nil) -> GADNativeAdView? {        
        guard let nibView = Bundle.main.loadNibNamed("AdMobNativeAdView", owner: nil, options: nil)?.first,
              let nativeAdView = nibView as? GADNativeAdView else {
            return nil
        }
        
        // Populate the native ad view with the native ad assets.
        // The headline and mediaContent are guaranteed to be present in every native ad.
        (nativeAdView.headlineView as? UILabel)?.text = nativeAd.headline
        nativeAdView.mediaView?.mediaContent = nativeAd.mediaContent

        // These assets are not guaranteed to be present. Check that they are before
        // showing or hiding them.
        (nativeAdView.bodyView as? UILabel)?.text = nativeAd.body
        nativeAdView.bodyView?.isHidden = nativeAd.body == nil

        (nativeAdView.callToActionView as? UIButton)?.setTitle(nativeAd.callToAction, for: .normal)
        nativeAdView.callToActionView?.isHidden = nativeAd.callToAction == nil

        (nativeAdView.iconView as? UIImageView)?.image = nativeAd.icon?.image
        nativeAdView.iconView?.isHidden = nativeAd.icon == nil

        (nativeAdView.advertiserView as? UILabel)?.text = nativeAd.advertiser
        nativeAdView.advertiserView?.isHidden = nativeAd.advertiser == nil

        // In order for the SDK to process touch events properly, user interaction should be disabled.
        nativeAdView.callToActionView?.isUserInteractionEnabled = false

        // Associate the native ad view with the native ad object. This is
        // required to make the ad clickable.
        // Note: this should always be done after populating the ad views.
        nativeAdView.nativeAd = nativeAd
        
        // media view
        nativeAdView.mediaView?.layer.cornerRadius = 20
        nativeAdView.mediaView?.layer.masksToBounds = true
        // call to action
        nativeAdView.callToActionView?.layer.cornerRadius = 16
        // icon
        nativeAdView.iconView?.layer.cornerRadius = 30

        return nativeAdView
    }

    
}

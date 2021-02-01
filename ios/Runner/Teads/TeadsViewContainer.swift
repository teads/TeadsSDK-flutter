//
//  TeadsViewContainer.swift
//  Runner
//
//  Created by Maxime Liège on 20/01/2021.
//

import TeadsSDK

class TeadsViewContainer: NSObject, FlutterPlatformView, TFAAdDelegate {

    private var adView: TFACustomAdView? = nil
    private var methodChannel: FlutterMethodChannel? = nil

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        super.init()
        
        if let messenger = messenger {
            methodChannel = FlutterMethodChannel(name: "TeadsView/\(viewId)", binaryMessenger: messenger)
        }
        guard let settings = args as? [String:Any] else {
            print("Settings from flutter are not defined")
            return
        }
        
        let adSettings = try? TeadsAdSettings.instance(from: settings)
        
        guard let pid = settings["pid"] as? Int else {
            print("No PID were provided in settings")
            return
        }
            
        adView = TFACustomAdView(withPid: pid, andDelegate: self)
        adView?.load(teadsAdSettings: adSettings)
    }

    func view() -> UIView {
        return adView ?? UIView()
    }
    
    func didReceiveAd(_ ad: TFAAdView, adRatio: CGFloat) {
        methodChannel?.invokeMethod("OnRatioUpdated", arguments: adRatio)
    }
    
    func didFailToReceiveAd(_ ad: TFAAdView, adFailReason: AdFailReason) {
        
    }
    
    func adClose(_ ad: TFAAdView, userAction: Bool) {
        
    }
    
    func adError(_ ad: TFAAdView, errorMessage: String) {
        
    }
    
    func didUpdateRatio(_ ad: TFAAdView, ratio: CGFloat) {
        methodChannel?.invokeMethod("OnRatioUpdated", arguments: ratio)
    }
}

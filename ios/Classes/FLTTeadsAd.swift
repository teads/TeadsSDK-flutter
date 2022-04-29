//
//  FLTTeadsAd.swift
//  teads_sdk_flutter
//
//  Created by Thibaud Saint-Etienne on 28/04/2022.
//

import Flutter
import TeadsSDK

public class FLTTeadsAd: NSObject, FlutterPlugin {
    
    static var channel: FlutterMethodChannel?
        
    public static func register(with registrar: FlutterPluginRegistrar) {
        channel = FlutterMethodChannel(name: "teads_sdk_flutter/teads_ad", binaryMessenger: registrar.messenger())
        let instance = FLTTeadsAd()
        if let channel = channel {
          registrar.addMethodCallDelegate(instance, channel: channel)
        }
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch(call.method) {
        case "delegate":
            FLTTeadsInReadAdPlacement.teadsAd?.delegate = self
            result("")
        case "playbackDelegate":
            FLTTeadsInReadAdPlacement.teadsAd?.playbackDelegate = self
            result("")
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

extension FLTTeadsAd: TeadsAdDelegate {
    public func willPresentModalView(ad: TeadsAd) -> UIViewController? {
        guard let viewController = UIApplication.shared.delegate?.window??.rootViewController as? FlutterViewController else {
            return UIViewController()
        }
        Self.channel?.invokeMethod("willPresentModalView", arguments: [])
        return viewController
    }
    
    public func didCatchError(ad: TeadsAd, error: Error) {
        Self.channel?.invokeMethod("didCatchError", arguments: [])
    }
    
    public func didClose(ad: TeadsAd) {
        Self.channel?.invokeMethod("didClose", arguments: [])
    }
    
    public func didRecordImpression(ad: TeadsAd) {
        Self.channel?.invokeMethod("didRecordImpression", arguments: [])
    }
    
    public func didRecordClick(ad: TeadsAd) {
        Self.channel?.invokeMethod("didRecordClick", arguments: [])
    }
    
    public func didExpandedToFullscreen(ad: TeadsAd) {
        Self.channel?.invokeMethod("didExpandedToFullscreen", arguments: [])
    }
    
    public func didCollapsedFromFullscreen(ad: TeadsAd) {
        Self.channel?.invokeMethod("didCollapsedFromFullscreen", arguments: [])
    }
    
}

extension FLTTeadsAd: TeadsPlaybackDelegate {
    
    public func adStopPlayingAudio(_ ad: TeadsAd) {
        Self.channel?.invokeMethod("adStopPlayingAudio", arguments: [])
    }
    
    public func adStartPlayingAudio(_ ad: TeadsAd) {
        Self.channel?.invokeMethod("adStartPlayingAudio", arguments: [])
    }
    
    public func didPlay(_ ad: TeadsAd) {
        Self.channel?.invokeMethod("didPlay", arguments: [])
    }
    
    public func didPause(_ ad: TeadsAd) {
        Self.channel?.invokeMethod("didPause", arguments: [])
    }
    
    public func didComplete(_ ad: TeadsAd) {
        Self.channel?.invokeMethod("didComplete", arguments: [])
    }
    
}

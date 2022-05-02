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
            if let args = call.arguments as? [Any],
               let requestIdentifier = args[0] as? String {
                do {
                    try FLTTeadsAdInstanceManager.shared.instance(for: requestIdentifier).teadsAd.delegate = self
                    result(nil)
                } catch {
                    result(FlutterError.noAdInstance)
                }
            } else {
                result(FlutterError.badArguments)
            }
        case "playbackDelegate":
            if let args = call.arguments as? [Any],
               let requestIdentifier = args[0] as? String {
                do {
                    try FLTTeadsAdInstanceManager.shared.instance(for: requestIdentifier).teadsAd.playbackDelegate = self
                    result(nil)
                } catch {
                    result(FlutterError.noAdInstance)
                }
            } else {
                result(FlutterError.badArguments)
            }
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
        Self.channel?.invokeMethod("willPresentModalView", arguments: [ad.requestIdentifier.uuidString])
        return viewController
    }
    
    public func didCatchError(ad: TeadsAd, error: Error) {
        Self.channel?.invokeMethod("didCatchError", arguments: [ad.requestIdentifier.uuidString, error.localizedDescription])
    }
    
    public func didClose(ad: TeadsAd) {
        Self.channel?.invokeMethod("didClose", arguments: [ad.requestIdentifier.uuidString])
    }
    
    public func didRecordImpression(ad: TeadsAd) {
        Self.channel?.invokeMethod("didRecordImpression", arguments: [ad.requestIdentifier.uuidString])
    }
    
    public func didRecordClick(ad: TeadsAd) {
        Self.channel?.invokeMethod("didRecordClick", arguments: [ad.requestIdentifier.uuidString])
    }
    
    public func didExpandedToFullscreen(ad: TeadsAd) {
        Self.channel?.invokeMethod("didExpandedToFullscreen", arguments: [ad.requestIdentifier.uuidString])
    }
    
    public func didCollapsedFromFullscreen(ad: TeadsAd) {
        Self.channel?.invokeMethod("didCollapsedFromFullscreen", arguments: [ad.requestIdentifier.uuidString])
    }
    
}

extension FLTTeadsAd: TeadsPlaybackDelegate {
    
    public func adStopPlayingAudio(_ ad: TeadsAd) {
        Self.channel?.invokeMethod("adStopPlayingAudio", arguments: [ad.requestIdentifier.uuidString])
    }
    
    public func adStartPlayingAudio(_ ad: TeadsAd) {
        Self.channel?.invokeMethod("adStartPlayingAudio", arguments: [ad.requestIdentifier.uuidString])
    }
    
    public func didPlay(_ ad: TeadsAd) {
        Self.channel?.invokeMethod("didPlay", arguments: [ad.requestIdentifier.uuidString])
    }
    
    public func didPause(_ ad: TeadsAd) {
        Self.channel?.invokeMethod("didPause", arguments: [ad.requestIdentifier.uuidString])
    }
    
    public func didComplete(_ ad: TeadsAd) {
        Self.channel?.invokeMethod("didComplete", arguments: [ad.requestIdentifier.uuidString])
    }
    
}

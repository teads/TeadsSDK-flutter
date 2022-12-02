//
//  FLTTeadsInReadAdPlacement.swift
//  teads_sdk_flutter
//
//  Created by Thibaud Saint-Etienne on 28/04/2022.
//

import Flutter
import TeadsSDK

public class FLTTeadsAdPlacement: NSObject, TeadsAdPlacementDelegate {
    
    let channel: FlutterMethodChannel
    
    init(channel: FlutterMethodChannel) {
        self.channel = channel
    }
    
    public func didFailToReceiveAd(reason: AdFailReason) {
        channel.invokeMethod("didFailToReceiveAd", arguments: [reason.localizedDescription])
    }
    
    public func adOpportunityTrackerView(trackerView: TeadsAdOpportunityTrackerView) {
        // Nothing for now
    }
    
    public func didLogMessage(message: String) {
        channel.invokeMethod("didLogMessage", arguments: [message])
    }
    
}

// MARK: InRead Ad Placement

public class FLTTeadsInReadAdPlacement: FLTTeadsAdPlacement, FlutterPlugin {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "teads_sdk_flutter/teads_ad_placement/inread", binaryMessenger: registrar.messenger())
        let instance = FLTTeadsInReadAdPlacement(channel: channel)
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "requestAd":
            if let args = call.arguments as? [Any],
               let settingsMap = args[0] as? [String: Any],
               let data = try? JSONSerialization.data(withJSONObject: settingsMap, options: .prettyPrinted) {
                let decoder = JSONDecoder()
                if let settings = try? decoder.decode(TeadsAdRequestSettings.self, from: data) {
                    FLTTeadsInReadAdInstanceManager.shared.placement?.delegate = self
                    if let id = FLTTeadsInReadAdInstanceManager.shared.placement?.requestAd(requestSettings: settings) {
                        result(id.uuidString)
                    } else {
                        result(FlutterError())
                    }
                }
            } else {
                result(FlutterError.badArguments)
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
}

extension FLTTeadsInReadAdPlacement: TeadsInReadAdPlacementDelegate {
    
    public func didReceiveAd(ad: TeadsInReadAd, adRatio: TeadsAdRatio) {
        FLTTeadsInReadAdInstanceManager.shared.new(instance: FLTInReadAdInstanceMap(teadsAd: ad, adRatio: adRatio))
        channel.invokeMethod("didReceiveAd", arguments: [ad.requestIdentifier.uuidString])
    }
    
    public func didUpdateRatio(ad: TeadsInReadAd, adRatio: TeadsAdRatio) {
        channel.invokeMethod("didUpdateRatio", arguments: [ad.requestIdentifier.uuidString])
    }
    
}

// MARK: Native Ad Placement

public class FLTTeadsNativeAdPlacement: FLTTeadsAdPlacement, FlutterPlugin {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "teads_sdk_flutter/teads_ad_placement/native", binaryMessenger: registrar.messenger())
        let instance = FLTTeadsNativeAdPlacement(channel: channel)
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "requestAd":
            if let args = call.arguments as? [Any],
               let settingsMap = args[0] as? [String: Any],
               let data = try? JSONSerialization.data(withJSONObject: settingsMap, options: .prettyPrinted) {
                let decoder = JSONDecoder()
                if let settings = try? decoder.decode(TeadsAdRequestSettings.self, from: data) {
                    FLTTeadsNativeAdInstanceManager.shared.placement?.delegate = self
                    if let id = FLTTeadsNativeAdInstanceManager.shared.placement?.requestAd(requestSettings: settings) {
                        result(id.uuidString)
                    } else {
                        result(FlutterError())
                    }
                }
            } else {
                result(FlutterError.badArguments)
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

extension FLTTeadsNativeAdPlacement: TeadsNativeAdPlacementDelegate {
    
    public func didReceiveAd(ad: TeadsNativeAd) {
        FLTTeadsNativeAdInstanceManager.shared.new(ad: ad)
        channel.invokeMethod("didReceiveAd", arguments: [ad.requestIdentifier.uuidString])
    }
    
}

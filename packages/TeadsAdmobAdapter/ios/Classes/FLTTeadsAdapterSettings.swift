//
//  FLTTeadsAdapterSettings.swift
//  teads_admob_adapter
//
//  Created by Thibaud Saint-Etienne on 17/10/2022.
//

import Flutter
import TeadsSDK
import GoogleMobileAds

public class FLTTeadsAdapterSettings: NSObject, FlutterPlugin {

    static let instance = FLTTeadsAdapterSettings()
    
    var adapterSettings: TeadsAdapterSettings = {
        let settings = TeadsAdapterSettings()
        settings.addExtras(TeadsAdPlacementSettings.pluginFlutter, for: TeadsAdPlacementSettings.pluginKey)
        // Fluter version is always 1.0.0
        settings.addExtras("1.0.0", for: TeadsAdPlacementSettings.pluginVersionKey)
        return settings
    }()
    
    static var channel: FlutterMethodChannel?

    public static func register(with registrar: FlutterPluginRegistrar) {
        channel = FlutterMethodChannel(name: "teads_admob_adapter/teads_adapter_settings", binaryMessenger: registrar.messenger())
        if let channel = channel {
            registrar.addMethodCallDelegate(instance, channel: channel)
        }
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "disableCrashMonitoring":
            adapterSettings.disableCrashMonitoring()
            result(try? adapterSettings.asDictionary())
        case "disableTeadsAudioSessionManagement":
            adapterSettings.disableTeadsAudioSessionManagement()
            result(try? adapterSettings.asDictionary())
        case "userConsent":
            if let args = call.arguments as? [Any],
               let subjectToGDPR = args[0] as? String,
               let consent = args[1] as? String,
               let tcfVersionRawValue = args[2] as? Int,
               let tcfVersion = TCFVersion(rawValue: tcfVersionRawValue),
               let cmpSdkID = args[3] as? Int {
                adapterSettings.userConsent(subjectToGDPR: subjectToGDPR, consent: consent, tcfVersion: tcfVersion, cmpSdkID: cmpSdkID)
                result(try? adapterSettings.asDictionary())
            } else {
                result(FlutterError.badArguments)
            }
        case "setUsPrivacy":
            if let args = call.arguments as? [Any],
               let consent = args[0] as? String {
                adapterSettings.setUsPrivacy(consent: consent)
                result(try? adapterSettings.asDictionary())
            } else {
                result(FlutterError.badArguments)
            }
        case "disableBatteryMonitoring":
            adapterSettings.disableBatteryMonitoring()
            result(try? adapterSettings.asDictionary())
        case "addExtras":
            if let args = call.arguments as? [Any],
               let value = args[0] as? String,
               let key = args[1] as? String {
                adapterSettings.addExtras(value, for: key)
                result(try? adapterSettings.asDictionary())
            } else {
                result(FlutterError.badArguments)
            }
        case "enableDebug":
            adapterSettings.enableDebug()
            result(try? adapterSettings.asDictionary())
        case "enableValidationMode":
            adapterSettings.enableValidationMode()
            result(try? adapterSettings.asDictionary())
        case "pageUrl":
            if let args = call.arguments as? [Any],
               let urlString = args[0] as? String {
                adapterSettings.pageUrl(urlString)
                result(try? adapterSettings.asDictionary())
            } else {
                result(FlutterError.badArguments)
            }
        case "setMediaScale":
            if let args = call.arguments as? [Any],
               let mediaScaleIndex = args[0] as? Int,
               let mediaScale = MediaScale(rawValue: mediaScaleIndex) {
                adapterSettings.setMediaScale(mediaScale)
                result(try? adapterSettings.asDictionary())
            } else {
                result(FlutterError.badArguments)
            }
        case "addPlacementExtra":
            // Replicate from Android
            if let args = call.arguments as? [Any],
               let value = args[0] as? String,
               let key = args[1] as? String {
                adapterSettings.adPlacementSettings.addExtras(value, for: key)
                result(try? adapterSettings.asDictionary())
            } else {
                result(FlutterError.badArguments)
            }
        case "enableLocation":
            // Android only
            result(try? adapterSettings.asDictionary())
        case "useLightEndScreen":
            // Android only
            result(try? adapterSettings.asDictionary())
        case "hideBrowserUrl":
            // Android only
            result(try? adapterSettings.asDictionary())
        case "toolBarBackgroundColor":
            // Android only
            result(try? adapterSettings.asDictionary())
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

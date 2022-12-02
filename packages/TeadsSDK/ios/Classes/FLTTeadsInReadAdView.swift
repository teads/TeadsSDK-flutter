//
//  FLTTeadsInReadAdView.swift
//  teads_sdk_flutter
//
//  Created by Thibaud Saint-Etienne on 28/04/2022.
//

import Flutter
import UIKit
import TeadsSDK

@objc
public class FLTTeadsInReadAdViewFactory: NSObject, FlutterPlatformViewFactory {
    private var methodChannel: FlutterMethodChannel
    private var inReadAdView: TeadsInReadAdView
    private var requestIdentifier: String = ""

    @objc
    public init(messenger: FlutterBinaryMessenger) {
        methodChannel = FlutterMethodChannel(name: "teads_sdk_flutter/teads_ad_view/inread", binaryMessenger: messenger)
        inReadAdView = TeadsInReadAdView()
        super.init()
        methodChannel.setMethodCallHandler({ [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
               switch(call.method) {
               case "bind":
                   if let args = call.arguments as? [Any],
                      let requestIdentifier = args[0] as? String {
                       if let instance = try? FLTTeadsInReadAdInstanceManager.shared.instance(for: requestIdentifier) {
                           self?.requestIdentifier = requestIdentifier
                           self?.inReadAdView.bind(instance.teadsAd)
                       }
                       result(nil)
                   } else {
                       result(FlutterError.badArguments)
                   }
               case "clean":
                   if let requestIdentifier = self?.requestIdentifier {
                       FLTTeadsInReadAdInstanceManager.shared.clean(with: requestIdentifier)
                   }
                   result(nil)
               default:
                   result(FlutterMethodNotImplemented)
               }
           })
    }

    public func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLTTeadsInReadAdView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            inReadAdView: inReadAdView)
    }
}

public class FLTTeadsInReadAdView: NSObject, FlutterPlatformView {
    private var inReadAdView: TeadsInReadAdView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        inReadAdView: TeadsInReadAdView
    ) {
        self.inReadAdView = inReadAdView
        super.init()
    }

    public func view() -> UIView {
        return inReadAdView
    }
    
}

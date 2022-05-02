//
//  FLTTeadsAdInstanceManager.swift
//  teads_sdk_flutter
//
//  Created by Thibaud Saint-Etienne on 02/05/2022.
//

import Foundation
import TeadsSDK

struct FLTAdInstanceMap {
  let teadsAd: TeadsInReadAd
  let adRatio: TeadsAdRatio
}

class FLTTeadsAdInstanceManager {
    static let shared = FLTTeadsAdInstanceManager()
    var placement: TeadsInReadAdPlacement?
    private var list = [FLTAdInstanceMap]()
    
    func new(instance: FLTAdInstanceMap) {
        list.append(instance)
    }
    
    func instance(for requestIdentifier: String) throws -> FLTAdInstanceMap {
        if let instance = list.first(where: { $0.teadsAd.requestIdentifier.uuidString == requestIdentifier }) {
            return instance
        } else {
            throw NSError(domain: "tv.teads.flutter.instance.error", code: 1, userInfo: ["" : ""])
        }
    }
}

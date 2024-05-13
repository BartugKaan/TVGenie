//
//  TVItem.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 12.03.2024.
//

import Foundation

class TVItem {
    let name : String
    let brand : String
    let warranty : String
    let hdmiCount : String
    let usbCount : String
    let screenSize : String
    let audioPower : String
    let refrshRate : String
    let screenResolution : String
    let powerConsumption : String
    let cost : Int
    let cpuCoreCount : String
    let wifiSpecs : String
    let screenType : String
    let isSmart : String
    let hdmiType : String
    let ciScore : String
    let rank : Int
    let imageUrl : String
    
    init(name: String, brand: String, warranty: String, hdmiCount: String, usbCount: String, screenSize: String, audioPower: String, refrshRate: String, screenResolution: String, powerConsumption: String, cost: Int, cpuCoreCount: String, wifiSpecs: String, screenType: String, isSmart: String, hdmiType: String, ciScore: String, rank: Int, imageUrl: String) {
        self.name = name
        self.brand = brand
        self.warranty = warranty
        self.hdmiCount = hdmiCount
        self.usbCount = usbCount
        self.screenSize = screenSize
        self.audioPower = audioPower
        self.refrshRate = refrshRate
        self.screenResolution = screenResolution
        self.powerConsumption = powerConsumption
        self.cost = cost
        self.cpuCoreCount = cpuCoreCount
        self.wifiSpecs = wifiSpecs
        self.screenType = screenType
        self.isSmart = isSmart
        self.hdmiType = hdmiType
        self.ciScore = ciScore
        self.rank = rank
        self.imageUrl = imageUrl
    }
    
    
    
}

//
//  Observation.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 22.04.2024.
//

import Foundation
import Vision

struct Observation {
    let label: String
    let confidence: VNConfidence
    let boundingBox: CGRect
}

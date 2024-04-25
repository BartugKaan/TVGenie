//
//  PhotoViewModel.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 15.03.2024.
//

import SwiftUI
import AVFoundation
import CoreML
import Vision


class PhotoViewModel: ObservableObject {
  @Published var showingImagePicker = false
  @Published var image: UIImage?
  @Published var resultMessage = ""
  @Published var isTelevision = false
  @Published var productName = ""
  
  
  func processImage() {
    guard let uiImage = image else { return }
    
    // Core ML modelini yükle
    guard let model = try? VNCoreMLModel(for: Resnet50().model) else {
      fatalError("Model yüklenemedi")
    }
    
    // VNImageRequestHandler oluştur
    let request = VNCoreMLRequest(model: model) { request, error in
      guard let results = request.results as? [VNClassificationObservation], let topResult = results.first else {
        fatalError("Model sonucu alınamadı")
      }
      print(topResult.identifier)
      // En yüksek sonucu kontrol et
      if topResult.identifier.contains("television") || topResult.identifier.contains("home theater") || topResult.identifier.contains("home theater") || topResult.identifier.contains("screen")
      {
        self.resultMessage = " In our system have Television"
        
      } else {
        self.resultMessage = "\(topResult.identifier) is not avaliable in our system"
      }
    }
    
    // CIImage'ı VNImageRequestHandler'a dönüştür ve işlemi gerçekleştir
    guard let ciImage = CIImage(image: uiImage) else { return }
    let handler = VNImageRequestHandler(ciImage: ciImage)
    do {
      try handler.perform([request])
    } catch {
      print(error)
    }
  }
}


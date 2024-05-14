//
//  PhotoView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 15.03.2024.
//

import SwiftUI
import Vision
import CoreML


struct PhotoView: View {
    @State private var isImagePickerPresented: Bool = false
    @State private var showResultSheet: Bool = false
    @State private var capturedImage: UIImage?
    @State private var detectedObjects: [Observation] = []
    @State private var imagePickerSourceType: UIImagePickerController.SourceType = .camera

    let model = try! YOLOv8(configuration: MLModelConfiguration())
    var body: some View {
        VStack {
            Spacer()
            Text("Please ensure that the photo you take is clear and that the object you're capturing is centered.")
                .font(.title2)
                .foregroundStyle(Color(uiColor: .systemRed))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.all, 24)
            Spacer()
            HStack(spacing: 40){
                Button(action: {
                    imagePickerSourceType = .camera
                    isImagePickerPresented.toggle()
                }, label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 75,height: 75)
                            .foregroundStyle(.linearGradient(colors: [.indigo,.pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(30)
                        Image(systemName: "camera.fill")
                            .foregroundStyle(Color.white)
                            .font(.title)
                    }
                    .padding(.top, 20)
                })
                Button(action: {
                    imagePickerSourceType = .photoLibrary
                    isImagePickerPresented.toggle()
                }, label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 75,height: 75)
                            .foregroundStyle(.linearGradient(colors: [.indigo,.pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(30)
                        Image(systemName: "photo.on.rectangle")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    .padding(.top, 20)
                })
            }
            .padding(.bottom, 8)
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(imagePickerSourceType: self.imagePickerSourceType) { image in
                                self.capturedImage = image
                                self.loadImage()
                            }
                        }
            .sheet(isPresented: $showResultSheet) {
                VStack {
                    if let image = capturedImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                            .overlay {
                                GeometryReader { geometry in
                                    Path { path in
                                        for observation in detectedObjects {
                                            path.addRect(VNImageRectForNormalizedRect(observation.boundingBox, Int(geometry.size.width), Int(geometry.size.height)))
                                        }
                                    }
                                    .stroke(Color.red, lineWidth: 1.5)
                                }
                            }
                    }
                    if !detectedObjects.isEmpty {
                        let tvDetected = detectedObjects.contains(where: { $0.label.lowercased() == "tv" })
                        if tvDetected {
                            Section {
                                ForEach(detectedObjects, id: \.label) { item in
                                    if item.label.lowercased() == "tv" {
                                        DetectedObjectRow(item: item)
                                    }
                                }
                            } header: {
                                HStack{
                                    Text("These products are available in our system")
                                        .font(.title2)
                                    Spacer()
                                }
                                .padding(.vertical, 8)
                            }
                            Section{
                                ForEach(detectedObjects, id: \.label) { item in
                                    if item.label.lowercased() != "tv" {
                                        DetectedObjectRow(item: item)
                                    }
                                }
                            } header: {
                                HStack{
                                    Text("These products are not available in our system")
                                        .font(.title2)
                                    Spacer()
                                }
                                .padding(.vertical, 8)
                            }
                        } else {
                            Section{
                                ForEach(detectedObjects, id: \.label) { item in
                                    DetectedObjectRow(item: item)
                                }
                            }
                        header: {
                            HStack{
                                Text("These products are not available in our system")
                                    .font(.title2)
                                Spacer()
                            }
                            .padding(.vertical, 8)
                        }
                        }
                    }  else {
                        VStack {
                            Text("Something goes wrong")
                            Button("Please try again!") {
                                capturedImage = nil
                                detectedObjects = []
                                showResultSheet.toggle()
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                }
                .padding(.all)
            }
        }
    }
    func loadImage() {
        let mlModel = model.model
        guard let vnCoreMLModel = try? VNCoreMLModel(for: mlModel) else { return }
        let request = VNCoreMLRequest(model: vnCoreMLModel) { request, error in
            guard let results = request.results as? [VNRecognizedObjectObservation] else { return }
            detectedObjects = results.map { result in
                guard let label = result.labels.first?.identifier else { return Observation(label: "", confidence: VNConfidence.zero, boundingBox: .zero) }
                let confidence = result.labels.first?.confidence ?? 0.0
                let boundedBox = result.boundingBox
                let observation: Observation = Observation(label: label, confidence: confidence, boundingBox: boundedBox)
                return observation
            }
            print(detectedObjects)
        }
        guard let image = capturedImage, let pixelBuffer = convertToCVPixelBuffer(newImage: image) else {
            return
        }
        let requestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer)
        do {
            try requestHandler.perform([request])
            showResultSheet.toggle()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}


#Preview {
    PhotoView()
}

struct ImagePicker: UIViewControllerRepresentable {
    var imagePickerSourceType: UIImagePickerController.SourceType
        var didFinishPicking: (UIImage) -> Void
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.didFinishPicking(uiImage)
            }
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
            let picker = UIImagePickerController()
            picker.sourceType = imagePickerSourceType
            picker.delegate = context.coordinator
            return picker
        }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}




func convertToCVPixelBuffer(newImage: UIImage) -> CVPixelBuffer? {
    let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
    var pixelBuffer: CVPixelBuffer?
    _ = CVPixelBufferCreate(kCFAllocatorDefault, Int(newImage.size.width), Int(newImage.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
    
    CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
    
    let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
    
    let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
    let context = CGContext(data: pixelData, width: Int(newImage.size.width), height: Int(newImage.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
    
    context?.translateBy(x: 0, y: newImage.size.height)
    context?.scaleBy(x: 1.0, y: -1.0)
    
    UIGraphicsPushContext(context!)
    newImage.draw(in: CGRect(x: 0, y: 0, width: newImage.size.width, height: newImage.size.height))
    UIGraphicsPopContext()
    CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
    return pixelBuffer
}


struct DetectedObjectRow: View {
    let item: Observation
    
    var body: some View {
        HStack {
            Text(item.label.capitalized)
                .font(.title3)
            Spacer()
            Text("\(item.confidence * 100, specifier: "%.2f")%")
        }
        .padding(.all)
    }
}

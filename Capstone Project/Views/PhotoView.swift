//
//  PhotoView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 15.03.2024.
//

import SwiftUI

struct PhotoView: View {
  @StateObject var viewModel = PhotoViewModel()
  
  var body: some View {
    VStack{
      if let image = viewModel.image{
        Image(uiImage: image)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .padding()
        Text(viewModel.resultMessage)
          .padding()
      } else {
        Spacer()
        Text("Please press to camera icon.")
          .font(.title2)
          .fontWeight(.semibold)
      }
      Spacer()
      Button(action: {
        self.viewModel.showingImagePicker = true
      }) {
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
      }
      .padding(.bottom,50)
    }
    .sheet(isPresented: $viewModel.showingImagePicker,onDismiss: viewModel.processImage ,content: {
      ImagePicker(image: $viewModel.image)
    })
    
  }
}

struct ImagePicker: UIViewControllerRepresentable {
  @Binding var image: UIImage?
  @Environment(\.presentationMode) var presentationMode
  
  class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var parent: ImagePicker
    
    init(parent: ImagePicker) {
      self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      if let uiImage = info[.originalImage] as? UIImage {
        parent.image = uiImage
      }
      parent.presentationMode.wrappedValue.dismiss()
    }
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(parent: self)
  }
  
  func makeUIViewController(context: Context) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    picker.sourceType = .camera
    return picker
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
  }
}


#Preview {
  PhotoView()
}

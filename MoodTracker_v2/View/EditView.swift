//
//  DetailView.swift
//  MoodTracker_v2
//
//  Created by Dhittaya Nuangchamnong on 20/5/2563 BE.
//  Copyright © 2563 Nattarika. All rights reserved.
//

import SwiftUI

struct EditView: View {
    
    @State var isShowingImagePicker = false
    @State var ImageBox = UIImage()
    
    var body: some View {
        VStack{
            Text("Image")
            Image(uiImage: ImageBox)
                .resizable()
                .scaledToFill()
                    .frame(width: 200, height: 200)
                    .border(Color.black, width: 1)
                    .clipped()
            
            Button(action: {
                self.isShowingImagePicker.toggle()
            },label: {
                Text("add image").font(.system(size: 24))
            })
                .sheet(isPresented: $isShowingImagePicker, content: {
                    ImagePickerView(isPresented: self.$isShowingImagePicker, selectedImage: self.$ImageBox)
                    //Text("This is the Image Picker")
                })
        }
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var isPresented: Bool
    @Binding var selectedImage: UIImage
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIViewController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
    func makeCoordinator() -> ImagePickerView.Coordinator {
        return Coordinator(parent: self)
    }
    // he said it is a tricky part?
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePickerView
        init(parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImageFromPicker = info[.originalImage] as? UIImage{
                print(selectedImageFromPicker)
                self.parent.selectedImage = selectedImageFromPicker
            }
            
            self.parent.isPresented = false
        }
    }
    
    func updateUIViewController(_ uiViewController: ImagePickerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}

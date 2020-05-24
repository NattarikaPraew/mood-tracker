//
//  DetailView.swift
//  MoodTracker_v2
//
//  Created by Dhittaya and Nattarika on 21/5/2563 BE.
//  Copyright © 2563 Dhittaya and Nattarika. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @State var isShowingImagePicker = false
    @State var ImageBox = UIImage()
    @State var firstText:  String = ""
    @State var updateText: String = ""
    @State var show = false
    
    @ObservedObject var moodModelController = MoodModelController()
    
    var mood: Mood
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(mood.monthString)
                        .font(.headline)
                        .fontWeight(.semibold)
                        
                    Text(mood.day)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding([.top, .leading])
            }
            
            Spacer()
            
            VStack {
                moodImage()
                
                moodName().foregroundColor(mood.emotion.moodColor)
                //TextField("\(mood.text)", text: self.$updateText)
                Text(mood.text)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .lineLimit(10)
                    .frame(height: 130)
                
                Image(uiImage: ImageBox)
                .resizable()
                .scaledToFill()
                    .frame(width: 250, height: 250)
                    .border(Color.black, width: 0)
                    .clipped()
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    
                    Button(action: {
                        self.show.toggle()
                        self.firstText = self.mood.text
                        
                    }, label: {
                        Image(systemName: "pencil").font(.system(size: 30))
                    })
                        .sheet(isPresented: $show, content: {
                            
                            VStack {
                                TextField("What about your feeling?", text: self.$firstText)
                                .padding(.horizontal)
                                .frame(width: UIScreen.main.bounds.width - 60, height: 50).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                .background(Color(.secondarySystemBackground))
                                    .cornerRadius(10.0)
                                
                                Button(action: {
                                    self.moodModelController.updateMoodComment(mood: self.mood, text: self.firstText)
                                    self.moodModelController.loadFromPersistentStore()
                                    self.show = false
                                }) {
                                    Text("Done").font(.title).lineLimit(4).frame(width: UIScreen.main.bounds.width - 30, height: 50).background(Color.blue).foregroundColor(.white).cornerRadius(10)
                                }
                            }
                        })
                    
                    Button(action: {
                        self.isShowingImagePicker.toggle()
                        
                    },label: {
                        Image(systemName: "photo").font(.system(size: 28))
                    })
                        .sheet(isPresented: $isShowingImagePicker, content: {
                            ImagePickerView(isPresented: self.$isShowingImagePicker, selectedImage: self.$ImageBox)
                            //Text("This is the Image Picker")
                        })
                    
                    Spacer()
                }
                .padding(.leading).foregroundColor(mood.emotion.moodColor)
            }
            .padding(.vertical)
            
            Spacer()
        }
    }
    
    func moodImage() -> some View {
        var imageName = "none"
        
        switch mood.emotion.state {
            case .sad:
                imageName = "sad"
            case .angry:
                imageName = "red"
            case .tense:
                imageName = "orange"
            case .calm:
                imageName = "pink"
            case .excited:
                imageName = "yellow"
            case .happy:
                imageName = "green"
        }
        return Image(imageName).resizable().frame(width: 110, height: 110)
    }
    
    func moodName() -> some View {
        var name = "none"
        
        switch mood.emotion.state {
            case .sad:
                name = "Sad"
            case .angry:
                name = "Angry"
            case .tense:
                name = "Tense"
            case .calm:
                name = "Calm"
            case .excited:
                name = "Excited"
            case .happy:
                name = "Happy"
        }
        return Text("\(name)")
            .font(.largeTitle)
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    
    //@ObservedObject var moodModelController: MoodModelController
    
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
                //self.parent.moodModelController.saveImage(image: selectedImageFromPicker)
            }
            
            self.parent.isPresented = false
        }
    }
    
    func updateUIViewController(_ uiViewController: ImagePickerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(mood: Mood(emotion: Emotion(state: .happy, color: .happyColor), text: "Test", date: Date()))
    }
}

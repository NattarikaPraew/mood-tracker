//
//  AddMoodView.swift
//  MoodTracker_v2
//
//  Created by Nattarika on 16/5/2563 BE.
//  Copyright © 2563 Nattarika. All rights reserved.
//

import SwiftUI

struct AddMoodView: View {

    
    
    @State var text: String = ""
//    @State private var sadIsSelected = false
//    @State private var angryIsSelected = false
//    @State private var tenseIsSelected = false
//    @State private var calmIsSelected = false
//    @State private var excitedIsSelected = false
//    @State private var happyIsSelected = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    @State var selectedDate = Date()
    
    @State var addItemText: String = ""
    
    var body: some View {
        VStack {
            VStack (spacing: 30){
                Text("How are you?").font(.largeTitle)
                                            
                DatePicker("Select Date", selection: self.$selectedDate, in: ...Date(),  displayedComponents: .date).labelsHidden()
                                            
                HStack {
                    Button (action: {
            //  self.moodColor = .sadColor
            //                                        self.sadIsSelected = true
            //                                        self.angryIsSelected = false
            //                                        self.tenseIsSelected = false
            //                                        self.calmIsSelected = false
            //                                        self.excitedIsSelected = false
            //                                        self.happyIsSelected = false
                }) {
                    Image("blue").resizable().frame(width: 50, height: 50).foregroundColor(.blue)
                                                }
                    Button (action: {
            //  self.moodColor = .angryColor
            //                                        self.sadIsSelected = false
            //                                        self.angryIsSelected = true
            //                                        self.tenseIsSelected = false
            //                                        self.calmIsSelected = false
            //                                        self.excitedIsSelected = false
            //                                        self.happyIsSelected = false
                }) {
                    Image("red").resizable().frame(width: 50, height: 50).foregroundColor(.red)
                                                }
                    Button (action: {
            //  self.moodColor = .tenseColor
            //                                        self.sadIsSelected = false
            //                                        self.angryIsSelected = false
            //                                        self.tenseIsSelected = true
            //                                        self.calmIsSelected = false
            //                                        self.excitedIsSelected = false
            //                                        self.happyIsSelected = false
                }) {
                    Image("orange").resizable().frame(width: 50, height: 50).foregroundColor(.orange)
                                                }
                    Button (action: {
            //  self.moodColor = .calmColor
            //                                        self.sadIsSelected = false
            //                                        self.angryIsSelected = false
            //                                        self.tenseIsSelected = false
            //                                        self.calmIsSelected = true
            //                                        self.excitedIsSelected = false
            //                                        self.happyIsSelected = false
                    }) {
                    Image("pink").resizable().frame(width: 50, height: 50).foregroundColor(.pink)
                                                }
                    Button (action: {
            //  self.moodColor = .excitedColor
            //                                        self.sadIsSelected = false
            //                                        self.angryIsSelected = false
            //                                        self.tenseIsSelected = false
            //                                        self.calmIsSelected = false
            //                                        self.excitedIsSelected = true
            //                                        self.happyIsSelected = false
                   }) {
                   Image("yellow").resizable().frame(width: 50, height: 50).foregroundColor(.yellow)
                                                }
                   Button (action: {
            //  self.moodColor = .happyColor
            //                                        self.sadIsSelected = false
            //                                        self.angryIsSelected = false
            //                                        self.tenseIsSelected = false
            //                                        self.calmIsSelected = false
            //                                        self.excitedIsSelected = false
            //                                        self.happyIsSelected = true
                }) {
                Image("green")
                    .resizable()
                    .frame(width: 50, height: 50).foregroundColor(.green)
                }
            }
            
            ZStack {
                TextField("What about your feeling?", text: self.$addItemText)
                    .padding(.horizontal)
                    .frame(width: UIScreen.main.bounds.width - 60, height: 50)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)
                }
                
                VStack {
                    Button(action: {
//                        self.items.append(Items(image: "blue", emotion: "Sad", caption: self.addItemText))
                                                    
                        self.addItemText = ""
                                            
                    }) {
                        Text("Add Mood")
                            .font(.title)
                            .lineLimit(4)
                            .frame(width: UIScreen.main.bounds.width - 30, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                }
            }
            
        }
    }
}

struct AddMoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddMoodView()
    }
}

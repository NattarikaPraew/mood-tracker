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
    
    var body: some View {
        VStack {
            VStack (spacing: 30){
                Text("Add Mood").font(.largeTitle)
                HStack {
                    Button (action: {
//                        self.sadIsSelected = true
//                        self.angryIsSelected = false
//                        self.tenseIsSelected = false
//                        self.calmIsSelected = false
//                        self.excitedIsSelected = false
//                        self.happyIsSelected = false
                        
                    }) {
                        Image("blue").resizable().frame(width: 50, height: 50).foregroundColor(.blue)
                    }
                    Button (action: {
//                        self.sadIsSelected = false
//                        self.angryIsSelected = true
//                        self.tenseIsSelected = false
//                        self.calmIsSelected = false
//                        self.excitedIsSelected = false
//                        self.happyIsSelected = false
                        
                    }) {
                        Image("red").resizable().frame(width: 50, height: 50).foregroundColor(.red)
                    }
                    Button (action: {
//                        self.sadIsSelected = false
//                        self.angryIsSelected = false
//                        self.tenseIsSelected = true
//                        self.calmIsSelected = false
//                        self.excitedIsSelected = false
//                        self.happyIsSelected = false
                        
                    }) {
                        Image("orange").resizable().frame(width: 50, height: 50).foregroundColor(.orange)
                    }
                    Button (action: {
//                        self.sadIsSelected = false
//                        self.angryIsSelected = false
//                        self.tenseIsSelected = false
//                        self.calmIsSelected = true
//                        self.excitedIsSelected = false
//                        self.happyIsSelected = false
                        
                    }) {
                        Image("pink").resizable().frame(width: 50, height: 50).foregroundColor(.pink)
                    }
                    Button (action: {
//                        self.sadIsSelected = false
//                        self.angryIsSelected = false
//                        self.tenseIsSelected = false
//                        self.calmIsSelected = false
//                        self.excitedIsSelected = true
//                        self.happyIsSelected = false
                        
                    }) {
                        Image("yellow").resizable().frame(width: 50, height: 50).foregroundColor(.yellow)
                    }
                    Button (action: {
//                        self.sadIsSelected = false
//                        self.angryIsSelected = false
//                        self.tenseIsSelected = false
//                        self.calmIsSelected = false
//                        self.excitedIsSelected = false
//                        self.happyIsSelected = true
                        
                    }) {
                        Image("green")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.green)
                    }
                }
                ZStack {
                    TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $text)
                        .padding(.horizontal)
                        .frame(width: 320.0, height: 100).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                }
                VStack {
                    Button(action: {}
                    ) {
                        Text("Add Mood")
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

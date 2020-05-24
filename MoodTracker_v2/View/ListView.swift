//
//  ListView.swift
//  MoodTracker_v2
//
//  Created by Dhittaya and Nattarika on 29/4/2563 BE.
//  Copyright © 2563 Dhittaya and Nattarika. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var moodModelController: MoodModelController
    @ObservedObject var keyboardResponder = KeyboardResponder()
    
    @State var addItemText: String = ""
    @State var open = false
    @State var show = false
    
    @State private var emotionState: EmotionState = .happy
    @State private var moodColor: MoodColor = .happyColor
    @State private var sadIsSelected = false
    @State private var angryIsSelected = false
    @State private var tenseIsSelected = false
    @State private var calmIsSelected = false
    @State private var excitedIsSelected = false
    @State private var happyIsSelected = false
    
    //move view when keyboard appear
    @State private var keyboardHeight: CGFloat = 0

    var plusButtonColor = "SalmonPink"
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateStyle = .short
        return formatter
    }
    
    @State var selectedDate = Date()
    
    var body: some View {
        VStack {
            NavigationView {
                ZStack (alignment: .bottomTrailing){
                    VStack {
                        List {
                            ForEach(self.moodModelController.moods, id: \.id) { mood in
                                NavigationLink (destination: DetailView(mood: mood)) {
    
                                    MoodRowView(mood: mood)
                                    
                                    }.buttonStyle(PlainButtonStyle())
                            }
                            .onDelete { (index) in
                                
                                self.moodModelController.deleteMood(at: index)
                            }
                        }
                        .navigationBarTitle("Mood Tracker")
                        .onAppear {
                                UITableView.appearance().separatorStyle = .none
                        }
                        
                    }
                    Button(action: {
                        self.show.toggle()
                    }) {
                        
                        Image(systemName: "plus").rotationEffect(.degrees(open ? 45 : 0)).foregroundColor(.white).font(.system(size: 38, weight: .bold)).animation(.spring(response: 0.2, dampingFraction: 0.4, blendDuration: 0))



                    }

                    .padding(24)

                    .background(Color(plusButtonColor))

                    .mask(Circle())

                    .shadow(color: Color(plusButtonColor), radius: 15)

                    .zIndex(10)

                }.padding([.bottom, .trailing]).sheet(isPresented: self.$show) {
                    VStack {
                        VStack (spacing: 30){
                            Text("How are you?").font(.largeTitle)
                            DatePicker("Select Date", selection: self.$selectedDate, in: ...Date(),  displayedComponents: .date).labelsHidden()
                            HStack {
                                Button (action: {
                                    self.emotionState = .sad
                                    self.moodColor = .sadColor
                                    self.sadIsSelected = true
                                    self.angryIsSelected = false
                                    self.tenseIsSelected = false
                                    self.calmIsSelected = false
                                    self.excitedIsSelected = false
                                    self.happyIsSelected = false
                                }) {
                                    Image("sad")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                }
                                Button (action: {
                                    self.emotionState = .angry
                                    self.moodColor = .angryColor
                                    self.sadIsSelected = false
                                    self.angryIsSelected = true
                                    self.tenseIsSelected = false
                                    self.calmIsSelected = false
                                    self.excitedIsSelected = false
                                    self.happyIsSelected = false
                                }) {
                                    Image("red")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                }
                                Button (action: {
                                    self.emotionState = .tense
                                    self.moodColor = .tenseColor
                                    self.sadIsSelected = false
                                    self.angryIsSelected = false
                                    self.tenseIsSelected = true
                                    self.calmIsSelected = false
                                    self.excitedIsSelected = false
                                    self.happyIsSelected = false
                                }) {
                                    Image("orange")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.orange)
                                }
                                Button (action: {
                                    self.emotionState = .calm
                                    self.moodColor = .calmColor
                                    self.sadIsSelected = false
                                    self.angryIsSelected = false
                                    self.tenseIsSelected = false
                                    self.calmIsSelected = true
                                    self.excitedIsSelected = false
                                    self.happyIsSelected = false
                                }) {
                                    Image("pink")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.pink)
                                }
                                Button (action: {
                                    self.emotionState = .excited
                                    self.moodColor = .excitedColor
                                    self.sadIsSelected = false
                                    self.angryIsSelected = false
                                    self.tenseIsSelected = false
                                    self.calmIsSelected = false
                                    self.excitedIsSelected = true
                                    self.happyIsSelected = false
                                }) {
                                    Image("yellow")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.yellow)
                                }
                                Button (action: {
                                    self.emotionState = .happy
                                    self.moodColor = .happyColor
                                    self.sadIsSelected = false
                                    self.angryIsSelected = false
                                    self.tenseIsSelected = false
                                    self.calmIsSelected = false
                                    self.excitedIsSelected = false
                                    self.happyIsSelected = true
                                }) {
                                    Image("green")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.green)
                                }
                                
                            }
                            ZStack {
                                TextField("What about your feeling?", text: self.$addItemText)
                                    .padding(.horizontal)
                                    .frame(width: UIScreen.main.bounds.width - 60, height: 50).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                    .background(Color(.secondarySystemBackground))
                                    .cornerRadius(10.0)
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            }.padding(.bottom, self.keyboardHeight)
                            
                            VStack {
                                Button(action: {
                                    self.moodModelController.createMood(emotion: Emotion(state: self.emotionState, color: self.moodColor), text: self.addItemText, date: self.selectedDate)
                                    self.show = false
                                    self.addItemText = ""
                                }
                                ) {
                                    Text("Add Mood").font(.title).lineLimit(4).frame(width: UIScreen.main.bounds.width - 30, height: 50).background(Color.blue).foregroundColor(.white).cornerRadius(10)
                                }
                            } //End VStack
                        }
                    }.offset(y: -self.keyboardResponder.currentHeight*0.9)
                }
            }
        }
    }
}

class KeyboardResponder: ObservableObject {
    @Published var currentHeight: CGFloat = 0
    
    var _center: NotificationCenter

    init(center: NotificationCenter = .default) {
        _center = center
        _center.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        _center.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyBoardWillShow(notification: Notification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                withAnimation {
                    currentHeight = keyboardSize.height
            }
        }
    }
    
    @objc func keyBoardWillHide(notification: Notification) {
            withAnimation {
               currentHeight = 0
        }
    }
}



struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(moodModelController: MoodModelController())
    }
}

struct AddView: View {

    @State var open = false

    var plusButtonColor = "SalmonPink"

    var body: some View {

        ZStack {

            Button(action: {self.open.toggle()}) {

                Image(systemName: "plus").rotationEffect(.degrees(open ? 45 : 0)).foregroundColor(.white).font(.system(size: 38, weight: .bold)).animation(.spring(response: 0.2, dampingFraction: 0.4, blendDuration: 0))
            }

            .padding(24)

            .background(Color(plusButtonColor))

            .mask(Circle())

            .shadow(color: Color(plusButtonColor), radius: 15)

            .zIndex(10)

//            SecondaryButton(open: $open, color: "SalmonPink", offsetX: -90, delay: 0.1)
//
//            SecondaryButton(open: $open, color: "SalmonPink", offsetX: -70, offsetV: -50, delay: 0.2)
//
//            SecondaryButton(open: $open, color: "SalmonPink", offsetX: -25, offsetV: -80, delay: 0.3)
//
//            SecondaryButton(open: $open, color: "piSalmonPinknk", offsetX: 25, offsetV: -80, delay: 0.4)
//
//            SecondaryButton(open: $open, color: "SalmonPink", offsetX: 70, offsetV: -50, delay: 0.5)
//
//            SecondaryButton(open: $open, color: "SalmonPink", offsetX: 90, delay: 0.6)

        }

    }

}

struct AddView_Previews: PreviewProvider {

    static var previews: some View {

        AddView()

    }

}

struct SecondaryButton : View{

    @Binding var open: Bool

    var icon = ""

    var color = "blue"

    var offsetX = 0

    var offsetV = 0

    var delay = 0.0

    var body: some View{

        Button(action: {}) {

            Image(systemName: icon).frame(width: 15, height: 15).foregroundColor(.white).font(.system(size: 20, weight: .bold))

        }

    .padding()

        .background(Color(color))

        .mask(Circle())

        .offset(x: open ? CGFloat(offsetX) : 0 , y: open ? CGFloat(offsetV) : 0)

        .scaleEffect(open ? 1:0)

        .animation(Animation.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0).delay(Double(delay)))

    }

}


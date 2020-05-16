//
//  EditView.swift
//  MoodTracker_v2
//
//  Created by Nattarika on 29/4/2563 BE.
//  Copyright © 2563 Nattarika. All rights reserved.
//

import SwiftUI


struct Items: Identifiable{
    var id = UUID()
    var image: String
    var emotion: String
    var caption: String
}

//enum MoodColor: String {
//    case sadColor = "blue"
//    case angryColor = "red"
//    case tenseColor = "orange"
//    case calmColor = "pink"
//    case excitedColor = "yellow"
//    case happyColor = "green"
//}

let itemData = [Items(image: "blue", emotion: "sad", caption: "I feel blue"),
Items(image: "pink", emotion: "calm", caption: "so so"),
Items(image: "yellow", emotion: "ecited", caption: "wow!")]

struct EditView: View {
    @State var items:[Items] = []
    
    
    @State var addItemText: String = ""
    @State var open = false
    @State var show = false
    
//    @State private var moodColor: MoodColor = .happyColor
//    @State private var sadIsSelected = false
//    @State private var angryIsSelected = false
//    @State private var tenseIsSelected = false
//    @State private var calmIsSelected = false
//    @State private var excitedIsSelected = false
//    @State private var happyIsSelected = false
    

    var plusButtonColor = "SalmonPink"
    
    var body: some View {
        NavigationView {
            ZStack (alignment: .bottom){
                VStack {
                    List(items) { item in
                    NavigationLink(destination: Text("Caption")) {
                        HStack {
                            Image(item.image).resizable().frame(width: 80, height: 80)
                            VStack(alignment: .leading) {
                                Text(item.emotion)
                                    .font(.title)
                                Text(item.caption)
                            }
                        }
                    }
                    }.navigationBarTitle("Mood Tracker")
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

            }.sheet(isPresented: self.$show) {
                VStack {
                            VStack (spacing: 30){
                                Text("How are you?").font(.largeTitle)
                                HStack {
                                    Button (action: {
//                                        self.moodColor = .sadColor
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
//                                        self.moodColor = .angryColor
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
//                                        self.moodColor = .tenseColor
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
//                                        self.moodColor = .calmColor
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
//                                        self.moodColor = .excitedColor
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
//                                        self.moodColor = .happyColor
//                                        self.sadIsSelected = false
//                                        self.angryIsSelected = false
//                                        self.tenseIsSelected = false
//                                        self.calmIsSelected = false
//                                        self.excitedIsSelected = false
//                                        self.happyIsSelected = true
                                    }) {
                                        Image("green")
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
                                }
                                VStack {
                                    Button(action: {
                                        self.items.append(Items(image: "blue", emotion: "Sad", caption: self.addItemText))
                                        
                                        self.addItemText = ""
                                
                                    }
                                    ) {
                                        Text("Add Mood").font(.title).lineLimit(4).frame(width: UIScreen.main.bounds.width - 30, height: 50).background(Color.blue).foregroundColor(.white).cornerRadius(10)
                                    }
                                }
                            }
                            
                        }
                    }
            }
        }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(items: itemData)
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

            

            

            SecondaryButton(open: $open, color: "blue", offsetX: -90, delay: 0.1)

            SecondaryButton(open: $open, color: "red", offsetX: -70, offsetV: -50, delay: 0.2)

            SecondaryButton(open: $open, color: "yellow", offsetX: -25, offsetV: -80, delay: 0.3)

            SecondaryButton(open: $open, color: "pink", offsetX: 25, offsetV: -80, delay: 0.4)

            SecondaryButton(open: $open, color: "orange", offsetX: 70, offsetV: -50, delay: 0.5)

            SecondaryButton(open: $open, color: "green", offsetX: 90, delay: 0.6)

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
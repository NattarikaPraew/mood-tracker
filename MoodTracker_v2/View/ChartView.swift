//
//  ChartView.swift
//  MoodTracker_v2
//
//  Created by Dhittaya and Dhittaya Nuangchamnong on 19/5/2563 BE.
//  Copyright © 2563 Dhittaya and Nattarika. All rights reserved.
//

import SwiftUI
import SwiftUICharts

public struct ChartView: View {
    
    @ObservedObject var moodModelController: MoodModelController
    
    @State var bar1 : CGFloat = 0
    @State var bar2 : CGFloat = 0
    @State var bar3 : CGFloat = 0
    @State var bar4 : CGFloat = 0
    @State var bar5 : CGFloat = 0
    @State var bar6 : CGFloat = 0
    
    var sad = 24
    var angry = 16
    var tense = 25
    var calm = 40
    var excited = 25
    var happy = 100
    
    var allMood: Int {
        sad + angry + tense + calm + excited + happy
    }
    
    var sadResult: Int {
        self.moodModelController.actualValue(mood: self.sad, allMood: self.allMood)
    }
    var angryResult: Int {
        self.moodModelController.actualValue(mood: self.angry, allMood: self.allMood)
    }
    var tenseResult: Int {
        self.moodModelController.actualValue(mood: self.tense, allMood: self.allMood)
    }
    var calmResult: Int {
        self.moodModelController.actualValue(mood: self.calm, allMood: self.allMood)
    }
    var excitedResult: Int {
        self.moodModelController.actualValue(mood: self.excited, allMood: self.allMood)
    }
    var happyResult: Int {
        self.moodModelController.actualValue(mood: self.happy, allMood: self.allMood)
    }
    
    public var body: some View {
        ZStack {
            
            GeometryReader{ geo in
                Rectangle().fill(Color(UIColor.systemBackground)).cornerRadius(15).shadow(color: .gray, radius: 5, x: 1, y: 1)
                VStack(alignment: .leading){
                    Text("Mood Chart").font(.largeTitle).fontWeight(.heavy).multilineTextAlignment(.leading).padding([.top, .leading, .bottom], 30)
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Image("green").resizable().frame(width: 30, height: 30)
                                    BarChart(percent: self.bar1, color: Color.green)
                                }
                                
                                HStack {
                                    Image("yellow").resizable().frame(width: 30, height: 30)
                                    BarChart(percent: self.bar2, color: Color.yellow)
                                }
                                
                                HStack {
                                    Image("pink").resizable().frame(width: 30, height: 30)
                                    BarChart(percent: self.bar3, color: Color.pink)
                                }
                                
                                HStack {
                                    Image("orange").resizable().frame(width: 30, height: 30)
                                    BarChart(percent: self.bar4, color: Color.orange)
                                }
                                
                                HStack {
                                    Image("red").resizable().frame(width: 30, height: 30)
                                    BarChart(percent: self.bar5, color: Color.red)
                                }
                                
                                HStack {
                                    Image("sad").resizable().frame(width: 30, height: 30)
                                    BarChart(percent: self.bar6, color: Color.blue)
                                }
                            }.padding(.horizontal)
                            
                        }
                        .onAppear{
                            
                            self.bar1 = geo.size.width / 2 + 100 - CGFloat(self.happyResult)
                            self.bar2 = geo.size.width / 2 + 100 - CGFloat(self.excitedResult)
                            self.bar3 = geo.size.width / 2 + 100 - CGFloat(self.calmResult)
                            self.bar4 = geo.size.width / 2 + 100 - CGFloat(self.tenseResult)
                            self.bar5 = geo.size.width / 2 + 100 - CGFloat(self.angryResult)
                            self.bar6 = geo.size.width / 2 + 100 - CGFloat(self.sadResult)
                }
            }.animation(.spring())
        }
        .padding(.horizontal)
        .frame(height: 450)
        
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(moodModelController: MoodModelController())
    }
}

struct BarChart : View {
    var percent : CGFloat = 0
    var color : Color = .white
    var maxwidth : CGFloat = 270
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Capsule().fill(self.color).frame(width: self.percent, height: 30).shadow(color: .gray, radius: 3, x: 1, y: 1)
                Spacer()
            }.padding(.all, 5)
        }
    }
}

struct num :  Identifiable{
    var id : Int
    var detail : CGFloat
}

var details = [
    num(id:0, detail: 5),
    num(id:1, detail: 4),
    num(id:2, detail: 8),
    num(id:3, detail: 3),
    num(id:4, detail: 7),
    num(id:5, detail: 3)
]



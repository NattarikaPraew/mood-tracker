//
//  ChartView.swift
//  MoodTracker_v2
//
//  Created by Dhittaya Nuangchamnong on 19/5/2563 BE.
//  Copyright © 2563 Nattarika. All rights reserved.
//

import SwiftUI

struct ChartView: View {
    
    @State var bar1 : CGFloat = 0
    @State var bar2 : CGFloat = 0
    @State var bar3 : CGFloat = 0
    @State var bar4 : CGFloat = 0
    @State var bar5 : CGFloat = 0
    @State var bar6 : CGFloat = 0
    
    var body: some View {
        GeometryReader{ geo in
            VStack{
                Text("Mood Chart").font(.largeTitle).padding(.bottom, 30)
                HStack{
                    Button(action: {
                        self.bar1 = geo.size.width / 2 - 20
                        self.bar2 = geo.size.width * 0.25 - 20
                        self.bar3 = geo.size.width / 2 - 80
                        self.bar4 = geo.size.width * 0.25 - 60
                        self.bar5 = geo.size.width - 40
                        self.bar6 = geo.size.width * 0.25 - 40
                        
                    }) {
                        Text("Jan").padding(15)
                        }.background(Color.init("SalmonPink")).foregroundColor(Color.white).cornerRadius(8)
                    
                    Button(action: {
                        
                        self.bar1 = geo.size.width * 0.25 - 20
                        self.bar2 = geo.size.width / 2 - 20
                        self.bar3 = geo.size.width * 0.25 - 60
                        self.bar4 = geo.size.width / 2 - 80
                        self.bar5 = geo.size.width * 0.25 - 40
                        self.bar6 = geo.size.width - 60
                        
                    }) {
                        Text("Feb").padding(15)
                        }.background(Color.init("SalmonPink")).foregroundColor(Color.white).cornerRadius(8)
                    
                    Button(action: {
                        
                        self.bar1 = geo.size.width * 0.25 - 40
                        self.bar2 = geo.size.width / 2 - 100
                        self.bar3 = geo.size.width * 0.25 - 20
                        self.bar4 = geo.size.width / 2 - 50
                        self.bar5 = geo.size.width - 100
                        self.bar6 = geo.size.width * 0.25 - 30
                        
                    }) {
                        Text("Mar").padding(15)
                        }.background(Color.init("SalmonPink")).foregroundColor(Color.white).cornerRadius(8)
                    
                    Button(action: {
                        
                        self.bar1 = geo.size.width / 2 - 20
                        self.bar2 = geo.size.width * 0.25 - 20
                        self.bar3 = geo.size.width / 2 - 80
                        self.bar4 = geo.size.width * 0.25 - 60
                        self.bar5 = geo.size.width - 40
                        self.bar6 = geo.size.width * 0.25 - 40
                        
                    }) {
                        Text("Apr").padding(15)
                        }.background(Color.init("SalmonPink")).foregroundColor(Color.white).cornerRadius(8)
                    Button(action: {
                        
                        self.bar1 = geo.size.width * 0.25 - 20
                        self.bar2 = geo.size.width / 2 - 20
                        self.bar3 = geo.size.width * 0.25 - 60
                        self.bar4 = geo.size.width / 2 - 80
                        self.bar5 = geo.size.width * 0.25 - 40
                        self.bar6 = geo.size.width - 60
                        
                    }) {
                        Text("May").padding(15)
                        }.background(Color.init("SalmonPink")).foregroundColor(Color.white).cornerRadius(8)
                    Button(action: {
                        
                        self.bar1 = geo.size.width * 0.25 - 40
                        self.bar2 = geo.size.width / 2 - 100
                        self.bar3 = geo.size.width * 0.25 - 20
                        self.bar4 = geo.size.width / 2 - 50
                        self.bar5 = geo.size.width - 100
                        self.bar6 = geo.size.width * 0.25 - 30
                        
                    }) {
                        Text("Jun").padding(15)
                        }.background(Color.init("SalmonPink")).foregroundColor(Color.white).cornerRadius(8)
                }.padding(5)
                HStack{
                    Button(action: {
                        
                        self.bar1 = geo.size.width * 0.25 - 40
                        self.bar2 = geo.size.width / 2 - 100
                        self.bar3 = geo.size.width * 0.25 - 20
                        self.bar4 = geo.size.width / 2 - 50
                        self.bar5 = geo.size.width - 100
                        self.bar6 = geo.size.width * 0.25 - 30
                        
                    }) {
                        Text("Jul").padding(15)
                        }.background(Color.init("SalmonPink")).foregroundColor(Color.white).cornerRadius(8)
                    
                    Button(action: {
                        
                        self.bar1 = geo.size.width * 0.25 - 40
                        self.bar2 = geo.size.width / 2 - 100
                        self.bar3 = geo.size.width * 0.25 - 20
                        self.bar4 = geo.size.width / 2 - 50
                        self.bar5 = geo.size.width - 100
                        self.bar6 = geo.size.width * 0.25 - 30
                        
                    }) {
                        Text("Aug").padding(15)
                        }.background(Color.init("SalmonPink")).foregroundColor(Color.white).cornerRadius(8)
                    
                    Button(action: {
                        
                        self.bar1 = geo.size.width * 0.25 - 40
                        self.bar2 = geo.size.width / 2 - 100
                        self.bar3 = geo.size.width * 0.25 - 20
                        self.bar4 = geo.size.width / 2 - 50
                        self.bar5 = geo.size.width - 100
                        self.bar6 = geo.size.width * 0.25 - 30
                        
                    }) {
                        Text("Sep").padding(15)
                        }.background(Color.init("SalmonPink")).foregroundColor(Color.white).cornerRadius(8)
                    
                    Button(action: {
                        
                        self.bar1 = geo.size.width * 0.25 - 40
                        self.bar2 = geo.size.width / 2 - 100
                        self.bar3 = geo.size.width * 0.25 - 20
                        self.bar4 = geo.size.width / 2 - 50
                        self.bar5 = geo.size.width - 100
                        self.bar6 = geo.size.width * 0.25 - 30
                        
                    }) {
                        Text("Oct").padding(15)
                        }.background(Color.init("SalmonPink")).foregroundColor(Color.white).cornerRadius(8)
                    
                    Button(action: {
                        
                        self.bar1 = geo.size.width * 0.25 - 40
                        self.bar2 = geo.size.width / 2 - 100
                        self.bar3 = geo.size.width * 0.25 - 20
                        self.bar4 = geo.size.width / 2 - 50
                        self.bar5 = geo.size.width - 100
                        self.bar6 = geo.size.width * 0.25 - 30
                        
                    }) {
                        Text("Nov").padding(15)
                        }.background(Color.init("SalmonPink")).foregroundColor(Color.white).cornerRadius(8)
                    
                    Button(action: {
                        
                        self.bar1 = geo.size.width * 0.25 - 40
                        self.bar2 = geo.size.width / 2 - 100
                        self.bar3 = geo.size.width * 0.25 - 20
                        self.bar4 = geo.size.width / 2 - 50
                        self.bar5 = geo.size.width - 100
                        self.bar6 = geo.size.width * 0.25 - 30
                        
                    }) {
                        Text("Dec").padding(15)
                        }.background(Color.init("SalmonPink")).foregroundColor(Color.white).cornerRadius(8)
                }.padding(.bottom, 20)
                
                
                BarChart(percent: self.bar1, color: Color.init("pink"))
                BarChart(percent: self.bar2, color: Color.init("blue"))
                BarChart(percent: self.bar3, color: Color.init("green"))
                BarChart(percent: self.bar4, color: Color.init("orange"))
                BarChart(percent: self.bar5, color: Color.init("yellow"))
                BarChart(percent: self.bar6, color: Color.init("red"))

            }
            .onAppear{
                self.bar1 = geo.size.width - 500
                self.bar2 = geo.size.width - 500
                self.bar3 = geo.size.width - 500
                self.bar4 = geo.size.width - 500
                self.bar5 = geo.size.width - 500
                self.bar6 = geo.size.width - 500
            }
        }.animation(.spring())
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}

struct BarChart : View {
    
    var percent : CGFloat = 0
    var color : Color = .white
    var body: some View {
        HStack{
                Capsule().fill(self.color).frame(width: self.percent, height: 30)
            Spacer()
        }.padding(5)
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


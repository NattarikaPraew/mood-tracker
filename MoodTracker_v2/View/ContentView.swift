//
//  ContentView.swift
//  MoodTracker_v2
//
//  Created by Dhittaya and Nattarika on 20/5/2563 BE.
//  Copyright © 2563 Dhittaya and Nattarika. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            TabView() {
                ListView(moodModelController: MoodModelController())
                    .tabItem {
                        Image("notepad30")
                        Text("Home") }.tag(1)
                ChartView(moodModelController: MoodModelController())
                    .tabItem {
                        Image("comboChart30")
                        Text("Insight") }.tag(2)
                CalendarView(start: Date(), monthsToShow: 2, moodController: MoodModelController())
                    .tabItem {
                        Image("calendar30")
                        Text("Calendar") }.tag(3)
                NotifyView()
                    .tabItem{
                        Image("more30")
                    (Text("more")) }.tag(4)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

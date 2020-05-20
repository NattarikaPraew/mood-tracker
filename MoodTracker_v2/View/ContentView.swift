//
//  ContentView.swift
//  MoodTracker_v2
//
//  Created by Nattarika on 20/5/2563 BE.
//  Copyright © 2563 Nattarika. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            ListView(moodModelController: MoodModelController())
                .tabItem { Text("Home") }.tag(1)
            ChartView()
                .tabItem { Text("Insight") }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

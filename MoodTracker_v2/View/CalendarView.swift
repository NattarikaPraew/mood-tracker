//
//  CalendarView.swift
//  MoodTracker_v2
//
//  Created by Nattarika on 29/4/2563 BE.
//  Copyright © 2563 Nattarika. All rights reserved.
//

import SwiftUI

struct calendarView: View {
    @State var singleIsPresented = false
    @State var isChartTapped: Bool = false
    
    
    var rkManager = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0)
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: EditView()) {
                VStack {
                       RKViewController(isPresented: self.$singleIsPresented, rkManager: self.rkManager)

                }
            }
            .navigationBarTitle("Calendar")
            .navigationBarItems(trailing:
            HStack {
                Button(action: {}) {
                    Image("comboChart30").font(.largeTitle)
                    
                }
            }
            )
        }
    }
    
    
    
    func getTextFromDate(date: Date!) -> String {
        var txt: String
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "EEEE, MMMM d, yyyy"
        txt = date == nil ? "" : formatter.string(from: date)
        print(txt)
        return date == nil ? "" : formatter.string(from: date)
    }
    
}

struct calendarView_Previews: PreviewProvider {
    static var previews: some View {
        calendarView()
    }
}

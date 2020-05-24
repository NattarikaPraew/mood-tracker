//
//  WeekDayView.swift
//  MoodTracker_v2
//
//  Created by Dhittaya and Nattarika on 21/5/2563 BE.
//  Copyright © 2563 Dhittaya and Nattarika. All rights reserved.
//

import SwiftUI

@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct WeekDaysView: View {
    let weekdays = ["Sun", "Mon", "Tue", "Wen", "Thu", "Fri", "Sat"]
    let colors = Colors()

    var body: some View {
        HStack {
            Grid(rows: 1, columns: 7) { row, col in
                Text(self.weekdays[col])
            }
        }.padding(.bottom, 20).background(colors.weekdayBackgroundColor)
    }
}

@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct WeekDayView_Previews: PreviewProvider {
    static var previews: some View {
        WeekDaysView()
    }
}

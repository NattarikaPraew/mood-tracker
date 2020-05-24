
//  CalendarView.swift
//  MoodTracker_v2
//
//  Created by Dhittaya and Nattarika on 29/4/2563 BE.
//  Copyright © 2563 Dhittaya and Nattarika. All rights reserved.

import SwiftUI

@available(OSX 10.15, *)
@available(iOS 13.0, *)
public struct CalendarView: View {
    @ObservedObject var moodModelController: MoodModelController
    let startDate: Date
    let monthsToDisplay: Int
    var selectableDays = true


    init(start: Date, monthsToShow: Int, daysSelectable: Bool = true, moodController: MoodModelController) {
    self.startDate = start
    self.monthsToDisplay = monthsToShow
    self.selectableDays = daysSelectable
    self.moodModelController = moodController
    }

    public var body: some View {

        VStack {
            Text("Mood Calendar")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)
            WeekDaysView()
            ScrollView {
                MonthView(moodModelController: moodModelController, month: Month(startDate: startDate, selectableDays: selectableDays))
                if monthsToDisplay > 1 {
                    ForEach(1..<self.monthsToDisplay) {
                        MonthView(moodModelController: self.moodModelController, month: Month(startDate: self.nextMonth(currentMonth: self.startDate, add: $0), selectableDays: self.selectableDays))
                    }
                }
            }
            Spacer()
        }.padding()
    }

    func nextMonth(currentMonth: Date, add: Int) -> Date {
        var components = DateComponents()
        components.month = add
        let next = Calendar.current.date(byAdding: components, to: currentMonth)!
        return next
    }
}

@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(start: Date(), monthsToShow: 2, moodController: MoodModelController())
    }
}

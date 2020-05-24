//
//  DayCellView.swift
//  MoodTracker_v2
//
//  Created by Dhittaya and Nattarika on 21/5/2563 BE.
//  Copyright © 2563 Dhittaya and Nattarika. All rights reserved.
//

import SwiftUI

@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct DayCellView: View {
    @ObservedObject var moodModelController: MoodModelController
    @ObservedObject var day: Day
    
    var body: some View {
        VStack {
            Text(day.dayName).frame(width: 32, height: 32)
            .foregroundColor(day.textColor)
            
            moodText()
        
        }
        .background(day.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
            if self.day.disabled == false && self.day.selectableDays {
                self.day.isSelected.toggle()
            }
        }
    }
    
    func moodText() -> some View {
        var imageName = ""
        
        for m in moodModelController.moods {
           // if m.date.dateToString(format: "d") == day.dayName {
            if m.monthString == day.monthString && m.dayAsInt == day.dayAsInt && m.year == day.year {
              switch m.emotion.state {
                case .sad:
                    imageName = "sad"
                case .angry:
                    imageName = "red"
                case .tense:
                    imageName = "orange"
                case .calm:
                    imageName = "pink"
                case .excited:
                    imageName = "yellow"
                case .happy:
                    imageName = "green"
                }
                return Image(imageName).resizable().frame(width: 25, height: 25).opacity(1)
            }
        }
        
        return Image(imageName).resizable().frame(width: 20, height: 20).opacity(0)
    }
}

struct DayCellView_Previews: PreviewProvider {
    static var previews: some View {
        DayCellView(moodModelController: MoodModelController(), day: Day(date: Date()))
    }
}

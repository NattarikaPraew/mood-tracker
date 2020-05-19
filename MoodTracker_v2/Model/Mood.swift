//
//  Mood.swift
//  MoodTracker_v2
//
//  Created by Nattarika on 19/5/2563 BE.
//  Copyright © 2563 Nattarika. All rights reserved.
//

import Foundation
import SwiftUI

enum EmotionState {
    case sad
    case angry
    case tense
    case calm
    case excited
    case happy
}

enum MoodColor: String {
    case sadColor = "sadColor"
    case angryColor = "angryColor"
    case tenseColor = "tenseColor"
    case calmColor = "calmColor"
    case excitedColor = "excitedColor"
    case happyColor = "happyColor"
}

struct Emotion {
    var state: EmotionState
    var color: MoodColor
    
    var moodColor: Color {
        switch color {
        case .sadColor:
            return .blue
        case .angryColor:
            return .red
        case .tenseColor:
            return .orange
        case .calmColor:
            return .pink
        case .excitedColor:
            return .yellow
        case .happyColor:
            return .green
        }
    }
    
}

struct Mood: Identifiable{
    var id = UUID()
    var emotion: Emotion
    var text: String
    let date: Date
    
    init(emotion: Emotion, text: String, date: Date) {
        self.emotion = emotion
        self.text = text
        self.date = date
    }
    
    var dateString: String {
        dateFormatter.string(from: date)
    }
    
    var monthString: String {

        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "LLL"
        
        let month = dateFormatter1.string(from: date)
        
        return month
    
    }
    
    var day: String {
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "dd"
        let day = dateFormatter2.string(from: date)
        return day
    }
    
    
}

var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.dateFormat = "MMM dd"
    return formatter
}

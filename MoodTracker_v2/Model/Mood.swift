//
//  Mood.swift
//  MoodTracker_v2
//
//  Created by Dhittaya and Nattarika on 19/5/2563 BE.
//  Copyright © 2563 Dhittaya and Nattarika. All rights reserved.
//

import Foundation
import SwiftUI

enum EmotionState: String, Codable {
    case sad
    case angry
    case tense
    case calm
    case excited
    case happy
}

enum MoodColor: String, Codable {
    case sadColor = "sadColor"
    case angryColor = "angryColor"
    case tenseColor = "tenseColor"
    case calmColor = "calmColor"
    case excitedColor = "excitedColor"
    case happyColor = "happyColor"
}

struct Emotion: Codable{
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

struct Images: Codable, Identifiable {
    var id = UUID()
    var image: Data?
    
    init(image: UIImage) {
        self.image = image.pngData()
    }
    
}

struct Mood: Codable, Equatable, Identifiable{
    
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
    
    var dayAsInt: Int {
        let day = Calendar.current.component(.day, from: date)
        return day
    }
    
    var year: String {
        return Calendar.current.component(.year, from: date).description
    }
    
    static func == (lhs: Mood, rhs: Mood) -> Bool {
        if lhs.date == rhs.date {
            return true
        } else {
            return false
        }
    }
    
    
}

var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.dateFormat = "MMM"
    return formatter
}

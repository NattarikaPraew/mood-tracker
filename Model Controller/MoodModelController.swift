//
//  MoodModelController.swift
//  MoodTracker_v2
//
//  Created by Nattarika on 19/5/2563 BE.
//  Copyright © 2563 Nattarika. All rights reserved.
//

import Foundation

class MoodModelController: ObservableObject {
    
    @Published var moods: [Mood] = []
    
    func createMood(emotion: Emotion, text: String, date: Date) {
        let newMood = Mood(emotion: emotion, text: text, date: date)
        
        moods.append(newMood)
        
    }
}

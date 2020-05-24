//
//  MoodModelController.swift
//  MoodTracker_v2
//
//  Created by Dhittaya and Nattarika on 19/5/2563 BE.
//  Copyright © 2563 Dhittaya and Nattarika. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class MoodModelController: ObservableObject {
    
    @Published var moods: [Mood] = []
    @Published var images: [Images] = []
    
    var sad = 15
    var angry = 13
    var tense = 15
    var calm = 20
    var excited = 10
    var happy = 0

    init() {
        loadFromPersistentStore()
        //loadImageFromPersistentStore()
    }
    
    func createMood(emotion: Emotion, text: String, date: Date) {
        let newMood = Mood(emotion: emotion, text: text, date: date)
        
        moods.append(newMood)
        
        saveToPersistentStore()
    }
    
//    func saveImage(image: UIImage) {
//        let newImage = Images(image: image)
//
//        images.append(newImage)
//
//        saveImageToPersistentStore()
//    }
    
    func actualValue(mood: Int, allMood: Int) -> Int {
        var allMoodPercent: Int
        var onePercent: Int
        //var percent: Double
        var actualValue: Int
        allMoodPercent = (allMood * 100) / 243
        
        onePercent = 243 / allMoodPercent
        
        //percent = ((((mood * 100) / 243) * onePercent) / 243) * 100
        
        actualValue = 243 - ((mood * 100) / 243) * onePercent
        
        return actualValue
    }
    
    func deleteMood(at offset: IndexSet) {
        
        guard let index = Array(offset).first else { return }
     print("INDEX: \(index)")
        moods.remove(at: index)
        
        saveToPersistentStore()
    }
    
    func updateMoodComment(mood: Mood, text: String) {
        if let index = moods.firstIndex(of: mood) {
            var mood = moods[index]
            mood.text = text
            
            moods[index] = mood
            saveToPersistentStore()
        }
    }
    
    private var persistentFileURL: URL? {
      let fileManager = FileManager.default
      guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        else { return nil }
       
      return documents.appendingPathComponent("mood.plist")
    }
    
//    private var persistentImageFileURL: URL? {
//      let fileManager = FileManager.default
//      guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
//        else { return nil }
//
//      return documents.appendingPathComponent("image.plist")
//    }
    
    func saveToPersistentStore() {
        
        // Stars -> Data -> Plist
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(moods)
            try data.write(to: url)
        } catch {
            print("Error saving stars data: \(error)")
        }
    }
    
//    func saveImageToPersistentStore() {
//        guard let url = persistentImageFileURL else { return }
//
//        do {
//            let encoder = PropertyListEncoder()
//            let data = try encoder.encode(images)
//            try data.write(to: url)
//        } catch {
//            print("Error saving stars data: \(error)")
//        }
//    }
//
    func loadFromPersistentStore() {
        
        // Plist -> Data -> Stars
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            moods = try decoder.decode([Mood].self, from: data)
        } catch {
            print("error loading stars data: \(error)")
        }
    }
    
//    func loadImageFromPersistentStore() {
//
//        // Plist -> Data -> Stars
//        let fileManager = FileManager.default
//        guard let url = persistentImageFileURL, fileManager.fileExists(atPath: url.path) else { return }
//
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = PropertyListDecoder()
//            images = try decoder.decode([Images].self, from: data)
//        } catch {
//            print("error loading stars data: \(error)")
//        }
//    }
    
}

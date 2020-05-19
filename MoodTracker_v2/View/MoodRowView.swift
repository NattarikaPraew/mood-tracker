//
//  MoodRowView.swift
//  MoodTracker_v2
//
//  Created by Nattarika on 19/5/2563 BE.
//  Copyright © 2563 Nattarika. All rights reserved.
//

import SwiftUI

struct MoodRowView: View {
    var mood: Mood
    
    
    
    
    var body: some View {
        ZStack {
        
            Rectangle().fill(Color(UIColor.systemBackground)).cornerRadius(10).shadow(color: .gray, radius: 5, x: 1, y: 1)
            
            HStack {
                moodImage()
            
                VStack(alignment: .leading) {
                    HStack {
                        Text(mood.monthString)
                        Text(mood.day)
                    }
                    moodName()
                    Text(mood.text)
                    
                }.padding()
                Spacer()

                
            }
//            HStack {
//                VStack {
//                    Text(mood.date)
//                    Text("\(mood.dayAsInt)")
//
//                }
//                Text(mood.text ?? "No caption made.").font(.title).bold()
//                Spacer()
//
//                moodImage()
//
//            }
            .foregroundColor(mood.emotion.moodColor)
            .padding()
            
        }
    }
    
    func moodImage() -> some View {
        var imageName = "none"
        
        switch mood.emotion.state {
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
        return Image(imageName).resizable().frame(width: 70, height: 70)
    }
    
    func moodName() -> some View {
        var name = "none"
        
        switch mood.emotion.state {
            case .sad:
                name = "Sad"
            case .angry:
                name = "Angry"
            case .tense:
                name = "Tense"
            case .calm:
                name = "Calm"
            case .excited:
                name = "Excited"
            case .happy:
                name = "Happy"
        }
        return Text("\(name)")
    }
    
}


struct MoodRowView_Previews: PreviewProvider {
    static var previews: some View {
        MoodRowView(mood: Mood(emotion: Emotion(state: .happy, color: .happyColor), text: "Test", date: Date()))
    }
}


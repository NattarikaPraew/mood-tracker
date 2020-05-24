//
//  Colors.swift
//  MoodTracker_v2
//
//  Created by Dhittaya and Nattarika on 21/5/2563 BE.
//  Copyright © 2563 Dhittaya and Nattarika. All rights reserved.
//

import Foundation
import SwiftUI

class Colors: ObservableObject {

    //Foreground
    @Published var textColor: Color = Color.primary
    @Published var todayColor: Color = Color.blue
    @Published var disabledColor: Color = Color.gray
    @Published var selectedColor: Color = Color.primary

    //Background
    @Published var backgroundColor: Color = Color.clear
    @Published var weekdayBackgroundColor: Color = Color.clear
    @Published var selectedBackgroundColor: Color = Color.yellow

}

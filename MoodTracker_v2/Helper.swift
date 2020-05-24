//
//  Helper.swift
//  MoodTracker_v2
//
//  Created by Dhittaya and Nattarika on 22/5/2563 BE.
//  Copyright © 2563 Dhittaya and Nattarika. All rights reserved.
//

import Foundation

extension Date {

    func dateToString(format: String) -> String {
        let dateFormat = DateFormatter.init()
        dateFormat.dateFormat = format
        let dateString = dateFormat.string(from: self)
        return dateString
    }
}


extension String {

    func stringToDate(format: String) -> Date {
        let dateFormat = DateFormatter.init()
        dateFormat.dateFormat = format
        let date = dateFormat.date(from: self)!
        return date
    }

}

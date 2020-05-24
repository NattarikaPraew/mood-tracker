//
//  NotifyView.swift
//  MoodTracker_v2
//
//  Created by Dhittaya and Nattarika on 23/5/2563 BE.
//  Copyright © 2563 Dhittaya and Nattarika. All rights reserved.
//

import SwiftUI
import UserNotifications

struct NotifyView: View {
    
    @State var show = false
    @State var selectedTime = Date()
    
    var body: some View {
        NavigationView {
            Form {
                DatePicker("Select Date", selection: self.$selectedTime,  displayedComponents: .hourAndMinute).labelsHidden()
                ZStack{
                    Button(action: {
                        
                        self.send()
                        
                    }){
                        Text("Set Notification")
                    }
                }.onAppear {
                    NotificationCenter.default.addObserver(forName: NSNotification.Name("Detail"), object: nil, queue: .main) { (_) in
                        
                        self.show = true
                    }
                }
                
            }.navigationBarTitle("Time")
        }
        
        
        
    }
    
    func send() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound , .badge]) { (_, _) in
            
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Hi How are you today?"
        content.body = "Don't forget to update your mood :)"
        
        let open = UNNotificationAction(identifier: "open", title: "Open", options: .foreground)
        
        let cancel = UNNotificationAction(identifier: "cancel", title: "Cancel", options: .destructive)
        
        let categories = UNNotificationCategory(identifier: "action", actions: [open,cancel], intentIdentifiers: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([categories])
        
        content.categoryIdentifier = "action"
        

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
//        let hour = Calendar.current.component(.hour, from: selectedTime)
//
//        var dateComponents = DateComponents()
//        dateComponents.calendar = Calendar.current
//        dateComponents.hour = hour
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let req = UNNotificationRequest(identifier: "req", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
    }
}

struct NotifyView_Previews: PreviewProvider {
    static var previews: some View {
        NotifyView()
    }
}

//
//  UNService.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 12/01/2021.
//  Copyright © 2021 Eduardo Fulgencio. All rights reserved.
//

import Foundation
import UserNotifications

enum NotificationActionID: String {
    case favoritos = "userNotification.action.favoritos"
}

enum NotificationCategory: String {
     case favoritos = "userNotification.category.favoritos"
}


class UNService: NSObject {
    
    private override init() {}
    static let shared = UNService()
    
    let unCenter = UNUserNotificationCenter.current()
    
    func authorize() {
        let options: UNAuthorizationOptions = [.alert, .badge]
        unCenter.requestAuthorization(options: options) { (granted, error) in
            print(error ?? "No UN auth error")
            guard granted else {
                print("USER DENIED ACCESs")
                return
            }
            
            self.configure()
        }
    }
    
    func configure() {
        unCenter.delegate = self
    }

    func queueRequest(title thisIsTitle: String = "Favoritos", subTitle: String = "") {
        let content = UNMutableNotificationContent()
        content.title = thisIsTitle
        content.body = subTitle
        content.sound = .default
        content.badge = 1
        content.categoryIdentifier = NotificationCategory.favoritos.rawValue
        
        let request = UNNotificationRequest(identifier: NotificationCategory.favoritos.rawValue,
                                            content: content,
                                            trigger: nil)
        unCenter.add(request)
    }
    
}

extension UNService: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("UN did receive response")
        
        if let action = NotificationActionID(rawValue: response.actionIdentifier) {
            NotificationCenter.default.post(name: NSNotification.Name("internalNotification.handleAction"),
                                            object: action)
        }
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("UN WILL present")
        
        let options: UNNotificationPresentationOptions = [.alert]
        completionHandler(options)
    }
}


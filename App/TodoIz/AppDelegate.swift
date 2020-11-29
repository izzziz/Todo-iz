//
//  AppDelegate.swift
//  Todoiz
//
//  Created by Izzat Jabali on 13/8/20.
//  Copyright © 2020 Izzat Jabali. All rights reserved.
//

import UIKit
import SwipeCellKit
import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
     //   print(Realm.Configuration.defaultConfiguration.fileURL)
        
        
        do {
            _ = try Realm()
            
        } catch {
            print("Error initialising new real, \(error)")
        }
        
 
        return true
    }

    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//
//    }
//
}

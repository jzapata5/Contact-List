//
//  AppDelegate.swift
//  Contact List
//
//  Created by Jiana Zapata on 4/7/21.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //reference to standard user defaults
        //android studio would be shared preferences
        let settings = UserDefaults.standard
        
        //check whether a value is already stored with two specific keys
        if settings.string(forKey: Constants.kSortField) == nil {
            settings.set("City", forKey: Constants.kSortField)
        }
        
        //same value check for sort direction if no value, set true
        if settings.string(forKey: Constants.kSortDirectionAscending) == nil {
        settings.set(true, forKey: Constants.kSortDirectionAscending)
        }
        
        //any changes saved back to settings file
        settings.synchronize()
        
        //write the values to the NSLog
        print("Sort field: \(settings.string(forKey: Constants.kSortField)!)")
        print("Sort direction: \(settings.bool(forKey: Constants.kSortDirectionAscending))")
        
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    //MARK: Core Data Stack
    
    lazy var persistentContainer:  NSPersistentContainer = {
        /*
         The persistent container for the application.
         This implementation creates and returns a container, having loaded the store
         for the application. This propert is optional since there are error conditions
         that could cause the ceration of the store to fail.
         */
        
        let container = NSPersistentContainer(name: "MyContactListModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
            //replace this implementation with code to handle the error properly
            //fatal error() causes app to generate crash log and terminate (shouldn't use shipping app)
            
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
        })
        return container
    }()
    
    //MARK: - Core Data Saving Support
    func saveContext () {
        let context = persistentContainer.viewContext
       
        
        if context.hasChanges {
            do {
                try context.save
        
            } catch {
        
                let nserror = error as NSError
                
    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}


}




//
//  IConRentalServiceApp.swift
//  IConRentalService
//
//  Created by Bradley Stephen on 2022-03-26
//

import SwiftUI
import Firebase
import FirebaseCore


@main
struct IConRentalServiceApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
   
    var body: some Scene {
        
        WindowGroup {
            let viewModel = ViewModel()
            
            ContentView()
                .environmentObject(viewModel)
                
        }
    }
}




//function 1:didfinishlaunchgingwithoptions
class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
    
}








//
//  frente_iOSApp.swift
//  frente-iOS
//
//  Created by JunnKyuu on 6/2/25.
//

import SwiftUI
import FirebaseCore
import Feature

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct frente_iOSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var isSplashActive: Bool = true
    
    var body: some Scene {
        WindowGroup{
            if isSplashActive {
                SplashView(isActive: $isSplashActive)
            } else {
                ContentView()
            }
        }
    }
}


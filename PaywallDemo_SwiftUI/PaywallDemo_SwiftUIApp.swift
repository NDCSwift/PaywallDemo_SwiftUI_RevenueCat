//
        //
    //  Project: PaywallDemo_SwiftUI
    //  File: PaywallDemo_SwiftUIApp.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI
import RevenueCat

@main
struct PaywallDemo_SwiftUIApp: App {
    @State private var store = RCSubscriptionManager()
    
    init(){
        Purchases.logLevel = .debug
        Purchases.configure(withAPIKey: "YOUR_API_KEY_HERE")
    }
    var body: some Scene {
        WindowGroup {
            //Swap to ContentView for tutorial view and AdvancedView for Sample app demo
            //AdvancedView()
            ContentView()
                .environment(store)
        }
    }
}

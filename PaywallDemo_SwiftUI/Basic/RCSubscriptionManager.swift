//
        //
    //  Project: PaywallDemo_SwiftUI
    //  File: RCSubscriptionManager.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    import RevenueCat
import SwiftUI

@Observable
class RCSubscriptionManager{
    
    var isSubscribed = false
    var offerings: Offerings?
    var isLoading = false
    var errorMessage: String?
    var usageCount: Int = 0
    var freeUsageLimit = 3
    
    
    
    init() {
        Task { await refresh() }
    }
    
    func recordUsage() {
        usageCount += 1
    }
    
    func refresh() async {
        isLoading = true
        do{
            let customerInfo = try await Purchases.shared.customerInfo()
            isSubscribed = customerInfo.entitlements["pro"]?.isActive == true
            
            offerings = try await Purchases.shared.offerings()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    func purchase(_ package: Package) async throws {
        let result = try await Purchases.shared.purchase(package: package)
        isSubscribed = result.customerInfo.entitlements["pro"]?.isActive == true
    }
    
    func restorePurchases() async throws {
        let customerInfo = try await Purchases.shared.restorePurchases()
        isSubscribed = customerInfo.entitlements["pro"]?.isActive == true
    }
    
}


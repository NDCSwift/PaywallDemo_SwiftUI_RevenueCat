//
        //
    //  Project: PaywallDemo_SwiftUI
    //  File: PaywallView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI
import RevenueCat

struct PaywallView: View {
    @Environment(RCSubscriptionManager.self) private var store
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedPackage: Package?
    @State private var isPurchasing = false
    @State private var showError = false
    
    private var packages: [Package] {
        store.offerings?.current?.availablePackages ?? []
    }
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.purple, Color.red, Color.black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack{
                    HStack{
                        Spacer()
                        Button {
                            dismiss()
                        } label:{
                            Image(systemName: "xmark.circle.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                        }
                    }
                    .padding(.horizontal)
                    VStack{
                        Text("Go Pro")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.yellow)
                        
                        Text("Unlock everything. cancel anytime")
                            .font(.headline)
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    
                    //Products
                    
                    if store.isLoading {
                        ProgressView()
                            .tint(.white)
                    } else {
                        VStack{
                            ForEach(packages, id: \.identifier){ package in
                                Button{
                                    selectedPackage = package
                                } label: {
                                    Text("\(package.storeProduct.localizedTitle) - \(package.storeProduct.localizedPriceString)")
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(selectedPackage?.id == package.id ? Color.green : Color.blue)
                            }
                        }
                    }
                    
                    //purchase button
                    Button {
                        Task { await handlePurchase() }
                    } label: {
                        if isPurchasing {
                            ProgressView()
                                .tint(.white)
                        } else {
                            Text(selectedPackage == nil ? "Select a plan" : "Continue")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("Restore Purchases") {
                        Task { try? await store.restorePurchases() }
                    }
                    .buttonStyle(.glassProminent)
                    .tint(.yellow)
                    .foregroundStyle(.black)
                    
                    Text("Auto - renews. Cancel anytime in settings")
                        .foregroundStyle(.white)
                }
            }
            
        }
        .onAppear {
            selectedPackage = packages.last
        }
        .alert("Purchase Failed", isPresented: $showError){
            Button("OK", role: .cancel) { }
        } message: {
            Text(store.errorMessage ?? "Something went Wrong")
        }
    }
    
    private func handlePurchase() async {
        guard let package = selectedPackage else { return }
        isPurchasing = true
        
        do {
            try await store.purchase(package)
            dismiss()
        } catch {
            showError = true
        }
        isPurchasing = false
    }
}

#Preview {
    PaywallView()
        .environment(RCSubscriptionManager())
}

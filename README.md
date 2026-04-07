# 💳 Paywall Demo SwiftUI

A production-ready iOS paywall built with SwiftUI and StoreKit 2 — no RevenueCat, no third-party SDKs.

## 📖 What this is
This project is a complete SwiftUI paywall implementation using StoreKit 2, covering product fetching, purchase flow, transaction verification, restore purchases, and local sandbox testing. Two versions are included: a clean baseline and a fully polished advanced build. It's structured so you can drop the paywall directly into an existing app or use it as a reference for your own implementation.

## ✅ Why you'd use it
- **Pure StoreKit 2 — no lock-in** — skip RevenueCat and own your IAP stack with native Apple frameworks
- **Test without App Store Connect** — the included StoreKit config file runs a full purchase flow in the simulator with zero setup
- **Two tiers of implementation** — the basic version gets you shipping fast; the advanced version shows how a polished production paywall actually behaves

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtu.be/9QmnlxGHINU)

## 🚀 Getting Started
1. Clone the repo
2. Open `PaywallDemo_SwiftUI.xcodeproj` in Xcode
3. Navigate to **Target → Signing & Capabilities → Team** and select your team
4. Update the bundle ID (e.g. `com.yourname.SwiftUIPaywall`)
5. Enable the StoreKit config: **Edit Scheme → Run → Options → StoreKit Configuration** → select `Products.storekit`
6. Select a simulator and run — tap the upgrade button to trigger the paywall

## 📝 Notes
- Built with SwiftUI and StoreKit 2
- Requires `@Observable` — iOS 17+ deployment target (for iOS 16, swap to `ObservableObject` + `@Published`)
- **Products don't load?** Confirm the StoreKit config is selected in your scheme
- **Sandbox testing on device:** Create a Sandbox tester in App Store Connect, sign in under Settings → Developer → Sandbox Account. Sandbox subscriptions renew on compressed intervals (monthly = every 5 min)

## ⚙️ Requirements
- iOS 17+
- Xcode 15+
- Swift 5.9+
- No third-party dependencies

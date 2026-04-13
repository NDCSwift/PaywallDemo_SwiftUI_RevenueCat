# 💳 Paywall Demo SwiftUI — RevenueCat

A production-ready iOS paywall built with SwiftUI and RevenueCat — no manual StoreKit wiring required.

## 📖 What this is
This is the RevenueCat companion to the [PaywallDemo_SwiftUI](https://github.com/NDCSwift/PaywallDemo_SwiftUI) project. It covers the same four paywall patterns but delegates all subscription logic to RevenueCat: entitlement checks, purchase flow, and restore purchases all go through `Purchases.shared`. Two versions are included: a clean tutorial baseline (`ContentView`) and a fully polished advanced demo (`AdvancedView`).

## ✅ Why you'd use it
- **RevenueCat handles the hard parts** — no manual transaction verification, receipt parsing, or StoreKit listener setup
- **Four real-world paywall patterns** — Hard Feature Gate, Usage Limit Gate, Content Gate, and Soft Nudge, all wired to a live `"pro"` entitlement
- **Drop-in `RCSubscriptionManager`** — a single `@Observable` class wraps offerings, purchase, and restore; plug it into any app via `.environment(store)`
- **Two tiers of implementation** — the basic version gets you shipping fast; the advanced version shows how a polished production paywall actually behaves

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtu.be/lEbdELaxzpM)

## 🚀 Getting Started
1. Clone the repo
2. Open `PaywallDemo_SwiftUI.xcodeproj` in Xcode
3. Add the RevenueCat package: **File → Add Package Dependencies** → `https://github.com/RevenueCat/purchases-ios`
4. In `PaywallDemo_SwiftUIApp.swift`, replace `"YOUR_API_KEY_HERE"` with your RevenueCat public API key
5. In the RevenueCat dashboard, create a `"pro"` entitlement and attach your products to it
6. Navigate to **Target → Signing & Capabilities → Team** and select your team
7. Update the bundle ID (e.g. `com.yourname.SwiftUIPaywall`)
8. Select a simulator or device and run — tap any paywall trigger to test the flow

## 🧩 Paywall Patterns
| Pattern | Behaviour |
|---|---|
| **Hard Feature Gate** | Paywall fires immediately on tap if not subscribed |
| **Usage Limit Gate** | Feature works freely up to a limit, then paywall fires |
| **Content Gate** | Content renders but is blurred behind a material overlay |
| **Soft Nudge** | Feature always works; a non-blocking banner surfaces upgrade value |

## 📝 Notes
- Built with SwiftUI and RevenueCat SDK
- Requires `@Observable` — iOS 17+ deployment target (for iOS 16, swap to `ObservableObject` + `@Published`)
- The entitlement identifier is hardcoded as `"pro"` in `RCSubscriptionManager.swift` — update it to match your dashboard
- Switch between tutorial and advanced demo by swapping the commented lines in `PaywallDemo_SwiftUIApp.swift`
- **Sandbox testing on device:** Create a Sandbox tester in App Store Connect, sign in under Settings → Developer → Sandbox Account. RevenueCat's dashboard shows sandbox events in real time

## ⚙️ Requirements
- iOS 17+
- Xcode 15+
- Swift 5.9+
- [RevenueCat iOS SDK](https://github.com/RevenueCat/purchases-ios)
- A RevenueCat account with a configured `"pro"` entitlement

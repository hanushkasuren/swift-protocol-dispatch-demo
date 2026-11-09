//
//  Analytics.swift
//  ProtocolDispatchDemo
//
//  Created by Hanushka Suren on 07/11/2026.
//

// The same code twice. Trap is the version where trackScreen only lives in the extension.
// Fixed adds trackScreen to the protocol and changes nothing else.
// The mocks live in the test target, in MockAnalytics.swift.

enum Trap {
    protocol Analytics {
        func track(_ event: String)
    }

    final class CheckoutViewModel {
        private let analytics: any Analytics

        init(analytics: any Analytics) {
            self.analytics = analytics
        }

        func onAppear() {
            analytics.trackScreen("checkout")
        }
    }
}

extension Trap.Analytics {
    func trackScreen(_ name: String) {
        track("screen_view:\(name)")
    }
}

enum Fixed {
    protocol Analytics {
        func track(_ event: String)
        func trackScreen(_ name: String)
    }

    final class CheckoutViewModel {
        private let analytics: any Analytics

        init(analytics: any Analytics) {
            self.analytics = analytics
        }

        func onAppear() {
            analytics.trackScreen("checkout")
        }
    }
}

extension Fixed.Analytics {
    func trackScreen(_ name: String) {
        track("screen_view:\(name)")
    }
}

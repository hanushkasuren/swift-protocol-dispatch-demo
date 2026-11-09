//
//  MockAnalytics.swift
//  ProtocolDispatchDemoTests
//
//  Created by Hanushka Suren on 07/11/2026.
//

@testable import ProtocolDispatchDemo

// The same mock for both versions. It records screen views separately from other events.

extension Trap {
    final class MockAnalytics: Analytics {
        var events: [String] = []
        var screens: [String] = []

        func track(_ event: String) {
            events.append(event)
        }

        func trackScreen(_ name: String) {
            screens.append(name)
        }
    }
}

extension Fixed {
    final class MockAnalytics: Analytics {
        var events: [String] = []
        var screens: [String] = []

        func track(_ event: String) {
            events.append(event)
        }

        func trackScreen(_ name: String) {
            screens.append(name)
        }
    }
}

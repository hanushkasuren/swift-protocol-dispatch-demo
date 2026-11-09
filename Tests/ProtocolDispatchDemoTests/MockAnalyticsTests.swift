//
//  MockAnalyticsTests.swift
//  ProtocolDispatchDemoTests
//
//  Created by Hanushka Suren on 07/11/2026.
//

import Testing
@testable import ProtocolDispatchDemo

struct MockAnalyticsTests {
    @Test func mockTrackScreenIsSkippedWhenItIsNotARequirement() {
        // Given
        let analytics = Trap.MockAnalytics()
        let viewModel = Trap.CheckoutViewModel(analytics: analytics)

        // When
        viewModel.onAppear()

        // Then
        #expect(analytics.screens.isEmpty)
        #expect(analytics.events == ["screen_view:checkout"])
    }

    @Test func mockTrackScreenIsCalledOnceItIsARequirement() {
        // Given
        let analytics = Fixed.MockAnalytics()
        let viewModel = Fixed.CheckoutViewModel(analytics: analytics)

        // When
        viewModel.onAppear()

        // Then
        #expect(analytics.screens == ["checkout"])
        #expect(analytics.events.isEmpty)
    }
}

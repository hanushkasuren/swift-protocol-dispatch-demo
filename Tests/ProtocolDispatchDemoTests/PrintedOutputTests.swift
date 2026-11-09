//
//  PrintedOutputTests.swift
//  ProtocolDispatchDemoTests
//
//  Created by Hanushka Suren on 07/11/2026.
//

import Testing
@testable import ProtocolDispatchDemo

/// Checks what each example prints. Serialized because every test shares Console.
@Suite(.serialized)
struct PrintedOutputTests {
    @Test func sameNamePrintsStructThenProtocol() {
        // Given
        Console.reset()

        // When
        Examples.sameName()

        // Then
        #expect(Console.lines == ["Struct", "Protocol"])
    }

    @Test func declaringHiInTheProtocolPrintsStructTwice() {
        // Given
        Console.reset()

        // When
        Examples.sameNameFixed()

        // Then
        #expect(Console.lines == ["Struct", "Struct"])
    }

    @Test func genericFunctionPrintsProtocol() {
        // Given
        Console.reset()

        // When
        Examples.genericFunction()

        // Then
        #expect(Console.lines == ["Protocol"])
    }

    @Test func greetCalledOnBotPrintsProtocol() {
        // Given
        Console.reset()

        // When
        Examples.greet()

        // Then
        #expect(Console.lines == ["Protocol"])
    }

    @Test func greetWithHiDeclaredPrintsStruct() {
        // Given
        Console.reset()

        // When
        Examples.greetFixed()

        // Then
        #expect(Console.lines == ["Struct"])
    }

    @Test func subclassIsSkippedWhenBaseUsesTheDefault() {
        // Given
        Console.reset()

        // When
        Examples.subclass()

        // Then
        #expect(Console.lines == ["Child", "Default"])
    }

    @Test func subclassOverrideIsUsedWhenBaseHasItsOwnMethod() {
        // Given
        Console.reset()

        // When
        Examples.subclassFixed()

        // Then
        #expect(Console.lines == ["Child"])
    }

    @Test func everyExampleInTheAppPrintsItsExpectedOutput() {
        for example in Examples.all {
            // Given
            Console.reset()

            // When
            example.run()

            // Then
            #expect(Console.lines == example.expected, "\(example.title)")
        }
    }
}

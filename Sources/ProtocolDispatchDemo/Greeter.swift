//
//  Greeter.swift
//  ProtocolDispatchDemo
//
//  Created by Hanushka Suren on 07/11/2026.
//

// hi() is not declared in the protocol. It only lives in the extension.
protocol Greeter {}

extension Greeter {
    func hi() { print("Protocol") }
}

struct Bot: Greeter {
    func hi() { print("Struct") }
}

// hi() is declared in the protocol, so the extension's version is only a default.
protocol FixedGreeter {
    func hi()
}

extension FixedGreeter {
    func hi() { print("Protocol") }
}

struct FixedBot: FixedGreeter {
    func hi() { print("Struct") }
}

// Inside a generic function the type Swift sees is "some Greeter", not Bot.
func callHi<T: Greeter>(_ value: T) {
    value.hi()
}

// An extension method that calls another method.
extension Greeter {
    func greet() { hi() }
}

extension FixedGreeter {
    func greet() { hi() }
}

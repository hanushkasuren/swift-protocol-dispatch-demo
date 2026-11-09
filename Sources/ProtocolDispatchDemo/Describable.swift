//
//  Describable.swift
//  ProtocolDispatchDemo
//
//  Created by Hanushka Suren on 07/11/2026.
//

// The subclass example. In Trap, Base conforms using the extension's default,
// so Child's describe() is never used through the protocol.
// In Fixed, Base has its own describe() and Child overrides it.

extension Trap {
    protocol Describable {
        func describe() -> String
    }

    class Base: Describable {}

    class Child: Base {
        func describe() -> String { "Child" }
    }
}

extension Trap.Describable {
    func describe() -> String { "Default" }
}

extension Fixed {
    protocol Describable {
        func describe() -> String
    }

    class Base: Describable {
        func describe() -> String { "Base" }
    }

    class Child: Base {
        override func describe() -> String { "Child" }
    }
}

extension Fixed.Describable {
    func describe() -> String { "Default" }
}

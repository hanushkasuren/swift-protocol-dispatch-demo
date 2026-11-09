//
//  Examples.swift
//  ProtocolDispatchDemo
//
//  Created by Hanushka Suren on 07/11/2026.
//

/// One runnable example, with the output it should print.
struct Example: Identifiable {
    let section: String
    let title: String
    let expected: [String]
    let run: () -> Void

    var id: String { title }
}

enum Examples {
    static var all: [Example] {
        [
            Example(section: "Same name, two methods", title: "Called on Bot, then any Greeter", expected: ["Struct", "Protocol"], run: sameName),
            Example(section: "Same name, two methods", title: "hi() declared in the protocol", expected: ["Struct", "Struct"], run: sameNameFixed),
            Example(section: "Same name, two methods", title: "Generic function", expected: ["Protocol"], run: genericFunction),
            Example(section: "Extension calling extension", title: "greet() calls hi()", expected: ["Protocol"], run: greet),
            Example(section: "Extension calling extension", title: "greet() with hi() declared", expected: ["Struct"], run: greetFixed),
            Example(section: "Subclasses", title: "Base uses the default", expected: ["Child", "Default"], run: subclass),
            Example(section: "Subclasses", title: "Base has its own describe()", expected: ["Child"], run: subclassFixed),
        ]
    }

    static func sameName() {
        let bot = Bot()
        let greeter: any Greeter = bot

        bot.hi()
        greeter.hi()
    }

    static func sameNameFixed() {
        let bot = FixedBot()
        let greeter: any FixedGreeter = bot

        bot.hi()
        greeter.hi()
    }

    static func genericFunction() {
        callHi(Bot())
    }

    static func greet() {
        let bot = Bot()
        bot.greet()
    }

    static func greetFixed() {
        let bot = FixedBot()
        bot.greet()
    }

    static func subclass() {
        let child = Trap.Child()
        let describable: any Trap.Describable = child

        print(child.describe())
        print(describable.describe())
    }

    static func subclassFixed() {
        let describable: any Fixed.Describable = Fixed.Child()

        print(describable.describe())
    }
}

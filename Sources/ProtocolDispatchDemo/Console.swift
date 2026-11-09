//
//  Console.swift
//  ProtocolDispatchDemo
//
//  Created by Hanushka Suren on 07/11/2026.
//

import Foundation

/// Records everything the examples print, so the app and the tests can show and check it.
enum Console {
    private static let lock = NSLock()
    nonisolated(unsafe) private static var storage: [String] = []

    static var lines: [String] { lock.withLock { storage } }
    static func reset() { lock.withLock { storage = [] } }
    static func append(_ line: String) { lock.withLock { storage.append(line) } }
}

/// Shadows Swift.print inside this module, so the example code can call print exactly as written
/// while the output is still captured. It also prints to the Xcode console as normal.
func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    let line = items.map { "\($0)" }.joined(separator: separator)
    Console.append(line)
    Swift.print(line, terminator: terminator)
}

# Swift Protocol Dispatch Demo

A small runnable project that shows when Swift calls a type's own method and when it calls a protocol extension's method instead, even though both have the same name.

The app lists seven examples. Each one prints its result, and the app shows the expected output next to the actual output. Swift Testing tests check every result, plus a test mock that is silently skipped.

## What is inside

- `Greeter.swift` has the core example. `Bot` and the `Greeter` extension both have a `hi()` method, but `hi()` is not declared in the protocol. `FixedGreeter` is the same code with `hi()` declared in the protocol. The file also has a generic `callHi(_:)` and a `greet()` extension method that calls `hi()`
- `Analytics.swift` has a view model that tracks a screen view through a protocol. In `Trap`, `trackScreen(_:)` only lives in the extension. In `Fixed`, it is also declared in the protocol
- `Describable.swift` has a class that conforms using the extension's default, and a subclass with its own `describe()`. In `Fixed`, the base class has its own `describe()` and the subclass overrides it
- `Examples.swift` runs each of the seven examples. The app and `PrintedOutputTests` both use it
- `PrintedOutputTests` checks what every example prints
- `MockAnalytics.swift` in the test target has a mock that records screen views separately from other events
- `MockAnalyticsTests` shows that the mock's `trackScreen(_:)` is never called in `Trap`, and is called in `Fixed`

`Trap` and `Fixed` are only namespaces, so both versions of the same code can live in one project.

`Console.swift` defines a `print` function that records each line before printing it. That lets the examples call `print` as normal while the app and the tests read the output.

## Requirements

- Xcode 16 or later
- iOS 17 or later

## Run it

1. Clone the repo and open `ProtocolDispatchDemo.xcodeproj`.
2. Pick an iPhone simulator and run with Cmd+R.
3. Run the tests with Cmd+U.

## What to try

Open an example and tap Run.

1. **Called on Bot, then any Greeter** prints `Struct`, then `Protocol`, for the same `Bot`.
2. **hi() declared in the protocol** prints `Struct` twice. The only change is one line in the protocol.
3. **greet() calls hi()** is called directly on a `Bot` and still prints `Protocol`.
4. **Base uses the default** prints `Child` when called on the subclass directly, then `Default` when called through the protocol.
5. Run the tests and read `MockAnalyticsTests` to see a mock method that is never called, with no error or warning.

//
//  ExampleRunnerView.swift
//  ProtocolDispatchDemo
//
//  Created by Hanushka Suren on 07/11/2026.
//

import SwiftUI

/// Runs an example and compares what it printed with the expected output.
struct ExampleRunnerView: View {
    let example: Example

    @State private var output: [String]?

    var body: some View {
        List {
            Section("Expected output") {
                ForEach(Array(example.expected.enumerated()), id: \.offset) { Text($0.element).monospaced() }
            }

            if let output {
                Section("Actual output") {
                    ForEach(Array(output.enumerated()), id: \.offset) { Text($0.element).monospaced() }
                }
                
                Section {
                    Label(output == example.expected ? "Matches" : "Does not match",
                          systemImage: output == example.expected ? "checkmark.circle.fill" : "xmark.octagon.fill")
                        .foregroundStyle(output == example.expected ? .green : .red)
                }
            }
        }
        .navigationTitle(example.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Run") {
                Console.reset()
                example.run()
                output = Console.lines
            }
        }
    }
}

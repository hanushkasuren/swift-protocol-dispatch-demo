//
//  ExamplesListView.swift
//  ProtocolDispatchDemo
//
//  Created by Hanushka Suren on 07/11/2026.
//

import SwiftUI

/// Lists every example. Tap one, then Run, to see what it prints.
struct ExamplesListView: View {
    private let sections = ["Same name, two methods", "Extension calling extension", "Subclasses"]

    var body: some View {
        NavigationStack {
            List {
                ForEach(sections, id: \.self) { section in
                    Section(section) {
                        ForEach(Examples.all.filter { $0.section == section }) { example in
                            NavigationLink(example.title) {
                                ExampleRunnerView(example: example)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Protocol Dispatch")
        }
    }
}

#Preview { ExamplesListView() }

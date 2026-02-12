//
//  kDisclosureGroup.swift
//  DisplayingDataInLists
//
//  Created by Probeer on 08/01/26.
//

// MARK: DisclosureGroup is a SwiftUI view that shows/hides content with an expand/collapse arrow. 

import SwiftUI

struct FAQ: Identifiable {
    let id = UUID()
    var question: String
    var answer: String
}

struct kDisclosureGroup: View {
    let faqs: [FAQ] = [
        FAQ(
            question: "What is SwiftUI?",
            answer: "SwiftUI is Apple’s declarative framework for building user interfaces across iOS, iPadOS, macOS, watchOS, and tvOS."
        ),
        FAQ(
            question: "What is a View in SwiftUI?",
            answer: "A View is a protocol that defines a piece of UI. Every screen and UI component in SwiftUI conforms to the View protocol."
        ),
        FAQ(
            question: "What is @State in SwiftUI?",
            answer: "@State is a property wrapper that allows SwiftUI to store and manage mutable state within a view."
        ),
        FAQ(
            question: "What is a List in SwiftUI?",
            answer: "A List is a container that displays data in a vertically scrollable collection of rows, optimized for large datasets."
        ),
        FAQ(
            question: "What is a DisclosureGroup?",
            answer: "DisclosureGroup allows content to be expanded or collapsed, making it useful for FAQs, settings, and grouped information."
        )
    ]
    
    var body: some View {
        List {
            ForEach(faqs) { faq in
                DisclosureGroup {
                    Text(faq.answer)
                } label: {
                    Text(faq.question)
                }
            }
        }
    }
}

#Preview {
    kDisclosureGroup()
}

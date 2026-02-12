//
//  ContentView.swift
//  Disclosure grps
//
//  Created by GU on 09/01/26.
//

import SwiftUI

struct FAQ3 : Identifiable {
    var id = UUID()
    var question: String
    var answer: String
}
struct ContentView: View {
    var faqs: [FAQ3] = [
        FAQ3(question:"Ques1", answer: "Ans1"),
        FAQ3(question:"Ques2", answer: "Ans1"),
        FAQ3(question:"Ques3", answer: "Ans1"),
        FAQ3(question:"Ques4", answer: "Ans1")
    ]
    @State private var isExpanded: Bool = false
    var body: some View {
        List{
            ForEach(faqs){faq in
                DisclosureGroup(isExpanded: $isExpanded) {
                    Text(faq.answer)
                } label: {
                    Text(faq.question)
                }
            }
        }
        Button {
            isExpanded.toggle()
        } label: {
            Text(isExpanded ? "Collapse All" : "Expand All")
        }
        
    }
}

#Preview {
    ContentView()
}

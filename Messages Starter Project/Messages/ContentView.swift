//
//  ContentView.swift
//  Messages
//
//  Created by Probeer on 08/01/26.
//

import SwiftUI

struct ContentView: View {
    @State var messages: [Message] = DataModel.messages
    
    
    var body: some View {
        List {
            ForEach($messages) { $message in
                Message_Row_View(message: $message)
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button {
                            message.isRead.toggle()
                        } label : {
                            Image(systemName: message.isRead ? "message.badge" : "checkmark.message")
                        }
                        .tint(.accentColor)
                        
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button {
                            message.isAlertHidden.toggle()
                        }label : {
                            Image(systemName: message.isAlertHidden ? "bell" : "bell.slash")
                        }
                        .tint(.accentColor)
                        
                        
                    
                        
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            guard messages.firstIndex (where: { $0.id == message.id}) != nil
                            else{
                                return
                            }
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                    .contextMenu {
                        Button {
                            message.isPinned.toggle()
                        } label: {
                            Label("Pin", systemImage: "pin")
                        }
                    }
            }
        }
        .onChange(of: messages) {
            messages.sort{
                if $0.isPinned != !$1.isPinned{
                    return $0.isPinned
                }
                return $0.isPinned && !$1.isPinned
            }
            
        }
    }
}

#Preview {
    ContentView()
}


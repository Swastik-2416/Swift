//
//  Message Row View.swift
//  Messages
//
//  Created by GU on 09/01/26.
//

import SwiftUI

struct Message_Row_View: View {
    @Binding var message: Message
    var body: some View {
        HStack {
            Circle()
                .frame(width: 10)
                .foregroundColor(message.isRead ? .blue : .clear)
                .padding(.leading, 10)
            
            Image(message.contact.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                Text(message.contact.name)
                    .font(.title)
                Text(message.content)
                    .font(.body)
            }
            Spacer()
            VStack {
                Text(message.timestamp.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                    .padding(5)
                HStack {
                    Image(systemName: message.isPinned ? "pin.fill" : "pin")
                        .foregroundStyle(message.isPinned ? .blue : .clear)
                    Image(systemName: "bell" )
                        .foregroundStyle(message.isAlertHidden ? .blue : .clear)
                    
                }
                .foregroundStyle(.blue)
            }
        }
    }
}

//#Preview {
//    Message_Row_View(message: DataModel.messages[0])
//}

//
//  Message.swift
//  Messages
//
//  Created by Probeer on 08/01/26.
//

import Foundation

struct Contact: Identifiable, Equatable{
    var id = UUID()
    var name: String
    var image: String
    
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        lhs.id == rhs.id
    }
}

struct Message: Identifiable, Equatable{
    static func == (lhs: Message, rhs: Message) -> Bool {
        lhs.id == rhs.id &&
        lhs.contact.id == rhs.contact.id &&
        lhs.timestamp == rhs.timestamp &&
        lhs.isPinned == rhs.isPinned &&
        lhs.isRead == rhs.isRead &&
        lhs.isAlertHidden == rhs.isAlertHidden
    }
    var id = UUID()
    var contact: Contact
    var content: String
    var timestamp: Date
    var isPinned: Bool = false
    var isRead: Bool = true
    var isAlertHidden: Bool = false
}

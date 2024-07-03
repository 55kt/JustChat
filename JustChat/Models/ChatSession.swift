//
//  ChatSession.swift
//  JustChat
//
//  Created by Vlad on 3/7/24.
//

import SwiftUI
import RealmSwift

class ChatSession: Object, Identifiable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var user1Id: String = ""
    @objc dynamic var user2Id: String = ""
    let messages = RealmSwift.List<ChatMessage>()
    @objc dynamic var lastMessageTimestamp: Date = Date()

    override static func primaryKey() -> String? {
        return "id"
    }
}

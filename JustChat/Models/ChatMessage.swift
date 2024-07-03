//
//  ChatMessage.swift
//  JustChat
//
//  Created by Vlad on 3/7/24.
//

import SwiftUI
import RealmSwift

class ChatMessage: Object, Identifiable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var senderId: String = ""
    @objc dynamic var receiverId: String = ""
    @objc dynamic var message: String = ""
    @objc dynamic var timestamp: Date = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

//
//  User.swift
//  JustChat
//
//  Created by Vlad on 29/6/24.
//

import SwiftUI
import RealmSwift

class User: Object, Identifiable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
    @objc dynamic var gender: String = ""
    @objc dynamic var about: String = ""
    @objc dynamic var location: String = ""
    @objc dynamic var language: String = ""
    @objc dynamic var isAnonimus: Bool = false
    let tags = RealmSwift.List<String>()
    let photos = RealmSwift.List<String>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}


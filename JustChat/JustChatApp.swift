//
//  JustChatApp.swift
//  JustChat
//
//  Created by Vlad on 28/6/24.
//

import SwiftUI
import Firebase
import RealmSwift

@main
struct JustChatApp: SwiftUI.App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

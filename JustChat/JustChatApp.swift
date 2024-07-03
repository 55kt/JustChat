//
//  JustChatApp.swift
//  JustChat
//
//  Created by Vlad on 28/6/24.
//

import SwiftUI
import Firebase

@main
struct JustChatApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

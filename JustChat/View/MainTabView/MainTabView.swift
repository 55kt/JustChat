//
//  MainTabView.swift
//  JustChat
//
//  Created by Vlad on 29/6/24.
//

import SwiftUI

struct MainTabView: View {
    
    //MARK: - Properties
    @State private var selectedTab = 2
    
    //MARK: - Body
    var body: some View {
        ZStack {
            switch selectedTab {
            case 1:
                ChatsView()
            case 2:
                GoChatView()
            case 3:
                SettingsView()
            default:
                GoChatView()
            }
            
            VStack {
                Spacer()
                CustomTabView(tabSelection: $selectedTab)
            }
        }
    }
}
//MARK: - Preview
#Preview {
    MainTabView()
}

//
//  MainTabView.swift
//  JustChat
//
//  Created by Vlad on 29/6/24.
//

import SwiftUI

struct MainTabView: View {
    
    //MARK: - Properties
    @Binding var selectedTab: Int
    
    //MARK: - Body
    var body: some View {
        VStack {
            switch selectedTab {
            case 1:
                ChatsView()
            case 2:
                SomeView()
            case 3:
                GoChatView()
            case 4:
                ProfileView()
            case 5:
                SettingsView()
            default:
                GoChatView()
            }
            
            Spacer()
        }
        
    }
}
//MARK: - Preview
#Preview {
    MainTabView(selectedTab: .constant(3))
}

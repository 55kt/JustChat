//
//  ContentView.swift
//  JustChat
//
//  Created by Vlad on 28/6/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 3
    @AppStorage("isLogin") private var isLogin: Bool = false
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            
            ZStack {
                Background()
                
                if !isLogin {
                    LoginView()
                } else {
                    Group {
                        MainTabView(selectedTab: $selectedTab)
                            .edgesIgnoringSafeArea(.bottom)
                        
                        CustomTabView(tabSelection: $selectedTab)
                    }
                }
            }
        }
    }
}

//MARK: - Preview
#Preview {
    ContentView()
}

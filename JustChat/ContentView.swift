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
    @State private var showVerificationView: Bool = false
    @State private var verificationID: String? = nil
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            
            ZStack {
                Background()
                
                if !isLogin {
                    LoginView(showVerificationView: $showVerificationView, verificationID: $verificationID)
                } else {
                    Group {
                        MainTabView(selectedTab: $selectedTab)
                            .edgesIgnoringSafeArea(.bottom)
                        
                        CustomTabView(tabSelection: $selectedTab)
                    } test
                }
            }
            
            
            
        }
    }
}

//MARK: - Preview
#Preview {
    ContentView()
}

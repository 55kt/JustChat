//
//  LoginView.swift
//  JustChat
//
//  Created by Vlad on 28/6/24.
//

import SwiftUI

struct LoginView: View {
    
    //MARK: - Properties
    @State private var username = ""
    @State private var password = ""
    @State private var isSecure: Bool = true
    @AppStorage("isLogin") private var isLogin: Bool = false
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                
                // Navigation Title
                Text("Log In")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                // Fields Area
                customFields(username: username, password: password, phoneNumber: "", showPhoneNumber: false)
              
                // Action Button
                customButton(action: {
                    isLogin = true
                    
                }, buttonName: "Log In")
                
                // Navigation Button to Create Account View
                NavigationLink(destination: CreateAccountView()) {
                    Text("Create Account")
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
                Spacer()
            }
            .background(Color(.systemBackground))
        }
    }
}

//MARK: - Preview
#Preview {
    LoginView()
}

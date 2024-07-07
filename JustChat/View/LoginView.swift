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
    @State private var errorMessage: String = ""
    @Binding var showVerificationView: Bool
    @Binding var verificationID: String?
    
    //MARK: - Body
    var body: some View {
        VStack {
            
            // Navigation Title
            Text("Log In")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            if errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundStyle(.red)
                    .padding(.bottom, 20)
            }
            
            // Fields Area
            customFields(username: username, password: password, phoneNumber: "", showPhoneNumber: false)
          
            // Action Button
            customButton(action: {}, buttonName: "Log In")
            
            // Navigation Button to Create Account View
            NavigationLink(destination: CreateAccountView(showVerificationView: $showVerificationView, verificationID: $verificationID)) {
                Text("Create Account")
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
            }
            Spacer()
        }
        .background(Color(.systemBackground))
    }
}

//MARK: - Preview
#Preview {
    LoginView(showVerificationView: .constant(false), verificationID: .constant(nil))
}

//
//  CreateAccountView.swift
//  JustChat
//
//  Created by Vlad on 28/6/24.
//

import SwiftUI

struct CreateAccountView: View {
    
    //MARK: - Properties
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var phoneNumber: String = ""
    @State private var errorMessage: String = ""
    @Binding var showVerificationView: Bool
    @Binding var verificationID: String?
    
    //MARK: - Body
    var body: some View {
        VStack {
            
            // Navigation Title
            Text("Create Account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundStyle(.red)
                    .padding(.bottom, 10)
            }
            
            // Fields Area
            customFields(username: username, password: password, phoneNumber: phoneNumber, showPhoneNumber: true)
            
            // Action Button
            customButton(action: {}, buttonName: "Create Account")
        
            Spacer()
        }
    }
}

//MARK: - Preview
#Preview {
    CreateAccountView(showVerificationView: .constant(false), verificationID: .constant(""))
}

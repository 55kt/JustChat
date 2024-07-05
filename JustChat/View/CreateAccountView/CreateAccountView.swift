//
//  CreateAccountView.swift
//  JustChat
//
//  Created by Vlad on 28/6/24.
//

import SwiftUI

struct CreateAccountView: View {
    
    //MARK: - Properties
    @State private var username = ""
    @State private var password = ""
    @State private var phoneNumber = ""
    @State private var verificationID: String?
    @State private var errorMessage = ""
    @State private var showVerificationView = false
    
    //MARK: - Body
    var body: some View {
        VStack {
            
            if showVerificationView {
                VerificationView(verificationID: $verificationID, showVerificationView: $showVerificationView)
            } else {
                // Navigation Title
                Text("Create Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                // Fields Area
                customFields(username: username, password: password, phoneNumber: phoneNumber, showPhoneNumber: true)
                
                // Action Button
                
                    customButton(action: {
                         
                        if password.count < 6 {
                            errorMessage = "The password must be 6 character long or more"
                        } else {
                            AuthService.shared.registerUser(username: username, password: password, phoneNumber: phoneNumber) { result in
                                switch result {
                                case .success:
                                    AuthService.shared.verifyPhoneNumber(phoneNumber: phoneNumber) { result in
                                        switch result {
                                        case .success(let verificationID):
                                            self.verificationID = verificationID
                                            showVerificationView = true
                                        case .failure(let error):
                                            print("Error sending verification code: \(error.localizedDescription)")
                                        }
                                    }
                                    
                                case .failure(let error):
                                    print("Error registering user: \(error.localizedDescription)")
                                }
                            }
                        }
                }, buttonName: "Create Account")
                
                Spacer()
            }
        }
    }
}

//MARK: - Preview
#Preview {
    CreateAccountView()
}

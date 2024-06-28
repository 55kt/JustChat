//
//  CreateAccountView.swift
//  JustChat
//
//  Created by Vlad on 28/6/24.
//

import SwiftUI

struct CreateAccountView: View {
    
    //MARK: - Properties
    @Binding var isLoginView: Bool
    @State private var isSecure: Bool = true
    @State private var username = ""
    @State private var password = ""
    @State private var phoneNumber = ""
    
    var body: some View {
        VStack {
            
            // Navigation Title
            Text("Create Account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            // Fields Area
            Group {
                TextField("Username", text: $username)
                
                HStack {
                    if isSecure {
                        SecureField("Password", text: $password)
                    }
                    else {
                        TextField("Password", text: $password)
                    }
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        Image(systemName: isSecure ? "eye.slash.fill" : "eye.fill")
                            .foregroundStyle(.gray)
                    }
                }
                
                TextField("Phone Number", text: $phoneNumber)
                
            }
            .padding()
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal)
            .padding(.bottom, 10)
            
            // Create Account Button
            Button {
                self.isLoginView = true
            } label: {
                Text("Log In")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
            }
            Spacer()
        }
    }
}

#Preview {
    CreateAccountView(isLoginView: .constant(false))
}

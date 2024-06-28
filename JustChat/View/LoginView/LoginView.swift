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
    
    //MARK: - Body
    var body: some View {
        VStack {
            
            // Navigation Title
            Text("Log In")
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
            }
            .padding()
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal)
            .padding(.bottom, 10)
            
            // Log In Button
            Button {
                // Some action
            } label: {
                Text("Log In")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            
            // Navigation Button to Create Account View
            NavigationLink(destination: EmptyView()) {
                Text("Create Account")
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
            }
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
    }
}

//MARK: - Preview
#Preview {
    LoginView()
}

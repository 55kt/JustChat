//
//  LoginView.swift
//  JustChat
//
//  Created by Vlad on 28/6/24.
//

import SwiftUI

struct LoginView: View {
    
    //MARK: - Properties
    @Binding var isLoginView: Bool
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
            Fields()
            
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
            // Navigation Button to Log In View
            Button {
                self.isLoginView = false
            } label: {
                Text("Log In")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
            }
            Spacer()
        }
        .background(Color(.systemBackground))
    }
}

//MARK: - Preview
#Preview {
    LoginView(isLoginView: .constant(true))
}

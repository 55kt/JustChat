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
    
    //MARK: - Body
    var body: some View {
        VStack {
            
            // Navigation Title
            Text("Create Account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
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
    CreateAccountView()
}

//
//  Fields.swift
//  JustChat
//
//  Created by Vlad on 28/6/24.
//

import SwiftUI

struct customFields: View {
    
    //MARK: - Properties
    @State private var isSecure: Bool = true
    @State var username: String
    @State var password: String
    @State var phoneNumber: String
    
    var showPhoneNumber: Bool
    
    var body: some View {
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
            if showPhoneNumber {
                TextField("Phone Number", text: $phoneNumber)
                
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

#Preview {
    customFields(username: "", password: "", phoneNumber: "", showPhoneNumber: false)
}

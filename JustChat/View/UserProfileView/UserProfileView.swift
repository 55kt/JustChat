//
//  UserProfileView.swift
//  JustChat
//
//  Created by Vlad on 29/6/24.
//

import SwiftUI

struct UserProfileView: View {
    
    //MARK: - Properties
    @State private var user = User(username: "Jesus Christ", location: "Paradise", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vel turpis facilisis, tincidunt turpis et, dictum nunc.", profileImage: Image(systemName: "person.circle"), isAnonimus: false) // Test User Var
    
    //MARK: - Body
    var body: some View {
        VStack {
            profileImage(image: Image(systemName: "person.circle.fill"))
                .padding(.top, 20)
            
            Text(user.username)
                .font(.title)
                .fontWeight(.bold)
            
            Text(user.location)
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            Text(user.description)
                .font(.body)
                .padding(.top)
            }
            Spacer()
        
        Toggle("Anonimus Status", isOn: $user.isAnonimus)
            .padding()
        
        HStack {
            Button {
                // Settings Action
            } label: {
                Text("Settings")
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        }
    }

//MARK: - Preview
#Preview {
    UserProfileView()
}

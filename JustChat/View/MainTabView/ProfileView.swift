//
//  ProfileView.swift
//  JustChat
//
//  Created by Vlad on 30/6/24.
//

import SwiftUI

struct ProfileView: View {
    
    //MARK: - Properties
    @State private var user = User(username: "Jesus Christ", location: "Paradise", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vel turpis facilisis, tincidunt turpis et, dictum nunc.", profileImage: Image(systemName: "person.circle"), isAnonimus: false) // Test User Var
    
    //MARK: - Body
    var body: some View {
        ZStack {
            customNavBar(navTiltle: "Profile")
            
            VStack() {
                customImage(image: Image(systemName: "person.circle.fill"), imageSize: CGSize(width: 200, height: 200))
                    
                
                Text(user.username)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(user.location)
                    .font(.subheadline)
                    .foregroundStyle(.foreground)
                
                Text(user.description)
                    .font(.body)
                    .padding(.horizontal)
                
                Toggle("Anonimus Status", isOn: $user.isAnonimus)
                    .padding()
                
                    
                }
            .frame(maxHeight: 550, alignment: .top)
            
        }
        
        
        
        
        
        
        
        
        
        }
    }

//MARK: - Preview
#Preview {
    ProfileView()
}

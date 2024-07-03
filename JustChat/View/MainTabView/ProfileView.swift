//
//  ProfileView.swift
//  JustChat
//
//  Created by Vlad on 30/6/24.
//

import SwiftUI

struct ProfileView: View {
    
    //MARK: - Properties
    @State private var user = User()
    
    //MARK: - Body
    var body: some View {
        VStack {
            customNavBar(navTiltle: "Profile")
            
            VStack {
                customImage(image: Image(systemName: "person.circle.fill"), imageSize: CGSize(width: 200, height: 200))
                
                Text(user.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(user.location)
                    .font(.subheadline)
                    .foregroundStyle(.foreground)
                
                Text(user.about)
                    .font(.body)
                    .padding(.horizontal)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                
                Toggle("Anonimus Status", isOn: $user.isAnonimus)
                                    .padding()
            }
            .padding()
            
            Spacer()
            
        }
    }
}

//MARK: - Preview
#Preview {
    ProfileView()
}

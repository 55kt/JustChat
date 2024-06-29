//
//  ProfileImage.swift
//  JustChat
//
//  Created by Vlad on 29/6/24.
//

import SwiftUI

struct profileImage: View {
    
    //MARK: - Properties
    var image: Image
    
    //MARK: - Body
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

//MARK: - Preview
#Preview {
    profileImage(image: Image(systemName: "person.circle.fill"))
}

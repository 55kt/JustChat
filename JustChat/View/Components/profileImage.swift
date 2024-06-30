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
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 7)
    }
}

//MARK: - Preview
#Preview {
    profileImage(image: Image(systemName: "person.circle.fill"))
}

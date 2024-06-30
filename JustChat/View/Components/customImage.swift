//
//  ProfileImage.swift
//  JustChat
//
//  Created by Vlad on 29/6/24.
//

import SwiftUI

struct customImage: View {
    
    //MARK: - Properties
    var image: Image
    var imageSize: CGSize
    
    //MARK: - Body
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: imageSize.width, height: imageSize.height)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 7)
    }
}

//MARK: - Preview
#Preview {
    customImage(image: Image(systemName: "person.circle.fill"), imageSize: CGSize(width: 200, height: 200))
}

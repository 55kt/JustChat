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
            .frame(width: imageSize.width, height: imageSize.height)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 2)
    }
}

//MARK: - Preview
#Preview {
    customImage(image: Image(systemName: "person.circle.fill"), imageSize: CGSize(width: 200, height: 200))
}

//
//  GoChatView.swift
//  JustChat
//
//  Created by Vlad on 29/6/24.
//

import SwiftUI

struct GoChatView: View {
    
    //MARK: - Properties
    
    //MARK: - Body
    var body: some View {
        VStack {
            customNavBar(navTiltle: "GoChat")
            
            Circle()
                .frame(width: 250)
        }
    }
}

//MARK: - Preview
#Preview {
    GoChatView()
}

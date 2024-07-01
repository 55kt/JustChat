//
//  customNavBar.swift
//  JustChat
//
//  Created by Vlad on 30/6/24.
//

import SwiftUI

struct customNavBar: View {
    
    //MARK: - Properties
    let navTiltle: String
    
    //MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            Text(navTiltle)
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .padding(.bottom, 10)
                
        }
        .shadow(radius: 10)
    }
}

//MARK: - Preview
#Preview {
    customNavBar(navTiltle: "Navigation Bar")
}

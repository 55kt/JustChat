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
        ZStack {
            Color.clear
            
            Text(navTiltle)
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
        }
        .frame(height: 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

//MARK: - Preview
#Preview {
    customNavBar(navTiltle: "Navigation Bar")
}

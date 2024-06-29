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
        NavigationView {
            VStack {
                Text("GoChat")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("GoChat")
        }
    }
}

//MARK: - Preview
#Preview {
    GoChatView()
}

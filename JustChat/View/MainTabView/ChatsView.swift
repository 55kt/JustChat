//
//  ChatsView.swift
//  JustChat
//
//  Created by Vlad on 29/6/24.
//

import SwiftUI

struct ChatsView: View {
    
    //MARK: - Properties
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                Text("Chats")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Chats")
        }
    }
}

//MARK: - Preview
#Preview {
    ChatsView()
}

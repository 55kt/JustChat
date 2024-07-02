//
//  ChatsView.swift
//  JustChat
//
//  Created by Vlad on 29/6/24.
//

import SwiftUI

struct ChatsView: View {
    
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                customNavBar(navTiltle: "Chats")
                
                ScrollView {
                    ForEach(0..<10) { num in
                        NavigationLink(destination: MessageView()) {
                            VStack {
                                HStack(spacing: 10) {
                                    customImage(image: Image(systemName: "person.circle.fill"), imageSize: CGSize(width: 60, height: 60))
                                        .padding(2)
                                    VStack(alignment: .leading) {
                                        Text("Username")
                                            .font(.system(size: 18, weight: .bold))
                                        Text("Test Message Text for Preview")
                                            .font(.system(size: 16))
                                            .foregroundStyle(Color(.lightGray))
                                    }
                                    Spacer()
                                    
                                    Text("22 : 59")
                                        .font(.system(size: 14, weight: .semibold))
                                }
                                Divider()
                                    .padding(.vertical, 4)
                            }
                            .padding(.horizontal, 10)
                        }
                    }
                }
            }
        }
    }
}
    
    //MARK: - Preview
    #Preview {
        ChatsView()
    }

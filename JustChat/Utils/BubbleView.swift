//
//  MessageBubble.swift
//  JustChat
//
//  Created by Vlad on 2/7/24.
//

import SwiftUI

struct BubbleView: View {
    
    //MARK: - Properties
    let message: String
    let isReceived: Bool
    let timestamp: String
    let profileImage: Image

    //MARK: - Body
    var body: some View {
        HStack(alignment: .bottom) {
            
            // User Image
            if isReceived {
                profileImage
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(.trailing, 5)
            } else {
                Spacer()
            }
            
            // Message Bubble
            VStack(alignment: isReceived ? .leading : .trailing) {
                Text(message)
                    .padding(15)
                    .background(isReceived ? Color(.systemGray6) : Color.blue.opacity(0.7))
                    .foregroundColor(isReceived ? .black : .white)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    .shadow(color: Color.white.opacity(0.5), radius: 4, x: 0, y: -2)
                
                // Time
                Text(timestamp)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(isReceived ? .leading : .trailing, 15)
            }
            
            // User Image
            if !isReceived {
                profileImage
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(.leading, 5)
            } else {
                Spacer()
            }
        }
        .padding(isReceived ? .leading : .trailing, 20)
        .padding(.vertical, 5)
    }
}

//MARK: - Preview
#Preview {
    BubbleView(message: "", isReceived: false, timestamp: "", profileImage: Image(systemName: "person.fill"))
}

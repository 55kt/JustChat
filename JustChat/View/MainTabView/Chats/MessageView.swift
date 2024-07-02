//
//  MessageView.swift
//  JustChat
//
//  Created by Vlad on 2/7/24.
//

import SwiftUI

struct MessageView: View {
    
    //MARK: - Properties
    @State private var newMessage: String = ""
    @State private var messages: [Message] = [
        Message(id: 0, text: "Why didn't you join us today? It was a pretty awesome day. We all wished you were there with us.", isReceived: true, timestamp: "14:28"),
        Message(id: 1, text: "Also we are planning to have a surprise birthday party for Erina next week. Wanna join?", isReceived: true, timestamp: "14:28"),
        Message(id: 2, text: "Let me check my schedule first. Then I will let you know asap.", isReceived: false, timestamp: "Just now")
    ]
    
    //MARK: - Body
    var body: some View {
        VStack {
            
            // Nav Bar
            HStack {
                Text("User Chat Name")
                    .font(.title)
                    .bold()
                Spacer()
            }
            .padding()
            
            // Messages scroller
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(messages) { message in
                        BubbleView(message: message.text, isReceived: message.isReceived, timestamp: message.timestamp, profileImage: Image(systemName: "person.circle.fill"))
                    }
                }
            }
            .padding()
        }
        
        // Message field
        HStack {
            TextField("Type Here...", text: $newMessage)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(20)
            
            // Send Button
            Button {
                sendMessage()
            } label: {
                Image(systemName: "paperplane.fill")
                    .font(.system(size: 24))
                    .foregroundStyle(.blue)
            }
        }
        .padding()
    }
    
    // Send Message Function
    private func sendMessage() {
        if !newMessage.isEmpty {
            messages.append(Message(id: messages.count, text: newMessage, isReceived: false, timestamp: "Just now"))
            newMessage = ""
        }
    }
}

//MARK: - Initializer
struct Message: Identifiable {
    var id: Int
    var text: String
    var isReceived: Bool
    var timestamp: String
}

//MARK: - Preview
#Preview {
    MessageView()
}

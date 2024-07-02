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
            VStack {
                HStack {
                    // User image
                    backButton
                    
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .cornerRadius(60)
                                    .overlay(RoundedRectangle(cornerRadius: 60)
                                        .stroke(.gray.opacity(0.5))
                                    )
                                    .shadow(radius: 5)
                                
                                // Username
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Username")
                            .font(.system(size: 24, weight: .bold))
                        HStack {
                            // Online status
                            Circle()
                                .foregroundStyle(.green)
                                .frame(width: 14, height: 14)
                            Text("Online")
                                .font(.system(size: 12))
                                .foregroundStyle(Color(.lightGray))
                        }
                    }
                    Spacer()
                        .frame(width: 150)
                }
                .navigationBarBackButtonHidden(true)
            }
            
            
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
                Image(systemName: "arrow.up.message")
                    .font(.system(size: 24))
                    .foregroundStyle(.blue)
            }
        }
        .padding()
    }
    
    // Back Button
    @Environment(\.presentationMode) var presentationMode
    
    var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .font(.title)
            }
        }
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
    NavigationStack {
        MessageView()
    }
}

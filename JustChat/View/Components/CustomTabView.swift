//
//  CustomTabView.swift
//  JustChat
//
//  Created by Vlad on 29/6/24.
//

import SwiftUI

struct CustomTabView: View {
    
    //MARK: - Properties
    @Binding var tabSelection: Int
    @State private var selectedTab: Int = 1
    @Namespace private var animationNamespace
    
    let tabBarItems: [(image: String, title: String)] = [
        ("message", "Chats"),
        ("magnifyingglass", "GoChat"),
        ("gearshape", "Settings")
    ]
    
    //MARK: - Body
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 80)
                .foregroundStyle(Color(.secondarySystemBackground))
                .shadow(radius: 2)
                .blur(radius: 1)
            
            HStack(spacing: 0) {
                ForEach(0..<3) { index in
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            selectedTab = index 
                            tabSelection = index + 1
                        }
                    } label: {
                        VStack(spacing: 10) {
                            Image(systemName: tabBarItems[index].image)
                                .scaleEffect(selectedTab == index ? 2.0 : 1.2)
                                .foregroundStyle(selectedTab == index ? .blue : .gray)
                            Text(tabBarItems[index].title)
                                .font(.caption)
                                .foregroundColor(selectedTab == index ? .blue : .gray)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                }
                .frame(height: 80)
                .clipShape(Capsule())
            }
            .padding(.horizontal)
        }
    }
    
}

//MARK: - Preview
#Preview {
    CustomTabView(tabSelection: .constant(1))
}

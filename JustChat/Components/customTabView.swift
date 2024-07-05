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
    @State private var selectedTab: Int = 2
    @Namespace private var animationNamespace
    
    let tabBarItems: [(image: String, title: String)] = [
        ("message", "Chats"),
        ("questionmark", "SomeView"),
        ("magnifyingglass", "GoChat"),
        ("person.crop.circle", "Profile"),
        ("gearshape", "Settings"),
        
    ]
    
    //MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                HStack(spacing: 0) {
                    ForEach(0..<5) { index in
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
                }
                .padding(.top, 17)
                .padding(.horizontal)
                .padding(.bottom, 20)
                .background(
                    BlurView(style: .systemUltraThinMaterial)
                        .cornerRadius(30)
                        .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)
                )
                .padding(.horizontal, 10)
                .padding(.bottom, 20)
            }
        }
    }
}

//MARK: - Preview
#Preview {
    CustomTabView(tabSelection: .constant(3))
}

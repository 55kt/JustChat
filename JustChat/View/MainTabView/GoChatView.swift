//
//  GoChatView.swift
//  JustChat
//
//  Created by Vlad on 29/6/24.
//

import SwiftUI

struct GoChatView: View {
    
    //MARK: - Properties
        @State private var selectedTags: [String] = []
        @State private var age: Int = 0
        @State private var gender: String = ""
        @State private var country: String = ""
        @State private var language: String = ""
        @State private var searchResult: User? = nil
        @State private var showingChatView = false
        @State private var showingSearchParameters = false
    
    //MARK: - Body
    var body: some View {
        VStack {
            customNavBar(navTiltle: "GoChat")
            
            VStack {
                
                // Search Button
                VStack {
                    Button {
                        showingSearchParameters = true
                    } label: {
                        Image(systemName: "slider.vertical.3")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    // Show Search Fields Window
                    .sheet(isPresented: $showingSearchParameters) {
                        SearchParametersView(selectedTags: $selectedTags, age: .constant(25), gender: $gender, country: $country, language: $language, showingSearchParameters: $showingSearchParameters)
                }
                }.padding(.top, 140)
                
                // Go Chat Button
                VStack {
                    Spacer()
                }
                Button {
                    // some action
                } label: {
                    VStack {
                        Text("Go")
                            .font(.system(size: 100))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        Text("Chat")
                            .font(.system(size: 50))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding(.top, -80)
                    }
                    .padding()
                    .frame(width: 250, height: 250)
                    .background(.blue)
                    .clipShape(Circle())
                }
                Spacer().frame(height: 200)
            }
        }
    }
}

//MARK: - Preview
#Preview {
    GoChatView()
}

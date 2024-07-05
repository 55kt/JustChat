//
//  TagSelectionView.swift
//  JustChat
//
//  Created by Vlad on 3/7/24.
//

import SwiftUI

struct TagSelectionView: View {
    @Binding var selectedTags: [String]
    @State private var tagInput: String = ""
    let allTags = ["swift", "ios", "developer", "chat", "code", "programming", "mobile", "app"]

    var filteredTags: [String] {
        allTags.filter { tag in
            !selectedTags.contains(tag) && tag.lowercased().contains(tagInput.lowercased())
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                TextField("Add Tag", text: $tagInput)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                
                if !filteredTags.isEmpty {
                    GeometryReader { geometry in
                        VStack {
                            List {
                                ForEach(filteredTags, id: \.self) { tag in
                                    Text(tag)
                                        .padding()
                                        .background(Color.gray)
                                        .foregroundColor(.white)
                                        .clipShape(Capsule())
                                        .onTapGesture {
                                            if selectedTags.count < 5 {
                                                selectedTags.append(tag)
                                                tagInput = ""
                                            }
                                        }
                                }
                            }
                            .frame(width: geometry.size.width, height: min(150, CGFloat(filteredTags.count) * 44))
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .shadow(radius: 5)
                        }
                        .offset(y: geometry.size.height + 5)
                    }
                }
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(selectedTags, id: \.self) { tag in
                        HStack {
                            Text(tag)
                            Button(action: {
                                selectedTags.removeAll { $0 == tag }
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14)) // Уменьшаем размер шрифта
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    TagSelectionView(selectedTags: .constant([""]))
}

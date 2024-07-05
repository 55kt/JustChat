//
//  VerificationView.swift
//  JustChat
//
//  Created by Vlad on 5/7/24.
//

import SwiftUI

struct VerificationView: View {
    
    //MARK: - Properties
    @State private var code: [String] = Array(repeating: "", count: 6)
    @Binding var verificationID: String?
    @Binding var showVerificationView: Bool
    
    //MARK: - Body
    var body: some View {
        VStack {
            Text("Verify Phone Number")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            HStack(spacing: 10) {
                ForEach(0..<6) { index in
                        TextField("", text: $code[index])
                        .frame(width: 40, height: 40)
                        .background(Color(.secondarySystemBackground))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .onChange(of: code[index]) { newValue, transaction in
                            if newValue.count > 1 {
                                code[index] = String(newValue.prefix(1))
                            }
                            if newValue.count == 1, index < 5 {
                                withAnimation {
                                    focusNextField(at: index)
                                }
                            }
                        }
                }
            }
            .padding(.bottom, 20)
            
            Button {
                let verificationCode = code.joined()
                guard let verificationID = verificationID else {
                    print("Error verification id is nil")
                    return
                }
                
                AuthService.shared.verifyCode(verificationID: verificationID, verificationCode: verificationCode) { result in
                    switch result {
                    case .success:
                        
                        showVerificationView = false
                    case .failure(let error):
                        print("Error verifying code: \(error.localizedDescription)")
                        
                    }
                }
            } label: {
                Text("Verify")
                    .fontWeight(.bold)
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
        }
    }
    
    private func focusNextField(at index: Int) {
        guard index < code.count - 1 else { return }
        let nextIndex = index + 1
        UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: code[nextIndex], for: nil)
    }
}

//MARK: - Preview
#Preview {
    VerificationView(verificationID: .constant(nil), showVerificationView: .constant(true))
}

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
    @Binding var isLogin: Bool
    @State private var errorMessage: String = ""
    
    @State private var textFieldRefs: [UITextField?] = Array(repeating: nil, count: 6)
    
    //MARK: - Body
    var body: some View {
        VStack {
            Text("Verify Phone Number")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
            }
            
            HStack(spacing: 10) {
                ForEach(0..<6) { index in
                    CodeTextField(text: $code[index], nextResponder: $textFieldRefs[min(index + 1, 5)], currentResponder: $textFieldRefs[index])
                        .frame(width: 40, height: 40)
                        .background(Color(.secondarySystemBackground))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .onChange(of: code[index]) { oldValue, newValue in
                            if newValue.count > 1 {
                                code[index] = String(newValue.prefix(1))
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
                        isLogin = true
                        showVerificationView = false
                    case .failure(let error):
                        errorMessage = "Error verifying code please try again or Request a new code"
                    }
                }
            } label: {
                Text("Verify")
                    .fontWeight(.bold)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            Button {
                // requestNewCode
            } label: {
                Text("Request New Code")
                    .foregroundStyle(.blue)
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                textFieldRefs[0]?.becomeFirstResponder()
            }
        }
    }
}

struct CodeTextField: UIViewRepresentable {
    @Binding var text: String
    @Binding var nextResponder: UITextField?
    @Binding var currentResponder: UITextField?
    
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        @Binding var nextResponder: UITextField?
        @Binding var currentResponder: UITextField?
        
        init(text: Binding<String>, nextResponder: Binding<UITextField?>, currentResponder: Binding<UITextField?>) {
            _text = text
            _nextResponder = nextResponder
            _currentResponder = currentResponder
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if string.count == 1 {
                text = string
                nextResponder?.becomeFirstResponder()
                return false
            } else if string.isEmpty {
                text = ""
                currentResponder?.resignFirstResponder()
                return true
            }
            return false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text, nextResponder: $nextResponder, currentResponder: $currentResponder)
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.backgroundColor = UIColor.secondarySystemBackground
        textField.layer.cornerRadius = 5
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        DispatchQueue.main.async {
            currentResponder = uiView
        }
    }
}

#Preview {
    VerificationView(verificationID: .constant("123456"), showVerificationView: .constant(true), isLogin: .constant(false))
}

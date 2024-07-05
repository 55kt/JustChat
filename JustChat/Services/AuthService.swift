//
//  AuthService.swift
//  JustChat
//
//  Created by Vlad on 5/7/24.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

class AuthService {
    static let shared = AuthService()
    
    //MARK: - Initializer
    private init() {}
    
    // Registration Function
    func registerUser(username: String, password: String, phoneNumber: String, completion: @escaping (Result<(), Error>) -> ()) {
        Auth.auth().createUser(withEmail: username, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let uid = authResult?.user.uid else {
                completion(.failure(NSError(domain: "AuthService", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to get user ID"])))
                return
            }
            
            let userData: [String: Any] = [
                "id": uid,
                "username": username,
                "phonenumber": phoneNumber,
            ]
            
            Firestore.firestore().collection("users").document(uid).setData(userData) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
        }
    }
    
    // Phone Number Verification
    func verifyPhoneNumber(phoneNumber: String, completion: @escaping (Result<String, Error>) -> ()) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
            if let error = error {
                completion(.failure(error))
            } else if let verificationID = verificationID {
                completion(.success(verificationID))
            }
        }
    }
    
    // Verification Code
    func verifyCode(verificationID: String, verificationCode: String, completion: @escaping (Result<AuthDataResult, Error>) -> ()) {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let authResult = authResult {
                completion(.success(authResult))
            }
        }
    }
}

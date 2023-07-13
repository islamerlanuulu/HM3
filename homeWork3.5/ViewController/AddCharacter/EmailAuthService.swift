//
//  EmailAuthService.swift
//  homeWork3.5
//
//  Created by Islam Erlan Uulu on 13/7/23.
//

import Foundation

import FirebaseAuth

class EmailAuthorizationService: BaseAuthorization {
    
    func signIn(email: String,
                password: String,
                completion: @escaping (Result<Void, Error>) -> Void
    ) {
        Auth.auth().signIn(
            withEmail: email,
            password: password
        ) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
            } else {
                completion(.success(()))
                self.saveSession()
            }
        }
    }
    
    func signUp(email: String,
                password: String,
                completion: @escaping (Result<Void, Error>) -> Void
    ) {
        Auth.auth().createUser(
            withEmail: email,
            password: password
        ) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
            } else {
                completion(.success(()))
                self.saveSession()
            }
        }
    }
}

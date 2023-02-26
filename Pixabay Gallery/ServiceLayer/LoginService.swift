//
//  LoginService.swift
//  Pixabay Gallery
//
//  Created by codergirlTM on 26.02.23.
//

import UIKit

protocol LoginServiceProtocol {
    func authenticateUser(withEmail email: String, andPassword password: String, completion: @escaping (Result<User, LoginViewModel.LoginError>) -> Void)
}

class LoginService: LoginServiceProtocol {
    func authenticateUser(withEmail email: String, andPassword password: String, completion: @escaping (Result<User, LoginViewModel.LoginError>) -> Void) {
        let errors = LoginViewModel.LoginError.allCases.filter {
            switch $0 {
            case .emptyEmail: return email.isEmpty
            case .emptyPassword: return password.isEmpty
            case .invalidEmail: return !email.isEmail
            case .invalidPassword: return !password.isValidPassword
            case .invalidUser: return true
            }
        }
        
        if errors.count > 0 {
            completion(.failure(errors.first!))
            return
        }
        
        let registerUser = SignUpViewModel.instance.availableUser
        let availableUser = registerUser.first(where: { $0.email == email && $0.password == password } )
        
        if let user = availableUser {
            completion(.success(user))
        } else {
            completion(.failure(LoginViewModel.LoginError.invalidUser))
        }
    }
}

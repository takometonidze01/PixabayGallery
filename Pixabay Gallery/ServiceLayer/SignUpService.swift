//
//  SignUpService.swift
//  Pixabay Gallery
//
//  Created by codergirlTM on 26.02.23.
//

import UIKit

protocol SignUpServiceProtocol {
    func registerUserWith(email: String, password: String, age: Int) -> Result<User, SignUpError>
}

enum SignUpError: Error {
    case emptyEmail
    case emptyPassword
    case invalidEmail
    case invalidPassword
    case ageLimit
    case other
}

class SignUpService: SignUpServiceProtocol {
    func registerUserWith(email: String, password: String, age: Int) -> Result<User, SignUpError> {
        var errors = [SignUpError]()

        if email.isEmpty {
            errors.append(.emptyEmail)
        }

        if password.isEmpty {
            errors.append(.emptyPassword)
        }

        if !email.isEmail {
            errors.append(.invalidEmail)
        }

        if !password.isValidPassword {
            errors.append(.invalidPassword)
        }

        if age < 18 || age > 99 {
            errors.append(.ageLimit)
        }

        if errors.count > 0 {
            return .failure(.other)
        }

        let user = User(id: UUID().uuidString, email: email, password: password, age: age)
        SignUpViewModel.instance.availableUser.append(user)
        return .success(user)
    }
}

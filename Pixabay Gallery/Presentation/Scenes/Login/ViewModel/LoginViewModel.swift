//
//  LoginViewModel.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 21.08.22.
//

import UIKit

class LoginViewModel {
    enum LoginError {
        case emptyEmail
        case emptyPassword
        case invalidEmail
        case invalidPassword
        case invalidUser
    }
    
    var loginError: ((LoginError) -> Void)?
    
    func auth(withEmail email: String, andPassword password: String) -> ([LoginError], Bool) {
        var errors = [LoginError]()
        let registerUser = SignUpViewModel.instance.availableUser
        let availableUser = registerUser.first(where: { $0.email == email && $0.password == password } )
        
        if email == "" {
            errors.append(.emptyEmail)
        }
        
        if password == "" {
            errors.append(.emptyPassword)
        }
        
        if email.isEmail == false {
            errors.append(.invalidEmail)
        }
        
        if password.isValidPassword == false {
            errors.append(.invalidPassword)
        }

        if errors.count == 0 && (availableUser != nil) {
            return (errors,true)
        }
        
        return (errors,false)
    }
}

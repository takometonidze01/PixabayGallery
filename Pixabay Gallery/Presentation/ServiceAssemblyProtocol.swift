//
//  ServiceAssemblyProtocol.swift
//  Pixabay Gallery
//
//  Created by codergirlTM on 26.02.23.
//

import Foundation

protocol ServiceAssemblyProtocol {
    var loginService: LoginService { get }
    var signUpService: SignUpService { get }
}

class ServiceAssembly: ServiceAssemblyProtocol {
    
    init() {}

    var loginService: LoginService {
        return LoginService()
    }
    
    var signUpService: SignUpService {
        return SignUpService()
    }
}


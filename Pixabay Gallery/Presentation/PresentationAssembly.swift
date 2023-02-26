//
//  PresentationAssembly.swift
//  Pixabay Gallery
//
//  Created by codergirlTM on 26.02.23.
//

import UIKit

protocol PresentationAssemblyProtocol {
    func loginViewScreen() -> LoginViewController
    func signUpScreen() -> SignUpViewController
    func mainScreen() -> MainPageViewController
    func detailsScreen(pixabayImage: PixabayImage) -> DetailsViewController
}

class PresentationAssembly: PresentationAssemblyProtocol {
    
    let serviceAssembly: ServiceAssemblyProtocol
    
    init(serviceAssembly: ServiceAssemblyProtocol) {
        self.serviceAssembly = serviceAssembly
    }
    
    func loginViewScreen() -> LoginViewController {
        let viewModel = LoginViewModel()
        return LoginViewController(presentationAssembly: self,
                            loginService: serviceAssembly.loginService,
                            loginView: LoginView(viewModel: viewModel))
    }
    
    func signUpScreen() -> SignUpViewController {
        let viewModel = SignUpViewModel()
        return SignUpViewController(presentationAssembly: self,
                                    signUpService: serviceAssembly.signUpService,
                                    signUpView: SignUpView(viewModel: viewModel))
    }
    
    func mainScreen() -> MainPageViewController {
        let viewModel = MainPageViewModel(with: PixabayImageManager(with: NetworkManager()))
        return MainPageViewController(viewModel: viewModel,
                                      presentationAssembly: self)
        
    }
    
    func detailsScreen(pixabayImage: PixabayImage) -> DetailsViewController {
        return DetailsViewController(pixabayImage: pixabayImage)
    }

}

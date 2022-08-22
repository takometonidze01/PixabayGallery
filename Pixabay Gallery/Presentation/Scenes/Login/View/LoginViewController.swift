//
//  ViewController.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 17.08.22.
//

import UIKit

class LoginViewController: UIViewController {

    var loginView = LoginView(viewModel: LoginViewModel())

    
    override func loadView() {
        view = loginView
        loginView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    

}

extension LoginViewController: LoginViewDelegate {
    
    func loginTap() {
        let vc = MainPageViewController()
        push(vc)
        
    }
    
    func signUpTap() {
        let vc = SignUpViewController()
        push(vc)
    }
    
    
}

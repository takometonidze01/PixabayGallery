//
//  ViewController.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 17.08.22.
//

import UIKit

class LoginViewController: UIViewController {

    private let presentationAssembly: PresentationAssembly
    private let loginService: LoginService
    private let loginView: LoginView
    
    init(
        presentationAssembly: PresentationAssembly,
        loginService: LoginService,
        loginView: LoginView
    ) {
        self.presentationAssembly = presentationAssembly
        self.loginService = loginService
        self.loginView = loginView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        let vc = presentationAssembly.mainScreen()
        push(vc)
    }
    
    func signUpTap() {
        let vc = presentationAssembly.signUpScreen()
        push(vc)
    }
}

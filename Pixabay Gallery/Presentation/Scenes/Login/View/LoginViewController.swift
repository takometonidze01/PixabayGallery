//
//  ViewController.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 17.08.22.
//

import UIKit
import Combine

class LoginViewController: UIViewController {

    private let presentationAssembly: PresentationAssembly
    private let loginService: LoginService
    private let loginView: LoginView
    private var cancellables = Set<AnyCancellable>()

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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        loginTapped()
        signUpTapped()
    }
    
    private func loginTapped() {
        loginView.loginTapped
               .sink { [weak self] _ in
                   self?.loginTap()
               }
               .store(in: &cancellables)
    }
    
    private func signUpTapped() {
        loginView.signUpTapped
            .sink { [weak self] _ in
                self?.signUpTap()

            }
            .store(in: &cancellables)
    }
    
    func loginTap() {
        let vc = presentationAssembly.mainScreen()
        push(vc)
    }
    
    func signUpTap() {
        let vc = presentationAssembly.signUpScreen()
        push(vc)
    }

}

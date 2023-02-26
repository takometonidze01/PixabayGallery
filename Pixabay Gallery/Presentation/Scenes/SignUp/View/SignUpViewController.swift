//
//  SignUpViewController.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 17.08.22.
//

import UIKit

class SignUpViewController: UIViewController {

//    var signUpView = SignUpView(viewModel: SignUpViewModel.instance)
    private let presentationAssembly: PresentationAssembly
    private let signUpService: SignUpService
    private let signUpView: SignUpView
    
    init(
        presentationAssembly: PresentationAssembly,
        signUpService: SignUpService,
        signUpView: SignUpView
    ) {
        self.presentationAssembly = presentationAssembly
        self.signUpService = signUpService
        self.signUpView = signUpView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        view = signUpView
        signUpView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }
    



}

extension SignUpViewController: SignUpViewDelegate {
    func registerUserDidSuccess(success: Bool) {
        if success == true {
            let vc = presentationAssembly.mainScreen()
            push(vc)
        }
    }
    
    
}

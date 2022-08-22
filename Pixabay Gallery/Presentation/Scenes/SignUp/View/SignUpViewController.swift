//
//  SignUpViewController.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 17.08.22.
//

import UIKit

class SignUpViewController: UIViewController {

    var signUpView = SignUpView(viewModel: SignUpViewModel.instance)
    
    
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
            let vc = MainPageViewController()
            push(vc)
        }
    }
    
    
}

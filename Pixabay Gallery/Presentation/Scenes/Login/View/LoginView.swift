//
//  LoginView.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 18.08.22.
//

import UIKit
import SnapKit
import Combine

class LoginView: UIView {
    
    
    private let loginTitleLabel = UILabel()
    private let emailTextField = CustomTextField()
    private let passwordTextField = CustomTextField()
    private let stackView = UIStackView()
    private let loginButton = UIButton()
    private let signUpButton = UIButton()
    private let errorLabel = UILabel()
    private var viewModel: LoginViewModel
    
    private let loginPublisher = PassthroughSubject<Void, Never>()
    private let signUpPublisher = PassthroughSubject<Void, Never>()
    
    var loginTapped: AnyPublisher<Void, Never>
    var signUpTapped: AnyPublisher<Void, Never>

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        
        loginTapped = loginPublisher.eraseToAnyPublisher()
        signUpTapped = signUpPublisher.eraseToAnyPublisher()
        super.init(frame: .zero)
        
        
        self.setup()
        self.style()
        self.setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.addSubview(self.loginTitleLabel)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.stackView)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(signUpButton)
        self.addSubview(self.errorLabel)
    }
    
    func style() {
        loginTitleLabel.text = "Login"
        loginTitleLabel.textColor = .label
        loginTitleLabel.font = FontHandler.boldTextFont
        
        emailTextField.setPlaceholder(text: "Email")
        passwordTextField.setPlaceholder(text: "Password")
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10.0
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.layer.cornerRadius = 25 * Constraints.yCoeff
        loginButton.layer.cornerCurve = .continuous
        loginButton.layer.masksToBounds = true
        loginButton.titleLabel?.font = FontHandler.regularTextFont
        loginButton.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = .systemBlue
        signUpButton.layer.cornerRadius = 25 * Constraints.yCoeff
        signUpButton.layer.cornerCurve = .continuous
        signUpButton.layer.masksToBounds = true
        signUpButton.titleLabel?.font = FontHandler.regularTextFont
        signUpButton.addTarget(self, action: #selector(signUpButtonTap), for: .touchUpInside)
        
        errorLabel.textColor = .red
        errorLabel.font = FontHandler.errorMessageFont
    }
    
    func setupConstraints() {
        [loginTitleLabel, emailTextField, passwordTextField, loginButton, signUpButton, errorLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        loginTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(200 * Constraints.yCoeff)
            make.centerX.equalTo(self)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTitleLabel.snp.bottom).offset(40 * Constraints.yCoeff)
            make.leading.equalTo(self).offset(24 * Constraints.xCoeff)
            make.trailing.equalTo(self).offset(-24 * Constraints.xCoeff)
            make.height.equalTo(80 * Constraints.yCoeff)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20 * Constraints.yCoeff)
            make.leading.equalTo(self).offset(24 * Constraints.xCoeff)
            make.trailing.equalTo(self).offset(-24 * Constraints.xCoeff)
            make.height.equalTo(80 * Constraints.yCoeff)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20 * Constraints.yCoeff)
            make.leading.equalTo(self).offset(24 * Constraints.xCoeff)
            make.trailing.equalTo(self).offset(-24 * Constraints.xCoeff)
            make.height.equalTo(50 * Constraints.yCoeff)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(40 * Constraints.yCoeff)
            make.leading.equalTo(self).offset(24 * Constraints.xCoeff)
            make.trailing.equalTo(self).offset(-24 * Constraints.xCoeff)
        }
        
    }
    
    @objc func loginButtonTap() {
        let result = viewModel.auth(withEmail: emailTextField.text, andPassword: passwordTextField.text)
        if result.1 == true {
            loginPublisher.send()
        } else {
            for error in result.0 {
                switch error {
                    case .invalidEmail:
                        emailTextField.sawError(error: ErrorMessage.invalidEmail.rawValue)
                    case .invalidPassword:
                        passwordTextField.sawError(error: ErrorMessage.invalidPassword.rawValue)
                    case .emptyEmail:
                        emailTextField.sawError(error: ErrorMessage.emptyEmailField.rawValue)
                    case .emptyPassword:
                        passwordTextField.sawError(error: ErrorMessage.emptyPasswordField.rawValue)
                    case .invalidUser:
                        errorLabel.text = ErrorMessage.invalidUser.rawValue
                }
            }
        }
    }
    
    @objc func signUpButtonTap() {
        signUpPublisher.send()
    }
}

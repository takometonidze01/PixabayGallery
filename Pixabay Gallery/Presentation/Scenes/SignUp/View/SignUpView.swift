//
//  SignUpView.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 18.08.22.
//

import UIKit
import SnapKit

protocol SignUpViewDelegate: AnyObject {
    func registerUserDidSuccess(success: Bool)
}

class SignUpView: UIView {
    
    
    private let loginTitleLabel = UILabel()
    private let emailTextField = CustomTextField()
    private let passwordTextField = CustomTextField()
    private let datePicker: UIDatePicker = UIDatePicker()
    private let signUpButton = UIButton()
    private let errorLabel = UILabel()
    private var viewModel: SignUpViewModel
    
    weak var delegate: SignUpViewDelegate?
    
    init(viewModel: SignUpViewModel) {
        
        self.viewModel = viewModel
        
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
        self.addSubview(self.datePicker)
        self.addSubview(self.signUpButton)
        self.addSubview(self.errorLabel)
    }
    
    func style() {
        loginTitleLabel.text = "Sign Up"
        loginTitleLabel.textColor = .label
        loginTitleLabel.font = FontHandler.boldTextFont

        emailTextField.setPlaceholder(text: "Email")
        passwordTextField.setPlaceholder(text: "Password")
        
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = .white
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = .systemBlue
        signUpButton.layer.cornerRadius = 25 * Constraints.yCoeff
        signUpButton.layer.cornerCurve = .continuous
        signUpButton.layer.masksToBounds = true
        signUpButton.addTarget(self, action: #selector(signUpButtonTap), for: .touchUpInside)
        
        errorLabel.textColor = .red
        errorLabel.font = FontHandler.errorMessageFont
    }
    
    func setupConstraints() {
        [loginTitleLabel, emailTextField, passwordTextField, signUpButton, errorLabel].forEach {
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
        
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20 * Constraints.yCoeff)
            make.leading.equalTo(self).offset(24 * Constraints.xCoeff)
            make.trailing.equalTo(self).offset(-24 * Constraints.xCoeff)
            make.height.equalTo(150 * Constraints.yCoeff)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(7 * Constraints.yCoeff)
            make.leading.equalTo(self).offset(30 * Constraints.xCoeff)
            make.trailing.equalTo(self).offset(-30 * Constraints.xCoeff)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(errorLabel.snp.bottom).offset(20 * Constraints.yCoeff)
            make.leading.equalTo(self).offset(24 * Constraints.xCoeff)
            make.trailing.equalTo(self).offset(-24 * Constraints.xCoeff)
            make.height.equalTo(50 * Constraints.yCoeff)
        }
        

    }
    
    @objc func signUpButtonTap() {
        let userAge = viewModel.handleDatePicker(sender: datePicker)
        let result = viewModel.registerUserWith(email: emailTextField.text, password: passwordTextField.text, age: userAge)
        if result.count == 0 {
            delegate?.registerUserDidSuccess(success: true)
        } else {
            delegate?.registerUserDidSuccess(success: false)
            for error in result {
                switch error {
                    case .invalidEmail:
                        emailTextField.sawError(error: ErrorMessage.invalidEmail.rawValue)
                    case .invalidPassword:
                        passwordTextField.sawError(error: ErrorMessage.invalidPassword.rawValue)
                    case .emptyEmail:
                        emailTextField.sawError(error: ErrorMessage.emptyEmailField.rawValue)
                    case .emptyPassword:
                        passwordTextField.sawError(error: ErrorMessage.emptyPasswordField.rawValue)
                    case .ageLimit:
                        errorLabel.text = ErrorMessage.ageLimit.rawValue
                    case .other:
                        errorLabel.text = ErrorMessage.other.rawValue
                }
            }
        }
    }
    
}


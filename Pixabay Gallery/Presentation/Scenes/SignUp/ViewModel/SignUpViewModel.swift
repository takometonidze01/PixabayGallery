//
//  SignUpViewModel.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 20.08.22.
//

import UIKit

class SignUpViewModel {
    
    private var userAge = 0
    public var availableUser = [User]()
    static let instance = SignUpViewModel()

    private var registerError: ((SignUpError) -> Void)?
    
    
    func registerUserWith(email: String, password: String, age: Int) -> [SignUpError] {
        var errors = [SignUpError]()
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
        
        if userAge < 18 || userAge > 99 {
            errors.append(.ageLimit)
        }
        
        if errors.count == 0 {
            let user = User(id: UUID().uuidString, email: email, password: password, age: age)
            SignUpViewModel.instance.availableUser.append(user)
        }
        
        return errors

    }
    
    func handleDatePicker(sender: UIDatePicker) -> Int {
        let dateOfBirth = sender.date
        let today = NSDate()
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let age = gregorian.components([.year], from: dateOfBirth, to: today as Date, options: [])
        userAge = age.year ?? 0
        return userAge
    }
}

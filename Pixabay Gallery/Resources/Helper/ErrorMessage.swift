//
//  ErrorMessage.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 21.08.22.
//

import UIKit

public enum ErrorMessage: String, CaseIterable{
    case emptyEmailField = "*Enter email address"
    case emptyPasswordField = "*Enter password"
    case invalidEmail = "*Enter a valid email address"
    case invalidPassword = "*Enter a valid password"
    case ageLimit = "*You must be at least 18 years old"
    case invalidUser = "*Invalid account"
}

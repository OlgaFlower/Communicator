//
//  ErrorMessages.swift
//  Communicator
//
//  Created by Olha Bereziuk on 23.01.24.
//

import Foundation

enum ErrorMessages {
    case loginFailed
    case emailFailedValidation
    case passwordFailedValidation
    case usernameNotValid
    case fullnameNotValid
    
    var text: String {
        switch self {
        case .loginFailed:
            return "Incorrect email or password. Please try again."
        case .emailFailedValidation:
            return "Please enter a valid email address."
        case .passwordFailedValidation:
            return "Password must be at least 8 characters long and contain a mix of letters and numbers."
        case .usernameNotValid:
            return "Username must have more than 3 letters."
        case .fullnameNotValid:
            return "Full name must have more than 1 letter."
        }
    }
}

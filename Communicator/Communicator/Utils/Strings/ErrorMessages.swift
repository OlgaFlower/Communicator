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
            return "Username must be min 5 and max 12 characters, contain numbers, lowercased letters and _."
        case .fullnameNotValid:
            return "Full name must have more min 5 and max 18 characters, contain letters and numbers."
        }
    }
}

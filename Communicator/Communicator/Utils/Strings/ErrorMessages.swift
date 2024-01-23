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
    
    var text: String {
        switch self {
        case .loginFailed:
            return "Incorrect email or password. Please try again."
        case .emailFailedValidation:
            return "Please enter a valid email address."
        case .passwordFailedValidation:
            return "Password is not valid."
        }
    }
}

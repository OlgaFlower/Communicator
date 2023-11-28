//
//  UIApplication+Extension.swift
//  Communicator
//
//  Created by Olha Bereziuk on 17.11.23.
//

import UIKit

extension UIApplication {
    
    // hide keyboard
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

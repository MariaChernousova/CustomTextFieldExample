//
//  TextFieldType.swift
//  CustomTextFieldExample
//
//  Created by Chernousova Maria on 25/09/2023.
//

import SwiftUI

enum TextFieldType {
    case email
    case password
    
    var placeholder: String {
        switch self {
        case .email:
            return "Your email"
        case .password:
            return "Password"
        }
    }
    
    var leadingImage: Image {
        switch self {
        case .email:
            return Image(systemName: "envelope")
        case .password:
            return Image(systemName: "lock")
        }
    }
}

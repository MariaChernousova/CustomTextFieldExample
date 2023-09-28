//
//  TextFieldState.swift
//  CustomTextFieldExample
//
//  Created by Chernousova Maria on 25/09/2023.
//

import SwiftUI

enum TextFieldState {
    case error
    case validated
    case regular
    
    var borderColor: Color {
        switch self {
        case .error:
            return .wrongBorder
        case .regular:
            return .defaultBorder
        case .validated:
            return .defaultBorder
        }
    }
    
    var trailingImage: Image? {
        switch self {
        case .error:
            return nil
        case .regular:
            return nil
        case .validated:
            return .checkMark
        }
    }
}

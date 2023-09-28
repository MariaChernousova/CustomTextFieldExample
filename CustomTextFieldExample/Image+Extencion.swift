//
//  Image+Extencion.swift
//  CustomTextFieldExample
//
//  Created by Chernousova Maria on 27/09/2023.
//

import SwiftUI

extension Image {
    static let email = Image(systemName: "envelope")
    static let password = Image(systemName: "lock")
    static let checkMark = Image(systemName: "checkmark")
    static let eye = Image(systemName: "eye")
    static let eyeSlash = Image(systemName: "eye.slash")
    static let back = Image(systemName: "chevron.left")
}

extension Image {
    func setImageConfiguration(color: Color) -> some View  {
        self.resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
            .foregroundColor(color)
            .padding(.leading, 16)
            .padding(.trailing, 16)
    }
}

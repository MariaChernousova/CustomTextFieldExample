//
//  TextField+Extencions.swift
//  CustomTextFieldExample
//
//  Created by Chernousova Maria on 26/09/2023.
//

import SwiftUI

extension View {
    
    func setLeadindImage(image: Image, imageColor: Color) -> some View {
        modifier(LeadingImageModifier(image: image, imageColor: imageColor))
    }

    func setTrailingImage(image: Image?, imageColor: Color) -> some View {
        modifier(TrailingImageModifier(image: image, imageColor: imageColor))
    }
    
    func setBorderColor(color: Color, cornerRadius: CGFloat, lineWidth: CGFloat) -> some View {
        modifier(BorderColorModifier(color: color, cornerRadius: cornerRadius, lineWidth: lineWidth))
    }
    
    func setShadowColor(color: Color, cornerRadius: CGFloat, lineWidth: CGFloat) -> some View {
        modifier(ShadowColorModifier(color: color, cornerRadius: cornerRadius, lineWidth: lineWidth))
    }
}

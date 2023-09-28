//
//  Modifiers.swift
//  CustomTextFieldExample
//
//  Created by Chernousova Maria on 26/09/2023.
//

import SwiftUI

struct LeadingImageModifier: ViewModifier {
    
    var image: Image
    var imageColor: Color
    
    func body(content: Content) -> some View {
        HStack {
            image
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
            .foregroundColor(imageColor)
            .padding(.trailing, 8)
            content
        }
        .padding(.leading, 16)
        .padding(.top, 16)
        .padding(.bottom, 16)
    }
}

struct TrailingImageModifier: ViewModifier {
    
    var image: Image?
    var imageColor: Color
    
    func body(content: Content) -> some View {
        HStack {
            content
            if let image {
                image
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(imageColor)
                .padding(.leading, 16)
            }
        }
        .padding(.trailing, 16)
    }
}

struct BorderColorModifier: ViewModifier {
    
    var color: Color
    var cornerRadius: CGFloat
    var lineWidth: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(color, style: StrokeStyle(lineWidth: lineWidth)))
    }
}

struct ShadowColorModifier: ViewModifier {
    
    var color: Color
    var cornerRadius: CGFloat
    var lineWidth: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                .inset(by: -3)
                .strokeBorder(color, style: StrokeStyle(lineWidth: lineWidth)))
    }
}

struct SecureToggleStyle: ToggleStyle {
    var isOn: Image
    var isOff: Image
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                (configuration.isOn ? isOn : isOff)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.gray)
                    .padding(.leading, 16)
                    .padding(.trailing, 8)
            }
        }
    }
}

struct PrimaryButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
          .frame(maxWidth: .infinity)
      .font(.title2)
      .padding(.horizontal)
      .padding(.vertical, 16)
      .foregroundColor(.white)
      .background(Color.selectedBorder)
      .clipShape(RoundedRectangle(cornerRadius: 8))
  }
}

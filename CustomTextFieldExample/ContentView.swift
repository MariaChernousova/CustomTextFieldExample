//
//  ContentView.swift
//  CustomTextFieldExample
//
//  Created by Chernousova Maria on 25/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack (alignment: .center, spacing: 16) {
            EmailTextField(text: $email) { text in
                let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                return text.range( of: emailPattern, options: .regularExpression) != nil
            }
            PasswordTextField(text: $password) { text in
                text == "123456"
            }
            Spacer()
            Button("Log in") {
                
            }.buttonStyle(PrimaryButtonStyle())
            
        }
        .padding(.leading, 18)
        .padding(.trailing, 18)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct EmailTextField: View {
        
    @Binding var text: String
    @State private var state: TextFieldState = .regular
    @FocusState private var isFocused: Bool
    
    var validator: (String) -> Bool
    
    var body: some View {
        TextField("Your email", text: $text)
            .focused($isFocused)
            .onChange(of: text, perform: { _ in
                let newState: TextFieldState = validator(text) ? .validated : .error
                state = newState
            })
            .setLeadindImage(image: .email, imageColor: .defaultBorder)
            .setTrailingImage(image: isFocused ? nil : state.trailingImage, imageColor: .checkmarkColor)
            .setShadowColor(color: isFocused ? .selectedShadow : Color.clear, cornerRadius: 8.0, lineWidth: 3.0)
            .setBorderColor(color: isFocused ? .selectedBorder : state.borderColor, cornerRadius: 8.0, lineWidth: 2.0)
    }
}

struct PasswordTextField: View {
        
    @Binding var text: String
    @State private var state: TextFieldState = .regular
    @State private var isSecured: Bool = true
    @FocusState private var isFocused: Bool
    
    var validator: (String) -> Bool
    
    var body: some View {
        HStack {
            textField
                .focused($isFocused)
                .onChange(of: text, perform: { _ in
                    let newState: TextFieldState = validator(text) ? .validated : .error
                    state = newState
                })
            if state == .validated {
                Image.checkMark
                    .setImageConfiguration(color: .checkmarkColor)
            } else {
                Toggle("", isOn: $isSecured)
                        .toggleStyle(SecureToggleStyle(isOn: .eyeSlash, isOff: .eye))
            }
        }
        .setLeadindImage(image: .password, imageColor: .defaultBorder)
        .setShadowColor(color: isFocused ? .selectedShadow : Color.clear, cornerRadius: 8.0, lineWidth: 3.0)
        .setBorderColor(color: isFocused ? .selectedBorder : state.borderColor, cornerRadius: 8.0, lineWidth: 2.0)
    }
    
    @ViewBuilder
    private var textField: some View {
        if isSecured {
            SecureField("Password", text: $text)
        } else {
            TextField("Password", text: $text)
        }
    }
}

//
//  CustomForm.swift
//  CamPsaa2k25
//
//  Created by Eang Kimlong on 8/30/25.
//
import SwiftUI
import Foundation

enum TextFieldValidationType {
    case email
    case name
    case password
    case none
    
    var regex: String {
        switch self {
        case .email:
            return "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        case .name:
            return "^[A-Za-z\\s]{2,50}$" // 2-50 characters, letters and spaces only
        case .password:
            return "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
        case .none:
            return ""
        }
    }
    
    var errorMessage: String {
        switch self {
        case .email:
            return "Please enter a valid email address"
        case .name:
            return "Name must be 2-50 characters, letters only"
        case .password:
            return "Password must be 8+ chars with uppercase, lowercase, number, and special character"
        case .none:
            return ""
        }
    }
}


func customTextField(
    textLabel: String = "",
    iconUrl: String,
    placeholder: String,
    text: Binding<String>,
    validationType: TextFieldValidationType = .none,
    errorMessage: Binding<String> = .constant(""),
    isValid: Binding<Bool> = .constant(true)) -> some View {
    VStack(alignment: .leading, spacing: 10) {
        Text(textLabel)
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(.black)
        HStack(spacing: 20) {
            Image(systemName: iconUrl)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.gray)
            TextField(placeholder, text: text)
                .padding(.vertical, 5)
                .keyboardType(getKeyboardType(for: validationType))
                .textInputAutocapitalization(getCapitalization(for: validationType))
                .submitLabel(.next)
                .onChange(of: text.wrappedValue) { newValue in
                    validateText(newValue, type: validationType, errorMessage: errorMessage, isValid: isValid)
                }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(30)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
            .stroke(getBorderColor(isEmpty: text.wrappedValue.isEmpty, isValid: isValid.wrappedValue, validationType: .password), lineWidth: 1)
        )
        
        if !errorMessage.wrappedValue.isEmpty && validationType != .none {
                    Text(errorMessage.wrappedValue)
                        .font(.caption)
                        .foregroundColor(.red)
                        .padding(.horizontal, 20)
        }
    }
    //.ignoresSafeArea(.keyboard, edges: .bottom)
    .frame(maxWidth: .infinity, alignment: .leading)
}

//
func customSecureTextField(
    textLabel: String = "",
    iconUrl: String,
    placeholder: String,
    text: Binding<String>,
    isShowPw: Binding<Bool>,
    errorMessage: Binding<String> = .constant(""),
    isValid: Binding<Bool> = .constant(true)
) -> some View {
    VStack(alignment: .leading, spacing: 10) {
        Text(textLabel)
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(.black)
        
        HStack(spacing: 20) {
            Image(systemName: iconUrl)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.gray)
            if isShowPw.wrappedValue {
                TextField(placeholder, text: text)
                    .padding(.vertical, 5)
                    .textInputAutocapitalization(.never)
                    .submitLabel(.done)
                    .onChange(of: text.wrappedValue) { newValue in
                        validatePassword(newValue, errorMessage: errorMessage, isValid: isValid)
                    }
            } else {
                SecureField(placeholder, text: text)
                    .padding(.vertical, 5)
                    .keyboardType(.default)
                    .textInputAutocapitalization(.never)
                    .submitLabel(.done)
                    .onChange(of: text.wrappedValue) { newValue in
                        validatePassword(newValue, errorMessage: errorMessage, isValid: isValid)
                    }
            }
            if !text.wrappedValue.isEmpty {
                Image(systemName: isValid.wrappedValue ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(isValid.wrappedValue ? .green : .red)
                    .frame(width: 20, height: 20)
            }
            
            Button(action: {
                isShowPw.wrappedValue.toggle()
            }) {
                Image(systemName: isShowPw.wrappedValue ? "eye.slash" : "eye")
                    .resizable()
                    .frame(width: 30, height: 20)
                    .foregroundStyle(.gray)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(30)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(getBorderColor(isEmpty: text.wrappedValue.isEmpty, isValid: isValid.wrappedValue, validationType: .password), lineWidth: 1)
        )
        // Error message
        if !errorMessage.wrappedValue.isEmpty {
            Text(errorMessage.wrappedValue)
                .font(.caption)
                .foregroundColor(.red)
                .padding(.horizontal, 20)
        }
    }
    //.ignoresSafeArea(.keyboard, edges: .bottom)
    .frame(maxWidth: .infinity, alignment: .leading)
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


private func validateText(_ text: String, type: TextFieldValidationType, errorMessage: Binding<String>, isValid: Binding<Bool>) {
    guard type != .none && !text.isEmpty else {
        errorMessage.wrappedValue = ""
        isValid.wrappedValue = true
        return
    }
    
    let isTextValid = text.range(of: type.regex, options: .regularExpression) != nil
    isValid.wrappedValue = isTextValid
    errorMessage.wrappedValue = isTextValid ? "" : type.errorMessage
}

private func validatePassword(_ password: String, errorMessage: Binding<String>, isValid: Binding<Bool>) {
    guard !password.isEmpty else {
        errorMessage.wrappedValue = ""
        isValid.wrappedValue = true
        return
    }
    
    let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
    let isPasswordValid = password.range(of: passwordRegex, options: .regularExpression) != nil
    
    isValid.wrappedValue = isPasswordValid
    errorMessage.wrappedValue = isPasswordValid ? "" : "Password must be 8+ chars with uppercase, lowercase, number, and special character"
}

private func getKeyboardType(for type: TextFieldValidationType) -> UIKeyboardType {
    switch type {
    case .email:
        return .emailAddress
    case .name, .password, .none:
        return .default
    }
}

private func getCapitalization(for type: TextFieldValidationType) -> TextInputAutocapitalization {
    switch type {
    case .name:
        return .words
    case .email, .password, .none:
        return .never
    }
}

private func getBorderColor(isEmpty: Bool, isValid: Bool, validationType: TextFieldValidationType) -> Color {
    if isEmpty || validationType == .none {
        return .clear
    }
    return isValid ? .green : .red
}


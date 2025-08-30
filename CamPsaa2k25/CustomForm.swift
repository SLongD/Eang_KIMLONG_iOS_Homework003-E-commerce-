//
//  CustomForm.swift
//  CamPsaa2k25
//
//  Created by Eang Kimlong on 8/30/25.
//
import SwiftUI
import Foundation


func customTextField(
    textLabel: String = "",
    iconUrl: String,
    placeholder: String,
    text: Binding<String>) -> some View {
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
                .keyboardType((textLabel == "Email") ? .emailAddress : .default)
                .textInputAutocapitalization(.never)
                .submitLabel(.next)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(30)
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
    isShowPw: Binding<Bool>
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
            } else {
                SecureField(placeholder, text: text)
                    .padding(.vertical, 5)
                    .keyboardType(.default)
                    .textInputAutocapitalization(.never)
                    .submitLabel(.done)
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
    }
    //.ignoresSafeArea(.keyboard, edges: .bottom)
    .frame(maxWidth: .infinity, alignment: .leading)
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


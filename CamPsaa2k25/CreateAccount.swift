//
//  CreateAccount.swift
//  CamPsaa2k25
//
//  Created by Eang Kimlong on 8/21/25
//

import SwiftUI

struct CreateAccount: View {
    @State private var userName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @Binding var isLoggedIn: Bool
    @Binding var currentTabIndex: Int
    @State private var nameError = ""
    @State private var emailError = ""
    @State private var passwordError = ""
    @State private var isNameValid = true
    @State private var isEmailValid = true
    @State private var isPasswordValid = true
    var body: some View {
        VStack(spacing:30){
            VStack(alignment: .leading){
                Text("Create Account")
                    .font(Font.system(size: 30, weight: .bold))
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                Text("Start learning with create your account")
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .edgesIgnoringSafeArea(.horizontal)
            
            customTextField(
                textLabel: "User Name",
                iconUrl: "person",
                placeholder: "Create your user name",
                text: $userName,
                validationType: .name,
                errorMessage: $nameError,
                isValid: $isNameValid)
            customTextField(
                textLabel: "Email",
                iconUrl: "envelope",
                placeholder: "Enter email or phone number",
                text: $email,
                validationType: .email,
                errorMessage: $emailError,
                isValid: $isEmailValid)
            customSecureTextField(
                textLabel: "Password",
                iconUrl: "exclamationmark.lock",
                placeholder: "Create your password",
                text: $password,
                isShowPw: $showPassword,
                errorMessage: $passwordError,
                isValid: $isPasswordValid
            )
            VStack{
                customButton(
                    btnLabel: "Create Account",
                    bgColor: (!isFormValid ? .blue.opacity(0.5) : .blue)
                    ){
                        //if(){}
                        if isFormValid {
                            isLoggedIn.toggle()
                            currentTabIndex = 0
                        }
//                        isLoggedIn.toggle()
//                        currentTabIndex = 0
                    }
                    .disabled(!isFormValid)
                customButton(
                    btnLabel: "Or using other method",
                    bgColor: .white,
                    textColor: .gray){
                }
                customIconButton(
                    iconUrl: "Image 8",
                    btnLabel: "SignUp with Google",
                    bgColor: .white){
                }
                customIconButton(
                    iconUrl: "Image 7",
                    btnLabel: "SignUp with Facebook",
                    bgColor: .white){
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .padding(.top, -90)
        .padding(.horizontal, 20)
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        
    }
    private var isFormValid: Bool {
        return !userName.isEmpty && isNameValid &&
               !email.isEmpty && isEmailValid &&
               !password.isEmpty && isPasswordValid
    }
    
}

#Preview {
//    @State var islog: Bool = false
//    @State var index: Int = 0
//    CreateAccount(isLoggedIn: $islog, currentTabIndex: $index)
}

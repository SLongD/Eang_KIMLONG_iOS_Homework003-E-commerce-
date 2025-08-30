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
                text: $userName)
            customTextField(
                textLabel: "Email",
                iconUrl: "envelope",
                placeholder: "Enter email or phone number",
                text: $email)
            customSecureTextField(
                textLabel: "Password",
                iconUrl: "exclamationmark.lock",
                placeholder: "Create your password",
                text: $password,
                isShowPw: $showPassword
            )
            VStack{
                customButton(
                    btnLabel: "Create Account",
                    bgColor: .blue){
                        isLoggedIn.toggle()
                        currentTabIndex = 0
                }
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
//    private func hideKeyboard() {
//            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
}

#Preview {
    //CreateAccount()
}

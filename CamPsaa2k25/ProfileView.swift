//
//  Profile.swift
//  CamPsaa2k25
//
//  Created by Eang Kimlong on 8/22/25.
//
import SwiftUI

struct ProfileView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    var body: some View {
        VStack(spacing: 30){
            Image("Image 3")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [.purple, .pink, .orange]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 3.5
                    )
                }
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)

            customTextField(
                textLabel:"Username",
                iconUrl: "person",
                placeholder: "Kimlong",
                text: $username)
            
            customTextField(
                textLabel:"Email or Phone Number",
                iconUrl: "envelope",
                placeholder: "iosdev@example.com",
                text: $email)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Account Linked with")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.black)
                VStack{
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
            
        }
        .padding(20)
    }
}

#Preview {
    //ProfileView()
}

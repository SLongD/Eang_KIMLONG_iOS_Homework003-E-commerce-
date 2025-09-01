//
//  CustomBotton.swift
//  CamPsaa2k25
//
//  Created by Eang Kimlong on 8/30/25.
//
import SwiftUI
import Foundation

func customButton(
    btnLabel: String,
    bgColor: Color,
    textColor: Color = .white,
    action: @escaping () -> Void
) -> some View {
    Button(action: action) {
        Text(btnLabel)
            .font(.headline)
            .foregroundColor(textColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(bgColor)
            
            .cornerRadius(30)
    }
}

func customBidingButton(
    btnLabel: String,
    btnIsActive: Binding<Bool>,
    action: @escaping () -> Void
) -> some View {
    Button(action: action) {
        Text(btnLabel)
            .font(.headline)
            .foregroundColor(btnIsActive.wrappedValue ? Color.white : Color.gray)
            .padding(.horizontal,30)
            .padding(.vertical,5)
            .background((btnIsActive.wrappedValue ? Color.blue :Color.white))
            .cornerRadius(10)
    }
    .overlay(
        RoundedRectangle(cornerRadius: 10)
            //.fill(Color.blue)
            .stroke(btnIsActive.wrappedValue ? Color.blue :Color.gray, lineWidth: 1)
    )
}



//
func customIconButton(
    iconUrl: String ,
    btnLabel: String = "",
    bgColor: Color = .white,
    textColor: Color = .white,
    action: @escaping () -> Void
) -> some View {
    Button(
        action: action) {
        HStack(){
            Image(iconUrl)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            Text(btnLabel)
                .foregroundStyle(.black)
        }
        .padding(10)
        .cornerRadius(30)
    }
    .frame(maxWidth: .infinity)
    .overlay(
        RoundedRectangle(cornerRadius: 30)
            .stroke(Color.gray, lineWidth: 1)
    )
}

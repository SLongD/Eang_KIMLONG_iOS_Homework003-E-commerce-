//
//  CustomNavigation.swift
//  CamPsaa2k25
//
//  Created by Eang Kimlong on 8/30/25.
//
import SwiftUI
import Foundation

func customListNavigator(sections: [(items: [SettingItem], title: String, color: Color?)], isLoggedIn: Binding<Bool>, isSetting: Binding<Bool>, isHaveAccount: Binding<Bool>) -> some View {
    NavigationStack {
        List {
            ForEach(Array(sections.enumerated()), id: \.offset) { index, section in
                Section(header: Text(section.title)) {
                    ForEach(section.items) { item in
                        if(item.description == "LogOut"){
                            Button(action: {
                                isLoggedIn.wrappedValue = false
                                isHaveAccount.wrappedValue = false
                                isSetting.wrappedValue = false
                            }){
                                HStack {
                                    Image(systemName: item.icon)
                                        .foregroundColor(section.color ?? .primary)
                                    Text(item.description)
                                        .foregroundColor(section.color ?? .primary)
                                }
                            }
                        } else {
                            NavigationLink(destination: Text("Detail")) {
                                HStack {
                                    Image(systemName: item.icon)
                                        .foregroundColor(section.color ?? .primary)
                                    Text(item.description)
                                        .foregroundColor(section.color ?? .primary)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

func homePageToolBar() -> some View {
    HStack{
        HStack {
            Image("Image 18")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            VStack(alignment: .leading){
                Text("Hi, Kimlong ")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                Text("Have a great day!")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        
        Spacer() // This will push the right icons to the end
        
        HStack(spacing: 20){
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 20, height: 20)
            Image(systemName: "bell")
                .resizable()
                .frame(width: 20, height: 20)
        }
    }
    .padding(.horizontal)
    .padding(.vertical, 8)
}

func cusmtomToolBarItem(title: String, iconImage: String = "") -> some View {
    VStack {
        HStack {
            Text(title)
                .foregroundStyle(.black)
                .font(Font.system(size: 20, weight: .bold))
                .bold()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 35)
        .padding(.top, -5)
        .overlay(alignment: .trailing) {
            Image(systemName: iconImage)
                .padding(.trailing, 16)
        }
    }
}

@ViewBuilder
func switchToolBarItem(currentValue: Binding<Int>, isSetting: Binding<Bool>) -> some View {
    switch currentValue.wrappedValue {
    case 0:
        homePageToolBar()
    case 1:
        cusmtomToolBarItem(title: "My Orders", iconImage: "handbag")
    case 2:
        cusmtomToolBarItem(title: "Favorite")
    case 3:
        if(isSetting.wrappedValue){
            VStack {
                HStack {
                    Text("Setting")
                        .foregroundStyle(.black)
                        .font(Font.system(size: 20, weight: .bold))
                        .bold()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 35)
                .padding(.top, -5)
                .overlay(alignment: .leading) {
                    Button(action: {
                        isSetting.wrappedValue = false // Changed from true to false
                    }){
                        Image(systemName: "chevron.backward")
                            .padding(.leading, 16)
                    }
                }
                Divider()
            }
        } else {
            VStack {
                HStack {
                    Text("My Profile")
                        .foregroundStyle(.black)
                        .font(Font.system(size: 20, weight: .bold))
                        .bold()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 35)
                .padding(.top, -5)
                .overlay(alignment: .trailing) {
                    Button(action: {
                        isSetting.wrappedValue = true
                        // Remove this line since you're not using case 4 approach
                        // currentValue.wrappedValue = 4
                    }){
                        Image(systemName: "gearshape")
                            .padding(.trailing, 16)
                    }
                }
                Divider()
            }
        }
    default:
        homePageToolBar()
    }
}

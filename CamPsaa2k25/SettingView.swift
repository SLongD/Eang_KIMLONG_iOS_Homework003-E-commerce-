//
//  Setting.swift
//  CamPsaa2k25
//
//  Created by Eang Kimlong on 8/22/25.
//

import SwiftUI

let settingLabel = [
    SettingItem(icon: "person", description: "Edit profile"),
    SettingItem(icon: "exclamationmark.triangle", description: "Change password"),
    SettingItem(icon: "bell", description: "Notification"),
    SettingItem(icon: "key.viewfinder", description: "Security")
]
let settingLabel1 = [
    SettingItem(icon: "cloud", description: "iCloud"),
    SettingItem(icon: "lock", description: "Password and Security"),
]
let settingLabel2 = [
    SettingItem(icon: "exclamationmark.transmission", description: "General"),
    SettingItem(icon: "arrow.up.forward.app", description: "Software Update"),
]
let settingLabel3 = [
    SettingItem(icon: "rectangle.portrait.and.arrow.right", description: "LogOut")
]

struct SettingView: View {
    @Binding var isSetting: Bool
    @Binding var isLoggedIn: Bool
    @Binding var isHaveAccount: Bool
    var body: some View {
        let sections = [
            (items: settingLabel, title: "General", color: nil),
            (items: settingLabel1, title: "Accounts", color: nil),
            (items: settingLabel2, title: "About", color: nil),
            (items: settingLabel3, title: "", color: Color.red)
        ]
        customListNavigator(sections: sections, isLoggedIn: $isLoggedIn, isSetting: $isSetting, isHaveAccount: $isHaveAccount)
    }
}
//#Preview {
//    Setting()
//}

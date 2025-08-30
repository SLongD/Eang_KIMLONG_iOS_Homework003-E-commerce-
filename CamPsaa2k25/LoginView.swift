//
//  LoginView.swift
//  CamPsaa2k25
//
//  Created by Eang Kimlong on 8/21/25.
//
import SwiftUI

struct LoginView : View {
    @Binding var isHaveAccount : Bool
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var selectedTab = 0
    @State private var currentTabIndex = 0
    let imageUrl  =  [
        BackGroundImage(imageUrl: "loginBackground",caption: "Various Collections of The Latest Products",des: "Uma amet, supspendisse sed ulliamcorper ac edit daim facillisis custodiet. Euismo"
        ),
        BackGroundImage(imageUrl: "loginBackground",caption: "Various Collections of The Latest Products",des: "Uma amet, supspendisse sed ulliamcorper ac edit" ),
    ];
    var body: some View {
        VStack {
            
            customPageView(imageUrls: imageUrl, selectedTab: $selectedTab)
            
            VStack{
                customButton(btnLabel :"Create Account", bgColor : .blue){
                    isHaveAccount.toggle()
                }
                customButton(btnLabel :"Already have an account? Login", bgColor : .white, textColor: .blue){
                    
                }
            }
        }
        .padding(.top, -140)
    }
}



#Preview {
    //LoginView()
}

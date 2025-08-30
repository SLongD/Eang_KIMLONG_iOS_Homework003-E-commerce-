import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn: Bool = false
    @State private var currentTabIndex = 0
    @State private var selectedTab = 0
    @State private var isSetting: Bool = false
    @State private var isHaveAccound: Bool = false
    let homeSubTabs = ["Home", "Category"]
    let orderSubTabs = ["My Orders", "History"]
    var body: some View {
        if(isHaveAccound){
            if isLoggedIn {
                VStack(spacing: 0) {
                    // Custom Header
                    switchToolBarItem(currentValue: $currentTabIndex, isSetting: $isSetting)
                        
                    // Tab View
                    TabView(selection: $currentTabIndex){
                        VStack{
                            customHeaderTabViewStyle(
                                tabs: homeSubTabs,
                                selectedTab: $selectedTab,
                                viewOfTabContent: [
                                    { AnyView(HomeView()) },
                                    { AnyView(
                                        Category()
                                    ) }
                                ]
                            )
                        }
                        .tabItem{
                            Image(systemName: "house")
                            Text("Home")
                        }
                        .tag(0)
                        VStack{
                            customHeaderTabViewStyle(
                                tabs: orderSubTabs,
                                selectedTab: $selectedTab,
                                viewOfTabContent: [
                                    { AnyView(
                                        OrderTabView(isHistory: false)
                                    )},
                                    { AnyView(
                                        OrderTabView(isHistory: true)
                                    )}
                                ]
                            )
                        }
                        .padding(-10)
                            .tabItem{
                                Image(systemName: "truck.box")
                                Text("My Order")
                            }
                            .tag(1)
                        
                        VStack{
                            FavoriteTabView()
                        }.padding(10)
                            .tabItem{
                                Image(systemName: "heart")
                                Text("Favorite")
                            }
                            .tag(2)
                        
                        
                        //Profile()
                        VStack{
                            if(isSetting){
                                SettingView(isSetting: $isSetting, isLoggedIn: $isLoggedIn, isHaveAccount: $isHaveAccound)
                            } else{
                                ProfileView()
                            }
                        }
                            .tabItem{
                                Image(systemName: "person")
                                Text("My Profile")
                            }
                            .tag(3)
                    }
                    .onChange(of: currentTabIndex) { oldValue, newValue in
                        if newValue != 3 {
                            isSetting = false
                        }
                    }
                }
            } else {
                VStack {
                    CreateAccount(isLoggedIn : $isLoggedIn, currentTabIndex: $currentTabIndex)
                }
                .padding(.vertical, 0)
            }
        } else {
            VStack {
                LoginView(isHaveAccount: $isHaveAccound)
            }.padding(20)
        }
    }
}

#Preview {
    ContentView()
}

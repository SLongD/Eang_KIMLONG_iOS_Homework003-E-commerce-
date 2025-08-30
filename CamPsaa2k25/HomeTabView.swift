//
//  HomeView.swift
//  CamPsaa2k25
//
//  Created by Eang Kimlong on 8/25/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    @State private var currentTabIndex = 0
    @State private var toggleStates: [UUID: Bool] = [:]
    let imageUrl  =  [
        BackGroundImage(imageUrl: "loginBackground",caption: "",des: ""
        ),
        BackGroundImage(imageUrl: "loginBackground",caption: "",des: "" ),
    ];
    let imageCard = [
        ImageItem(imageUrl: "Bag", caption: "The Mirac", des: "Lisa Robber", price: "$120"),
        ImageItem(imageUrl: "Bag2", caption: "The Mirac", des: "Lisa Robber", price: "$120"),
        ImageItem(imageUrl: "Bag3", caption: "The Mirac", des: "Lisa Robber", price: "$120")
    ]
    var body: some View {
        
        customPageView(
            imageUrls: imageUrl,
            imageHeight: 230,
            autoAdvance: true,
            selectedTab: $selectedTab,
            changeFrame: true)
        
        HStack{
            Text("New Arrivals")
            Spacer()
            Text("See All")
                .foregroundStyle(.blue.opacity(0.9))
        }
        .padding(.horizontal)
        HStack(spacing: 25){
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(imageCard) { item in
                        customImageCard(
                            image: item.imageUrl,
                            title: item.caption,
                            subtitle: item.des,
                            price: item.price,
                            btnToggle: Binding(
                                get: { toggleStates[item.id] ?? false },
                                set: { toggleStates[item.id] = $0 }
                            )
                        )
                    }
                }
            }
        }
    }
}


let imageUrl = ["Image", "Image 1" , "Image 2" , "Image 3" , "Image 4" , "Image 5" , "Image 6"]
struct Category: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 15) {
                ForEach(imageUrl.indices, id: \.self) { index in
                    Image(imageUrl[index])
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 150)
                        .cornerRadius(10)
                        .overlay(alignment: (index % 2 == 0) ? .leading : .trailing){
                            VStack(alignment: .leading){
                                Text("New Arrival")
                                    .font(Font.system(size: 20, weight: .bold))
                                Text("205 Products")
                                    .font(Font.system(size: 15, weight: .light))
                            }
                            .padding(index % 2 == 0 ? .leading : .trailing, 20)
                            
                        }

                }
            }
        }

    }
}
#Preview {
    HomeView()
}

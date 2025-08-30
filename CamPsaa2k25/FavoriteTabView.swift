//
//  FavoriteTabView.swift
//  CamPsaa2k25
//
//  Created by Eang Kimlong on 8/28/25.
//
import SwiftUI

let btnLabel : [String] = ["All","Latest","Most Popular", "Last Week"]
let imageCard = [
    ImageItem(imageUrl: "Bag", caption: "The Mirac", des: "Lisa Robber", price: "$120"),
    ImageItem(imageUrl: "Bag2", caption: "The Mirac", des: "Lisa Robber", price: "$120"),
    ImageItem(imageUrl: "Bag3", caption: "The Mirac", des: "Lisa Robber", price: "$120"),
    ImageItem(imageUrl: "Bag", caption: "The Mirac", des: "Lisa Robber", price: "$120"),
    ImageItem(imageUrl: "Bag2", caption: "The Mirac", des: "Lisa Robber", price: "$120"),
    ImageItem(imageUrl: "Bag3", caption: "The Mirac", des: "Lisa Robber", price: "$120"),
    ImageItem(imageUrl: "Bag3", caption: "The Mirac", des: "Lisa Robber", price: "$120")
]
struct FavoriteTabView: View {
    @State private var activeButtonIndex: Int = 0
    @State private var toggleStates: [UUID: Bool] = [:]
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<btnLabel.count, id: \.self) { index in
                        customBidingButton(btnLabel: btnLabel[index], btnIsActive: .constant(activeButtonIndex == index), action: {
                            activeButtonIndex = index
                        })
                    }
                }
            }
            
            ScrollView(showsIndicators: false){
                LazyHGrid(rows: Array(repeating: GridItem(.flexible(minimum: 100)), count: (imageCard.count + 1)/2), spacing: 20) {
                    ForEach(imageCard) { item in
                        customImageCard(
                            image: item.imageUrl,
                            title: item.caption,
                            subtitle: item.des,
                            price: item.price,
                            btnToggle: Binding(
                                get: { toggleStates[item.id] ?? true },
                                set: { toggleStates[item.id] = $0 }
                            )
                        )
                    }
                    .padding(.vertical, 10)
                }
            }
        }

    }
}
#Preview {
//    FavoriteTabView()
}


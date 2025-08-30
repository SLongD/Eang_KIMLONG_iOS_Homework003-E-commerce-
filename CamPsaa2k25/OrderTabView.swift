//
//  OrderTabView.swift
//  CamPsaa2k25
//
//  Created by Eang Kimlong on 8/26/25.
//

import SwiftUI
var OrderCardImage = [
    OrderCardItem(imageUrl: "Bag", title: "Bix Bag Limited", subTitle: "Edition 229", quantity: 1, color: "White", price: "$100", available: true),
    OrderCardItem(imageUrl: "Bag2", title: "Bix Bag Limited", subTitle: "Edition 229", quantity: 10, color: "White", price: "$100", available: true),
    OrderCardItem(imageUrl: "Bag3", title: "Bix Bag Limited", subTitle: "Edition 229", quantity: 4, color: "Black", price: "$700", available: true),
    OrderCardItem(imageUrl: "Image 10", title: "Bix Bag Limited", subTitle: "Edition 229", quantity: 5, color: "Red", price: "$450", available: true),
    OrderCardItem(imageUrl: "Image 13", title: "Bix Bag Limited", subTitle: "Edition 229", quantity: 3, color: "Pink", price: "$120", available: true),
    OrderCardItem(imageUrl: "Image 14", title: "Bix Bag Limited", subTitle: "Edition 229", quantity: 10, color: "White", price: "$200", available: true),
]
struct OrderTabView: View {
    var isHistory: Bool
    var body: some View {

        ScrollView(.vertical, showsIndicators: false){
            LazyVStack{
                ForEach(OrderCardImage){ item in
                    VStack{
                        customOrderCardImage(
                            image: item.imageUrl,
                            title: item.title,
                            subtitle: item.subTitle,
                            qty: item.quantity,
                            price: item.price,
                            available: isHistory ? false : item.available
                        )
                    }
                    .padding(17)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                    )
                }
            }
        }

        
    }
}



#Preview {
//   OrderTabView(isHistory: true)
}

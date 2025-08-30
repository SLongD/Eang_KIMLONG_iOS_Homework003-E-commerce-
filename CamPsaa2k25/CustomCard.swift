//
//  CustomFunction.swift
//  CamPsaa2k25
//
//  Created by Eang Kimlong on 8/21/25.
//
import SwiftUI
import Foundation

func customImageCard(image: String, title: String, subtitle: String, price: String, btnToggle: Binding<Bool>) -> some View {
    VStack(spacing: 8) {
        Image(image)
            .resizable()
            .scaledToFill() // Changed from scaledToFit to scaledToFill
            .frame(width: 180, height: 200)
            .clipped() // Clips any overflow from scaledToFill
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay(alignment: .topTrailing) {
                Button(action: {
                    btnToggle.wrappedValue.toggle()
                }){
                    Image(systemName: btnToggle.wrappedValue ? "heart.fill" : "heart")
                        .foregroundStyle(btnToggle.wrappedValue ? .red : .white)
                        .font(.system(size: 16))
                }
                .padding(8)
                .background(.gray.opacity(0.7))
                .clipShape(Circle())
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
            }
        
        VStack(spacing: 4) {
            Text(title)
                .font(.title3)
                .foregroundColor(.black)
                .lineLimit(1) // Prevents text from expanding height
                .truncationMode(.tail)
            
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(1)
                .truncationMode(.tail)
            
            Text(price)
                .font(.caption2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .frame(width: 180) // Fixed width for text container
    }
    .frame(width: 180, height: 280) // Fixed frame for entire card
    .background(Color.clear)
}

//Custom Order Card Image
func customOrderCardImage(image: String, title: String, subtitle: String, qty:Int, color: String = "White", price: String, available: Bool = true) -> some View {
    VStack(alignment: .center){
        HStack() {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 85)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 15))
            VStack(alignment: .leading){
                Text("\(title)\n\(subtitle)")
                    .bold()
                HStack{
                    Text("Color:")
                        .foregroundStyle(.gray)
                    Text(color)
                }
                HStack{
                    Text("Qty:")
                        .foregroundStyle(.gray)
                    Text("\(qty)")
                }
            }
            Spacer()
            VStack(alignment: .trailing){
                Button(action: {
                    
                }) {
                    Text(available ? "OnProgress" : "Completed")
                        .foregroundStyle(available ? .yellow : .green)
                        .bold()
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(available ? .yellow : .green), lineWidth: 2)
                        )
                }
                Text(price)
                    .font(Font.system(size: 24, weight: .bold))
            }
        }
        HStack{
            Button(action: {
                
            }) {
                Text("Detail")
                    .foregroundStyle(.black)
                    .bold()
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity)
                    .background(
                        ZStack {
                            Capsule()
                                .fill(Color.white) // Background
                            Capsule()
                                .stroke(Color.gray.opacity(0.2), lineWidth: 2) // Border
                        }
                    )
            }
            Button(action: {
                
            }) {
                Text("Tracking")
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity)
                    .background(
                        ZStack {
                            Capsule()
                                .fill(Color.blue) // Background
                            Capsule()
                                .stroke(Color.blue, lineWidth: 2) // Border
                        }
                    )
            }
        }

    }
}



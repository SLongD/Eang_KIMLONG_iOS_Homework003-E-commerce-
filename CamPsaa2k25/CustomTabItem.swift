//
//  CustomTabItem.swift
//  CamPsaa2k25
//
//  Created by Eang Kimlong on 8/30/25.
//

import SwiftUI
import Foundation

func customPageView(
    imageUrls: [BackGroundImage],
    imageHeight: CGFloat = 350,
    autoAdvance: Bool = false,
    autoAdvanceInterval: TimeInterval = 3.0,
    selectedTab: Binding<Int>,
    changeFrame: Bool = false
) -> some View {
    VStack {
        TabView(selection: selectedTab) {
            ForEach(0..<imageUrls.count, id: \.self) { index in
                let item = imageUrls[index]
                VStack(alignment: .leading, spacing: 35) {
                    VStack {
                        Image(item.imageUrl)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: imageHeight)
                            .clipped()
                            .cornerRadius(20)
                    }
                    
                    // Only show caption if it's not empty
                    if !item.caption.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty {
                        Text(item.caption)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.center)
                    }
                    
                    // Only show description if it's not empty
                    if !item.des.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty {
                        Text(item.des)
                            .font(.system(size: 18))
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                    }
                }
                .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .indexViewStyle(.page(backgroundDisplayMode: changeFrame ? .never : .always))
        .frame(height: changeFrame ? 230 : nil)
        .tint(.blue)
        .onReceive(Timer.publish(every: autoAdvance ? autoAdvanceInterval : 999999, on: .main, in: .common).autoconnect()) { _ in
            if autoAdvance && !imageUrls.isEmpty {
                withAnimation {
                    selectedTab.wrappedValue = selectedTab.wrappedValue < imageUrls.count - 1 ? selectedTab.wrappedValue + 1 : 0
                }
            }
        }
    }
}



func customHeaderTabViewStyle (tabs : [String], selectedTab: Binding<Int>, viewOfTabContent: [() -> AnyView] ) -> some View {
    VStack(spacing: 0) {
        
                HStack(spacing: 0) {
                    ForEach(0..<tabs.count, id: \.self) { index in
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                selectedTab.wrappedValue = index
                            }
                        }) {
                            VStack(spacing: 0) {
                                Text(tabs[index])
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.black)
                                    .padding(.vertical, 12)
                                
                                // Blue indicator line
                                Rectangle()
                                    .fill(selectedTab.wrappedValue == index ? Color.blue : Color.clear)
                                    .frame(height: 3)
                                    .animation(.easeInOut(duration: 0.3), value: selectedTab.wrappedValue)
                                Divider()
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                
                // Tab Content
                TabView(selection: selectedTab) {
                    ForEach(0..<tabs.count, id: \.self) { index in
                        VStack{
                            viewOfTabContent[index]()
                        }
                         //viewOfTabContent[index]()   // call closure
                         .tag(index)
                    }
                }
                .padding(.top , 10)
                .tabViewStyle(.page(indexDisplayMode: .never))
    }
    .padding()
}

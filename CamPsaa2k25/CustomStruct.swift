//
//  HelperStruct.swift
//  CamPsaa2k25
//
//  Created by Eang Kimlong on 8/22/25.
//
import Foundation

struct BackGroundImage : Identifiable{
    var id = UUID()
    var imageUrl : String
    var caption : String
    var des : String
}

struct SettingItem : Identifiable{
    var id = UUID()
    var icon : String
    var description : String
}

struct ImageItem : Identifiable{
    var id = UUID()
    var imageUrl : String
    var caption : String
    var des : String
    var price : String
}

struct OrderCardItem : Identifiable{
    var id = UUID()
    var imageUrl : String
    var title : String
    var subTitle : String
    var quantity : Int
    var color : String
    var price : String
    var available : Bool
}

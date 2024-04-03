//
//  Menu.swift
//  MacDonalds
//
//  Created by David Jang on 4/2/24.
//

import Foundation

protocol Menu {
    
    var id: UUID { get }
    var name: String { get }
    var description: String? { get }
    var price: Int { get }
    var image: String { get }
    var calories: Int? { get }
    
}

enum FoodType {
    
    case burger, side, salad, drink
    
}

struct MenuItem: Menu {
    
    var id: UUID = UUID()
    var name: String
    var description: String?
    var price: Int
    var image: String
    var calories: Int?
    var type: FoodType
    
}

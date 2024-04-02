//
//  Menu.swift
//  MacDonalds
//
//  Created by David Jang on 4/2/24.
//

import Foundation

protocol Menu {
    
    var name: String { get set }
    var description: String { get set }
    var price: String { get set }
    var image: String { get set }
    
}


struct Combo: Menu {
    
    var name: String
    var description: String
    var price: String
    var image: String
    var burger: String
    var sideMenu: String
    var drink: String
    
}


struct Burger: Calories {
    
    var name: String
    var description: String
    var calories: String
    var price: String
    var image: String
    var cheeseOption: CheeseOption = .none
    var onionOption: OnionOption = .none
    var pattyOption: PattyOption = .none
    
}


struct SideMenu: Calories {
    
    var name: String
    var description: String
    var calories: String
    var price: String
    var image: String
    
}


struct SaladMenu: Calories {
    
    var name: String
    var description: String
    var calories: String
    var price: String
    var image: String
    
}


struct Drink: Menu {
    
    var name: String
    var description: String
    var price: String
    var image: String
    var drinkOption: DrinkOption = .coke
    
}

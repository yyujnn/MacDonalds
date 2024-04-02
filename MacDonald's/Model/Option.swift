//
//  Option.swift
//  MacDonalds
//
//  Created by David Jang on 4/2/24.
//

import Foundation


protocol Option {
    
    var price: Int { get }
    
}

enum CheeseOption: Option {
    
    case add, none
    
    var price: Int {
        switch self {
            case .add:
                return 500
            case .none:
                return 0
                
        }
    }
}

enum OnionOption: Option {
    
    case add, none
    
    var price: Int {
        switch self {
            case .add:
                return 300
            case .none:
                return 0
                
        }
    }
}

enum PattyOption: Option {
    
    case add, none, veggiePatty
    
    var price: Int {
        switch self {
        case .add:
            return 1000
        case .none:
            return 0
        case .veggiePatty:
            return 700
                
        }
    }
}

enum DrinkOption: Option {
    
    case coke, cokeZero, sprite, spriteZero, drPepper, fanta
    
    var price: Int {
        switch self {
        case .coke, .cokeZero, .sprite, .spriteZero:
            return 0
        case .drPepper, .fanta:
            return 200
                
        }
    }
}

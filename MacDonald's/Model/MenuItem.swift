//
//  MenuItem.swift
//  MacDonalds
//
//  Created by David Jang on 4/2/24.
//

import Foundation


// 햄버거 메뉴
let baconCheese = MenuItem(name: "베이컨 치즈 버거", description: "Fresh British beef, Applewood smoked bacon, American cheese, crisp lettuce, tomato, and Heinz mayo. Its a favourite of bacon lovers everywhere.", price: 3700, image: "baconCheese", calories: 406, type: .burger)

let cheese = MenuItem(name: "치즈 버거", description: "Fresh British beef topped with cheese, pickles, onions, tomatoes, crisp lettuce, Heinz ketchup, and Heinz mayo. It's big flavour at a savoury price.", price: 2800, image: "cheese", calories: 375, type: .burger)

let doubleBacon = MenuItem(name: "더블 베이컨 버거", description: "A half-pound* of fresh British beef, American cheese, 6 pieces of crispy Applewood smoked bacon, Heinz ketchup, and Heinz mayo. Carnivores rejoice!", price: 6200, image: "doubleBacon", calories: 1010, type: .burger)

let triple = MenuItem(name: "트리플 버거", description: "Three quarters of a pound* of fresh British beef, American cheese, crisp lettuce, tomato, pickle, Heinz ketchup, Heinz mayo, and onion on a toasted bun. Use both hands!", price: 5400, image: "triple", calories: 1204, type: .burger)

let doublee = MenuItem(name: "더블 버거", description: "A half-pound* of fresh British beef, American cheese, crisp lettuce, tomato, pickle, Heinz ketchup, Heinz mayo, and onion on a toasted bun. More meat means more to love.", price: 4800, image: "doublee", calories: 888, type: .burger)

let singlee = MenuItem(name: "싱글 버거", description: "A quarter-pound* of fresh British beef, American cheese, crisp lettuce, tomato, pickle, Heinz ketchup, Heinz mayo, and onion on a toasted bun just the way Dave intended.", price: 3900, image: "singlee", calories: 524, type: .burger)


// 사이드 메뉴
let cheesepotato = MenuItem(name: "치즈 감자 베이크", description: "Hot and fluffy potato topped with creamy cheese sauce, and shredded cheese. Because nothing goes with a potato like cheese.", price: 1100, image: "cheesepotato", calories: 342, type: .side)

let chiliCheesePotato = MenuItem(name: "칠리 치즈 감자 베이크", description: "Hot and fluffy potato topped with Wendy's signature meaty, flavourful chili, creamy cheese sauce and shredded cheese. This will be your best bud.", price: 1400, image: "chiliCheesePotato", calories: 428, type: .side)

let chiliCheeseFries = MenuItem(name: "칠리 치즈 감자튀김", description: "Our natural-cut, skin-on, sea-salted fries topped our hearty chili and warm, creamy cheese sauce,  and shredded cheddar cheese. Easy to love. Hard to beat.", price: 2800, image: "chiliCheeseFries", calories: 481, type: .side)

let friesSmall = MenuItem(name: "감자튀김 스몰", description: "Natural-cut, skin-on, sea-salted fries served hot and crispy. The world loves them for a reason.", price: 900, image: "friesSmall", calories: 176, type: .side)

let friesMedium = MenuItem(name: "감자튀김 미디움", description: "Natural-cut, skin-on, sea-salted fries served hot and crispy. The world loves them for a reason.", price: 1200, image: "friesMedium", calories: 239, type: .side)

let friesLarge = MenuItem(name: "감자튀김 라지", description: "Natural-cut, skin-on, sea-salted fries served hot and crispy. The world loves them for a reason.", price: 1400, image: "friesLarge", calories: 299, type: .side)


// 음료 메뉴
let coke = MenuItem(name: "콜라", price: 1200, image: "coke", type: .drink)
let cokeZero = MenuItem(name: "제로 콜라", price: 1200, image: "cokeZero", type: .drink)
let sprite = MenuItem(name: "스프라이트", price: 1200, image: "sprite", type: .drink)


// 샐러드 매뉴
let avocadoChickenSalad = MenuItem(name: "아보카도 치킨 샐러드", description: "Made fresh daily with our signature lettuce blend, cheddar cheese, diced tomatoes, cool, creamy avocado, Applewood smoked bacon, and grilled chicken breast hot off the grill, all topped with a Southwest Ranch Dressing. ", price: 5900, image: "avocadoChickenSalad", calories: 485, type: .salad)

let caesarChikenSalad = MenuItem(name: "시저 치킨 샐러드", description: "Made fresh daily with romaine lettuce, grilled chicken breast, Italian cheese, and creamy Caesar dressing. One bite will tell you why its king of more than just the Romaines.", price: 4600, image: "caesarChikenSalad", calories: 481, type: .salad)


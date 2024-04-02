//
//  MenuItem.swift
//  MacDonalds
//
//  Created by David Jang on 4/2/24.
//

import Foundation


// 콤보 메뉴
let tripleBurgerCombo = Combo(name: "트리플 버거 콤보", description: "Three quarters of a pound* of fresh British beef, American cheese, crisp lettuce, tomato, pickle, Heinz ketchup, Heinz mayo, and onion on a toasted bun. Use both hands!", price: "6,900원", image: "tripleCombo", burger: tripleBurger.name, sideMenu: friesSmall.name, drink: coke.name)

let doubleBaconBurgerCombo = Combo(name: "더블 베이컨 콤보", description: "A half-pound* of fresh British beef, American cheese, 6 pieces of crispy Applewood smoked bacon, Heinz ketchup, and Heinz mayo. Carnivores rejoice!", price: "8,200원", image: "doubleBaconCombo", burger: doubleBaconBurger.name, sideMenu: friesMedium.name, drink: coke.name)

let singleBurgerCombo = Combo(name: "싱글 버거 콤보", description: "A quarter-pound* of fresh British beef, American cheese, crisp lettuce, tomato, pickle, Heinz ketchup, Heinz mayo, and onion on a toasted bun just the way Dave intended.", price: "5,500원", image: "singleCombo", burger: singleBurger.name, sideMenu: friesMedium.name, drink: coke.name)

let doubleBurgerCombo = Combo(name: "더블 버거 콤보", description: "A half-pound* of fresh British beef, American cheese, crisp lettuce, tomato, pickle, Heinz ketchup, Heinz mayo, and onion on a toasted bun. More meat means more to love.  May contain EGG.", price: "6,200원", image: "doubleCombo", burger: doubleBurger.name, sideMenu: friesMedium.name, drink: coke.name)



// 햄버거 메뉴
let baconCheeseBurger = Burger(name: "베이컨 치즈 버거", description: "Fresh British beef, Applewood smoked bacon, American cheese, crisp lettuce, tomato, and Heinz mayo. Its a favourite of bacon lovers everywhere.", calories: "406 kcal", price: "3,700원", image: "baconCheese")

let cheeseBurger = Burger(name: "치즈 버거", description: "Fresh British beef topped with cheese, pickles, onions, tomatoes, crisp lettuce, Heinz ketchup, and Heinz mayo. It's big flavour at a savoury price.", calories: "375 kcal", price: "2,800원", image: "cheese")

let doubleBaconBurger = Burger(name: "더블 베이컨 버거", description: "A half-pound* of fresh British beef, American cheese, 6 pieces of crispy Applewood smoked bacon, Heinz ketchup, and Heinz mayo. Carnivores rejoice!", calories: "1010 kcal", price: "6,200원", image: "doubleBacon")

let tripleBurger = Burger(name: "트리플 버거", description: "Three quarters of a pound* of fresh British beef, American cheese, crisp lettuce, tomato, pickle, Heinz ketchup, Heinz mayo, and onion on a toasted bun. Use both hands!", calories: "1204 kcal", price: "5,400원", image: "triple", cheeseOption: .none, onionOption: .none, pattyOption: .none)

let doubleBurger = Burger(name: "더블 버거", description: "A half-pound* of fresh British beef, American cheese, crisp lettuce, tomato, pickle, Heinz ketchup, Heinz mayo, and onion on a toasted bun. More meat means more to love.", calories: "888 kcal", price: "4,800원", image: "double")

let singleBurger = Burger(name: "싱글 버거", description: "A quarter-pound* of fresh British beef, American cheese, crisp lettuce, tomato, pickle, Heinz ketchup, Heinz mayo, and onion on a toasted bun just the way Dave intended.", calories: "524 kcal", price: "3,900원", image: "single")


// 사이드 메뉴
let cheesepotato = SideMenu(name: "치즈 감자 베이크", description: "Hot and fluffy potato topped with creamy cheese sauce, and shredded cheese. Because nothing goes with a potato like cheese.", calories: "342 kcal", price: "1,100원", image: "cheesepotato")

let chiliCheesePotato = SideMenu(name: "칠리 치즈 감자 베이크", description: "Hot and fluffy potato topped with Wendy's signature meaty, flavourful chili, creamy cheese sauce and shredded cheese. This will be your best bud.", calories: "428 kcal", price: "1,400원", image: "chiliCheesePotato")

let chiliCheeseFries = SideMenu(name: "칠리 치즈 감자튀김", description: "Our natural-cut, skin-on, sea-salted fries topped our hearty chili and warm, creamy cheese sauce,  and shredded cheddar cheese. Easy to love. Hard to beat.", calories: "481 kcal", price: "2,800", image: "chiliCheeseFries")

let friesSmall = SideMenu(name: "감자튀김 스몰", description: "Natural-cut, skin-on, sea-salted fries served hot and crispy. The world loves them for a reason.", calories: "176 kcal", price: "900원", image: "friesSmall")

let friesMedium = SideMenu(name: "감자튀김 미디움", description: "Natural-cut, skin-on, sea-salted fries served hot and crispy. The world loves them for a reason.", calories: "239 kcal", price: "1,200원", image: "friesMedium")

let friesLarge = SideMenu(name: "감자튀김 라지", description: "Natural-cut, skin-on, sea-salted fries served hot and crispy. The world loves them for a reason.", calories: "299 kcal", price: "1,400원", image: "friesLarge")


// 음료 메뉴
let coke = Drink(name: "콜라", description: "시원한 음료", price: "1,200원", image: "coke")
let cokeZero = Drink(name: "제로 콜라", description: "시원한 음료", price: "1,200원", image: "cokeZero")
let sprite = Drink(name: "스프라이트", description: "시원한 음료", price: "1,200원", image: "sprite")


// 샐러드 매뉴
let avocadoChickenSalad = SaladMenu(name: "아보카도 치킨 샐러드", description: "Made fresh daily with our signature lettuce blend, cheddar cheese, diced tomatoes, cool, creamy avocado, Applewood smoked bacon, and grilled chicken breast hot off the grill, all topped with a Southwest Ranch Dressing. ", calories: "485 kcal", price: "5,900원", image: "avocadoChickenSalad")

let caesarChikenSalad = SaladMenu(name: "시저 치킨 샐러드", description: "Made fresh daily with romaine lettuce, grilled chicken breast, Italian cheese, and creamy Caesar dressing. One bite will tell you why its king of more than just the Romaines.", calories: "481 kcal", price: "4,600원", image: "caesarChikenSalad")


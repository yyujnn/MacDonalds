//
//  DataStorage.swift
//  MacDonald's
//
//  Created by YJ on 4/3/24.
//

import Foundation

struct DataStorage {
    // 전체 menu목록을 담고 있는 배열
    static var menuList: [Menu] = [
        baconCheese, cheese, doubleBacon, triple, doublee, singlee, cheesepotato, chiliCheesePotato, // 햄버거
        chiliCheeseFries, friesSmall, friesMedium, friesLarge, // 사이드
        coke, cokeZero, sprite, // 음료
        avocadoChickenSalad, caesarChikenSalad // 샐러드
    ]
    // 장바구니에 담은 menu목록을 담고 있는 배열
    static var cartList: [Menu] = []
    
    // 단일 메뉴 테스트용 변수
    static var testMenu: Menu = MenuItem(
        name: "치즈 버거",
        description: "Fresh British beef topped with cheese, pickles, onions, tomatoes, crisp lettuce, Heinz ketchup, and Heinz mayo. It's big flavour at a savoury price.",
        price: 3400,
        image: "cheese",
        type: .burger
    )
}

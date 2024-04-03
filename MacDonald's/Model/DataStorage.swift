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
        baconCheese, cheese, doubleBacon, triple, double, single, cheesepotato, chiliCheesePotato, // 햄버거
        chiliCheeseFries, friesSmall, friesMedium, friesLarge, // 사이드
        coke, cokeZero, sprite, // 음료
        avocadoChickenSalad, caesarChikenSalad // 샐러드
    ]
    // 장바구니에 담은 menu목록을 담고 있는 배열
    static var cartList: [Menu] = []
}

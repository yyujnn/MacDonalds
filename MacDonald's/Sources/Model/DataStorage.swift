//
//  DataStorage.swift
//  MacDonald's
//
//  Created by YJ on 4/3/24.
//

import Foundation


class DataStorage {
    static let shared = DataStorage() // 접근자

    private init() {} // private 외부 생성 못하게 하기

    var orderArray: [OrderMenu] = [] // 장바구니 목록 담는 배열
}

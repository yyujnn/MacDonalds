//
//  DataStorage.swift
//  MacDonald's
//
//  Created by YJ on 4/3/24.
//

import Foundation

// 싱글톤!
class DataStorage {
    static let shared = DataStorage() // 접근자

    private init() {} // private 외부 생성 못하게

    var orderArray: [OrderMenu] = [] // 장바구니목록 외부 수정 못함
}

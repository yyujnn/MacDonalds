//
//  Utility.swift
//  MacDonald's
//
//  Created by David Jang on 4/4/24.
//

import Foundation

// 숫자 단위 구분점
extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
}

// Int -> String
extension Numeric {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}

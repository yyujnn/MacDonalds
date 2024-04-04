//
//  CartTableViewCell.swift
//  MacDonald's
//
//  Created by 정유진 on 2024/04/02.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var orderMenuLabel: UILabel!
    @IBOutlet weak var orderPriceLabel: UILabel!
    @IBOutlet weak var orderCountLabel: UILabel!
    @IBOutlet weak var countStepper: UIStepper!
    
    var updateQuantityHandler: ((Int) -> Void)?
    var index: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        countStepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        countStepper.minimumValue = 1
    }
    
    @objc func stepperValueChanged() {
        // 스텝퍼의 값이 변경되면 호출되는 메소드
        // 라벨의 텍스트를 스텝퍼의 값으로 업데이트
        let value = Int(countStepper.value)
        updateQuantityHandler?(value)
    }
    
    func updatePriceLabel(newPrice: Int, quantity: Int) {
        orderPriceLabel.text = "₩" + String(newPrice)
        orderCountLabel.text = "\(quantity)"
    }
}

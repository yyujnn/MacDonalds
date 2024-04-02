//
//  CartTableViewCell.swift
//  MacDonald's
//
//  Created by 정유진 on 2024/04/02.
//

import Foundation
import UIKit

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var orderMenuLabel: UILabel!
    @IBOutlet weak var orderPriceLabel: UILabel!
    @IBOutlet weak var orderCountLabel: UILabel!
    @IBOutlet weak var countStepper: UIStepper!
    
    override func awakeFromNib() {
        print("CartTableViewCell - awakeFromNib() called")
        super.awakeFromNib()
        
    }
    @IBAction func stepperPressed(_ sender: UIStepper) {
        self.orderCountLabel.text = Int(sender.value).description
    }
}

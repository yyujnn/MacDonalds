//
//  CustomCollectionViewCell.swift
//  MacDonald's
//
//  Created by 정유진 on 2024/04/01.
//

import Foundation
import UIKit
class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    var categoryName : String = "" {
        didSet{
            print("CustomCollectionViewCell / imageName - didSet() : \(categoryName)")
            // cell의 UI 설정
            self.categoryLabel.text = categoryName
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        print("CustomCollectionViewCell - awakeFromNib() called")
        self.contentView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        self.contentView.layer.cornerRadius = 18
    }
}

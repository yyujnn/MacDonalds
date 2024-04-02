//
//  CartVC.swift
//  MacDonald's
//
//  Created by 정유진 on 2024/04/02.
//

import Foundation
import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var orderListTableView: UITableView!
    
    let tempOrderArray = [
        "불고기 버거 세트", "소고기 버거 세트"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CartViewController - viewDidLoad() called")
        self.orderListTableView.dataSource = self
        self.orderListTableView.delegate = self
        
        // 쎌 리소스 파일 가져오기
        let cartTableViewCellNib = UINib(nibName: String(describing: CartTableViewCell.self), bundle: nil)
        
        self.orderListTableView.register(cartTableViewCellNib, forCellReuseIdentifier: "CartTableViewCell")
        
    }
}
extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tempOrderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = orderListTableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as? CartTableViewCell else {  return UITableViewCell() }
        cell.orderMenuLabel.text = tempOrderArray[indexPath.row]
        return cell
    }
    
    
}
extension CartViewController: UITableViewDelegate {
    
}

/*
#Preview {
    CartViewController()
}
*/

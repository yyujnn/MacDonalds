//
//  CartVC.swift
//  MacDonald's
//
//  Created by 정유진 on 2024/04/02.
//

import Foundation
import UIKit

// 주문 메뉴 모델
struct OrderMenu {
    var menu: MenuItem
    var quantity: Int
}

// MARK: - 장바구니 뷰컨트롤러
class CartViewController: UIViewController {
    
    @IBOutlet weak var orderListTableView: UITableView!
    @IBOutlet weak var orderTotalCount: UILabel!
    @IBOutlet weak var orderTotalPrice: UILabel!
    @IBOutlet weak var paymentButton: UIButton!
    
    // 임시 주문 배열 넘어왔다고 가정
    var orderArray:[OrderMenu] = [
        OrderMenu(menu: baconCheese, quantity: 2),
        OrderMenu(menu: cheese, quantity: 3),
        OrderMenu(menu: doubleBacon, quantity: 5)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CartViewController - viewDidLoad() called")
        self.orderListTableView.dataSource = self
        self.orderListTableView.delegate = self
        
        // 쎌 리소스 파일 가져오기
        let cartTableViewCellNib = UINib(nibName: String(describing: CartTableViewCell.self), bundle: nil)
        
        self.orderListTableView.register(cartTableViewCellNib, forCellReuseIdentifier: "CartTableViewCell")
        self.paymentButton.layer.cornerRadius = 20
        
        // 총 가격 업데이트
        self.updateTotal()
    }
    
    // MARK: - 총 가격 설정 메서드
    func updateTotal() {
        var totalCount = 0
        var totalPrice = 0
        
        for order in orderArray {
            totalCount += order.quantity
            totalPrice += (order.menu.price) * (order.quantity)
        }
        
        orderTotalCount.text = "\(totalCount)"
        orderTotalPrice.text = "₩\(totalPrice)"
    }

}

// MARK: - DataSource
extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = orderListTableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as? CartTableViewCell else {  return UITableViewCell() }
        let order = orderArray[indexPath.row]
        let price = order.menu.price*order.quantity
        
        cell.orderMenuLabel.text = order.menu.name
        cell.orderCountLabel.text = "\(order.quantity)"
        cell.orderPriceLabel.text = "₩" + String(price)
        // 셀의 스텝퍼 초기 값을 주문 수량으로 설정
        cell.countStepper.value = Double(order.quantity)
        
        // 수량 업데이트
        cell.updateQuantityHandler = { [weak self] quantity in
            guard let self = self else { return }
            // 주문 수량 업데이트
            self.orderArray[indexPath.row].quantity = quantity
            // 가격 업데이트
            let newPrice = order.menu.price * quantity
            
            // cell의 수량 및 가격 설정하기
            cell.updatePriceLabel(newPrice: newPrice, quantity: quantity)

            print("스텝퍼 수정: \(orderArray)")
            
            self.updateTotal()
        }
        
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

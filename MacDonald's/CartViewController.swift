//
//  CartVC.swift
//  MacDonald's
//
//  Created by 정유진 on 2024/04/02.
//

import Foundation
import UIKit

// 가상 데이터 모델
struct Menu2 {
    var name: String
    var description: String?
    var price: Int
    var image: String
    var calories: Float
    var foodType: FoodType
}

enum FoodType {
    case burger
    case side
    case salad
    case drink
}

// 치즈 버거
let cheezeBurger: Menu2 = Menu2(
    name: "치즈버거",
    price: 12000,
    image: "avocadoChickenSalad",
    calories: 10,
    foodType: .salad)

let chickenSalad: Menu2 = Menu2(
    name: "치킨샐러드",
    price: 5000,
    image: "avocadoChickenSalad",
    calories: 10,
    foodType: .salad)

// 주문 메뉴 모델
struct OrderMenu {
    var menu: Menu2
    var quantity: Int
}


class CartViewController: UIViewController {
    
    @IBOutlet weak var orderListTableView: UITableView!
    
    // 임시 주문 배열 넘어왔다고 가정
    var orderArray:[OrderMenu] = [
        OrderMenu(menu: cheezeBurger, quantity: 2),
        OrderMenu(menu: chickenSalad, quantity: 3)
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
            
            cell.updatePriceLabel(newPrice: newPrice, quantity: quantity)
            
            print("스텝퍼 수정: \(orderArray)")
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

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
    var orderArray:[OrderMenu] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(handleOrderAdded), name: NSNotification.Name("orderAdded"), object: nil)
        
        self.orderListTableView.dataSource = self
        self.orderListTableView.delegate = self
        
        // 쎌 리소스 파일 가져오기
        let cartTableViewCellNib = UINib(nibName: String(describing: CartTableViewCell.self), bundle: nil)
        
        self.orderListTableView.register(cartTableViewCellNib, forCellReuseIdentifier: "CartTableViewCell")
        self.paymentButton.layer.cornerRadius = 20
        
        // 총 가격 업데이트
        self.updateTotal()
    }
    
    @objc func handleOrderAdded() {
        self.orderListTableView.reloadData()
        self.updateTotal()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        orderListTableView.reloadData() // 테이블 뷰 리로드로 최신 장바구니 목록 반영
        updateTotal() // 총액 업데이트
    }
    
    // MARK: - 전체 삭제 버튼
    @IBAction func tapDeleteButton(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: "장바구니를 비우시겠습니까?", preferredStyle: .alert)
        // 확인 액션(삭제)
        let delete = UIAlertAction(title: "확인", style: .default) { (_) in
            // 주문 배열 비우기
            self.orderArray.removeAll()
            
            // 테이블 뷰 리로드
            self.orderListTableView.reloadData()
            
            // 총 가격 업데이트
            self.updateTotal()
            print(self.orderArray)
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(delete)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    // MARK: - 결제하기 버튼
    @IBAction func tapPaymentButton(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: "결제하시겠습니까?", preferredStyle: .alert)
        
        // 확인 액션
        let confirmAction = UIAlertAction(title: "확인", style: .default) { (_) in
            // 주문을 결제하고 장바구니 비우기
            self.orderArray.removeAll()
            
            // 테이블 뷰 리로드
            self.orderListTableView.reloadData()
            
            // 총 가격 업데이트
            self.updateTotal()
            
            // 결제 완료 알림창 표시
            let paymentCompletedAlert = UIAlertController(title: "결제 완료", message: "주문이 성공적으로 결제되었습니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            paymentCompletedAlert.addAction(okAction)
            self.present(paymentCompletedAlert, animated: true, completion: nil)
        }
        
        // 취소 액션
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        // 알림창에 액션 추가
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        // 알림창 표시
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - 총 가격 설정 메서드
    func updateTotal() {
        var totalCount = 0
        var totalPrice = 0
        
        for order in DataStorage.shared.orderArray {
            totalCount += order.quantity
            totalPrice += (order.menu.price) * (order.quantity)
        }
        
        orderTotalCount.text = "\(totalCount)"
        orderTotalPrice.text = "₩\(totalPrice.formattedWithSeparator)"
    }
}

// MARK: - DataSource
extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataStorage.shared.orderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as? CartTableViewCell else { return UITableViewCell() }
        let order = DataStorage.shared.orderArray[indexPath.row]
        let price = order.menu.price
        
        cell.orderMenuLabel.text = order.menu.name
        cell.orderCountLabel.text = "\(order.quantity)"
        let totalPriceForItem = price * order.quantity
            cell.orderPriceLabel.text = "₩\(totalPriceForItem.formattedWithSeparator)"
        // 셀의 스텝퍼 초기 값을 주문 수량으로 설정
        cell.countStepper.value = Double(order.quantity)
        
        // 수량 업데이트
        cell.updateQuantityHandler = { [weak self] quantity in
            guard let self = self else { return }
            // 주문 수량 및 총 가격 업데이트
            DataStorage.shared.orderArray[indexPath.row].quantity = quantity // 수정된 데이터 소스 참조
            let newPrice = order.menu.price * quantity
            
            // cell의 수량 및 가격 설정하기
            DispatchQueue.main.async {
                cell.orderCountLabel.text = "\(quantity)"
                cell.orderPriceLabel.text = "₩\(newPrice.formattedWithSeparator)"
            }
                self.updateTotal()
        }
        
        return cell
    }
    
}
extension CartViewController: UITableViewDelegate {
    // MARK: - cell 삭제
    // 셀 편집 여부를 설정
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 사용자가 셀을 삭제할 때 호출됩니다.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 삭제하려는 셀의 인덱스
            let index = indexPath.row
            
            // 데이터 소스에서 셀 삭제
            orderArray.remove(at: index)
            
            // 테이블 뷰에서 셀 삭제
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            updateTotal()
        }
    }
}

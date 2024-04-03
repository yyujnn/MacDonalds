//
//  DetailViewController.swift
//  MacDonald's
//
//  Created by 정유진 on 2024/04/02.

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var addToCart: UIButton!
    @IBOutlet weak var goToCart: UIButton!
    
    var cartList: [Menu] = [
        MenuItem(name: "아보카도 치킨 샐러드",
                 price: 5900,
                 image: "avocadoChickenSalad",
                 type: .salad)]
    
    let menu: Menu = MenuItem(
        name: "치즈 버거",
        price: 3400,
        image: "cheeze",
        type: .burger)
    
    var count: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuImageView.image = .cheese

        self.detailTableView.dataSource = self
        self.detailTableView.delegate = self
        self.totalAmountLabel.layer.masksToBounds = true
        self.totalAmountLabel.layer.cornerRadius = 15
        self.addToCart.layer.masksToBounds = true
        self.addToCart.layer.cornerRadius = 15
        self.addToCart.backgroundColor = .systemPink
        self.totalAmountLabel.backgroundColor = .lightGray
    }
    // stepper 클릭시, 총 금액 업데이트
    @objc func stepperClicked(_ sender: UIStepper) {
        print(">>> stepper clicked: \(sender.tag), sender.value: \(sender.value)")
        count = Int(sender.value)
        self.detailTableView.reloadData()
    }
    
    // 담기 버튼 alert 추가
    @IBAction func addToCart(_ sender: Any) {
        let alert = UIAlertController(title: "장바구니 담기", message: "해당 상품을 추가하시겠습니까?", preferredStyle: .alert)
        // 추가 버튼
        let addButton = UIAlertAction(title: "추가", style: .default, handler: { [ weak self ] _ in
            let newItem = MenuItem(name: "치즈 버거", price: 3400, image: "cheeze", type: .burger)
            self?.cartList.append(newItem)
            self?.detailTableView.reloadData()
            print("ClickedAddButton")
        })
        // 취소 버튼
        let cancelButton = UIAlertAction(title: "취소", style: .default, handler: nil)
        alert.addAction(addButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? ListCell else { return UITableViewCell() }
        cell.menuNameLabel.text = menu.name
        cell.menuPriceLabel.text = "₩\(menu.price)"
        let totalAmount = (menu.price) * count
        
        cell.countLabel.text = "\(count)"
        cell.countStepper.tag = indexPath.row
        cell.countStepper.addTarget(self, action: #selector(stepperClicked), for: .valueChanged)
        totalAmountLabel.text = "총 금액: \(totalAmount)원"
        return cell
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuPriceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countStepper: UIStepper!

// - stepper 카운트
//    @IBAction func presentStepper(_ sender: UIStepper) {
//        countLabel.text = Int(sender.value).description
//    }
    
// - 뒤로가기 버튼이 필요하다면!
// @IBAction func closeButton(_ sender: Any) {
//          dissmiss(animated: true, completion: nil)
// }
    
// - 데이터 담아서 저장하는 코드 만들기
    
    
}



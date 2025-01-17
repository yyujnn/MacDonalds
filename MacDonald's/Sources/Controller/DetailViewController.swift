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
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    
    // MenuVC로부터 받아올 Menu 정보
    var menu: Menu?
    
    // 메인메뉴 주문 갯수
    var count: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = menu?.name
        tableViewConfigure()
        viewConfigure()
        configureNavigationBar()
    }
        
    func configureNavigationBar() {
        // 장바구니로 가기 버튼 생성
        let goToButton = UIBarButtonItem(image: UIImage(systemName: "cart.fill"), style: .plain, target: self, action: #selector(cartButtonTapped))
        self.navigationItem.rightBarButtonItem = goToButton
        self.navigationItem.rightBarButtonItem?.tintColor = .systemOrange
        
        // 네비에게이션바 디자인 변경
        self.navigationController?.navigationBar.tintColor = .systemOrange
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    // UI와 관련된 초기 설정
    func viewConfigure() {
        if let menu = menu {
            menuImageView.image = UIImage(named: menu.image) ?? UIImage(systemName: "carrot.fill")!
            descriptionLabel.text = menu.description
            let attrString = NSMutableAttributedString(string: menu.description ?? "")
            let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 8
                attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
                descriptionLabel.attributedText = attrString
        } else {
            descriptionLabel.text = "잠시후 다시 시도해주세요."
        }
        
        if let calories = menu?.calories {
            self.calorieLabel.text = "(\(calories) kcal)"
        } else {
            self.calorieLabel.text = "(- kcal)"
        }
        self.calorieLabel.textColor = .systemOrange
        self.calorieLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        
        self.totalAmountLabel.layer.masksToBounds = true
        self.totalAmountLabel.layer.cornerRadius = 15
        self.addToCartButton.layer.masksToBounds = true
        self.addToCartButton.layer.cornerRadius = 15
        self.addToCartButton.backgroundColor = .systemOrange
        self.totalAmountLabel.backgroundColor = .lightGray
    }

    // 테이블뷰와 관련된 초기 설정
    func tableViewConfigure() {
        self.detailTableView.dataSource = self
        self.detailTableView.delegate = self
    }
    
    // stepper 클릭시, 총 금액 업데이트
    @objc func stepperClicked(_ sender: UIStepper) {
        count = Int(sender.value)
        self.detailTableView.reloadData()
    }
    
    // 담기 버튼 alert 추가
    @IBAction func addToCartButtonClicked(_ sender: Any) {
        let alert = UIAlertController(title: "장바구니 담기", message: "해당 상품을 추가하시겠습니까?", preferredStyle: .alert)
        let addButton = UIAlertAction(title: "추가", style: .default) { [weak self] _ in
            guard let self = self, let menu = self.menu as? MenuItem else { return }
            let newOrder = OrderMenu(menu: menu, quantity: self.count)
            DataStorage.shared.orderArray.append(newOrder)
            self.dismiss(animated: true)
        }
        
        let cancelButton = UIAlertAction(title: "취소", style: .default)
        alert.addAction(addButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true)
    }
    
    @objc func cartButtonTapped() {
        let storyboard = UIStoryboard(name: "Cart", bundle: nil)
        guard let cartViewController = storyboard.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController else { return }
        cartViewController.modalPresentationStyle = .pageSheet
        self.present(cartViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? ListCell else { return UITableViewCell() }
        guard let menu = menu else { return UITableViewCell() }
        cell.menuNameLabel.text = menu.name
        cell.menuPriceLabel.text = "₩\(menu.price.formattedWithSeparator)"
        cell.countLabel.text = "\(count)"
        let totalAmount = (menu.price) * count
        totalAmountLabel.text = "₩ \(totalAmount.formattedWithSeparator)"
        cell.menuPriceLabel.textColor = .systemOrange
        cell.menuPriceLabel.font = .systemFont(ofSize: 15, weight: .bold)
        
        cell.countStepper.tag = indexPath.row
        cell.countStepper.addTarget(self, action: #selector(stepperClicked), for: .valueChanged)
        cell.countStepper.backgroundColor = .systemYellow
        cell.countStepper.layer.cornerRadius = 8
        return cell
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuPriceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countStepper: UIStepper!
}

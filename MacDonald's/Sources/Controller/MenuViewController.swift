//
//  MenuViewController.swift
//  MacDonald's
//
//  Created by David Jang on 4/3/24.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var tableView = UITableView()
    
    var burgerItems: [MenuItem] = [baconCheeseBurger, cheeseBurger, doubleBaconBurger, tripleBurger, doubleBurger, singleBurger]
    var sideItems: [MenuItem] = [cheesepotato, chiliCheesePotato, chiliCheeseFries, friesSmall, friesMedium, friesLarge]
    var drinkItems: [MenuItem] = [coke, cokeZero, sprite, mountainDew, fanta]
    var saladItems: [MenuItem] = [avocadoChickenSalad, caesarChikenSalad]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "menuBackgroundColor")
        configureTableView()
        configureSegmentedControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = "MacDonald's"
    }
    
    // 세그먼트 설정
    func configureSegmentedControl() {
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.heightAnchor.constraint(equalToConstant: 40) // 세그먼트 높이
        ])
        segmentedControl.backgroundColor = .systemYellow
        segmentedControl.removeAllSegments() // 기존 세그먼트 지우기!
        segmentedControl.insertSegment(withTitle: "버거", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "사이드", at: 1, animated: false)
        segmentedControl.insertSegment(withTitle: "샐러드", at: 2, animated: false)
        segmentedControl.insertSegment(withTitle: "드링크", at: 3, animated: false)
        segmentedControl.selectedSegmentIndex = 0 // 첫 번째 세그먼트 선택
    }
    
    // 장바구니 버튼 이동 로직
    @IBAction func cartButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Cart", bundle: nil)
        guard let cartViewController = storyboard.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController else { return }
        cartViewController.modalPresentationStyle = .pageSheet
        present(cartViewController, animated: true)
    }
    
    // 테이블뷰 레이아웃
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 130
        tableView.backgroundColor = .clear
        
        tableView.register(MenuItemCell.self, forCellReuseIdentifier: "MenuItemCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // 세그먼트 탭하면 테이블뷰 다시 불러오기
    @IBAction func segmentedFunction(_ sender: Any) {
        tableView.reloadData()
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
            case 0: return burgerItems.count
            case 1: return sideItems.count
            case 2: return saladItems.count
            case 3: return drinkItems.count
            default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath) as? MenuItemCell else { return UITableViewCell() }
        let menuItem: MenuItem
        let index = indexPath.row
        switch segmentedControl.selectedSegmentIndex {
            case 0: menuItem = burgerItems[index]
            case 1: menuItem = sideItems[index]
            case 2: menuItem = saladItems[index]
            case 3: menuItem = drinkItems[index]
            default: fatalError("Unexpected Segment")
        }
        
        cell.setMenuItem(menuItem: menuItem)
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem: MenuItem
        let index = indexPath.row
        switch segmentedControl.selectedSegmentIndex {
            case 0: menuItem = burgerItems[index]
            case 1: menuItem = sideItems[index]
            case 2: menuItem = saladItems[index]
            case 3: menuItem = drinkItems[index]
            default: fatalError("Invalid segment index.")
        }
        
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        guard let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        detailViewController.menu = menuItem
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

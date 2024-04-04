//
//  MenuTableViewCell.swift
//  MacDon
//
//  Created by David Jang on 4/3/24.
//
import UIKit


class MenuItemCell: UITableViewCell {
    
    // UI 컴포넌트 부르기?
    let menuItemImageView = UIImageView()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(menuItemImageView)
        addSubview(nameLabel)
        addSubview(priceLabel)
        configureImageView()
        configureNameLabel()
        configurePriceLabel()
        setImageConstraints()
        setNameLabelConstraints()
        setPriceLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error: ")
    }
    
    // 셀 이미지 설정
    func configureImageView() {
        menuItemImageView.clipsToBounds = true
        menuItemImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // 셀 모델 이름 설정
    func configureNameLabel() {
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
        menuItemImageView.contentMode = .scaleAspectFit
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // 셀 가격 설정
    func configurePriceLabel() {
        priceLabel.numberOfLines = 1
        priceLabel.adjustsFontSizeToFitWidth = true
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // 이미지 오토레이아웃
    func setImageConstraints() {
        NSLayoutConstraint.activate([
            menuItemImageView.heightAnchor.constraint(equalToConstant: 130),
            menuItemImageView.widthAnchor.constraint(equalToConstant: 130),
            menuItemImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            menuItemImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        ])
    }
    
    // 모델 이름 오토레이아웃
    func setNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            nameLabel.leadingAnchor.constraint(equalTo: menuItemImageView.trailingAnchor, constant: 32)
        ])
    }
    
    // 가격 오토레이아웃
    func setPriceLabelConstraints() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ])
    }
    
    // 메뉴생성 및 가격표시 형식
    func setMenuItem(menuItem: MenuItem) {
        nameLabel.text = menuItem.name
        priceLabel.text = "\(menuItem.price.formattedWithSeparator)원"
        menuItemImageView.image = UIImage(named: menuItem.image)
    }
}

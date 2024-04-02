//
//  ViewController.swift
//  MacDonald's
//
//  Created by 정유진 on 2024/04/01.
//

import UIKit

class MenuViewController: UIViewController {

   
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    let tempCategoryArray = ["추천", "콤보", "버거", "사이드", "샐러드", "음료", "스크롤", "스크롤", "스크롤"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MenuVC - viewDidLoad() called")
        
        // 콜렉션 뷰에 대한 설정
        categoryCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
        // 사용할 컬렉션뷰 cell을 등록
        let CategoryCollectionViewCellNib = UINib(nibName: String(describing: CategoryCollectionViewCell.self), bundle: nil)
        
        // 가져온 닙파일로 콜렉션뷰에 cell로 등록한다
        self.categoryCollectionView.register(CategoryCollectionViewCellNib, forCellWithReuseIdentifier: String(describing: CategoryCollectionViewCell.self))
        
        // 콜렉션뷰의 콜렉션뷰 레이아웃을 설정한다. -> 컴포지셔널 레이아웃
        self.categoryCollectionView.collectionViewLayout = createCompositionalLayout()
        
    }


}
// MARK: - 콜렉션뷰 콤포지셔널 레이아웃 관련
extension MenuViewController {
    
    // 콤포지셔널 레이아웃 설정
    fileprivate func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        // 콤포지셔널 레이아웃 생성
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜플 (키: 값, 키: 값) 의 묶음으로 들어옴 반환 하는 것은 NSCollectionLayoutSection 콜렉션 레이아웃 섹션을 반환해야함
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템에 대한 사이즈(width, height) - absolute 는 고정값, estimated 는 추측, fraction 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40))
           
            // -> 가로 높이 1.0: 100퍼센트 02. or 1/3 가능
            
            // 위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // 아이템 간의 간격 설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 10)
           
            // 그룹사이즈
            let grouSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: itemSize.heightDimension)
            
            // 변경할 부분
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: grouSize, subitem: item, count: 5)
            
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            
            // 섹션에 대한 간격 설정
            section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 20, trailing: 10)
            
            return section
        }
        return layout
    
    }
}


// 콜렉션 뷰 데이터
extension MenuViewController: UICollectionViewDataSource {
    // 각 섹션에 들어가는 아이템 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tempCategoryArray.count
    }
    // 각 콜렉션뷰 셀에 대한 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCollectionViewCell.self), for: indexPath) as! CategoryCollectionViewCell
        
        cell.categoryName = self.tempCategoryArray[indexPath.item]
        
        return cell
    }
}
// 콜렉션 뷰 델리게이트
extension MenuViewController: UICollectionViewDelegate {
    
}


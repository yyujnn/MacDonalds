//
//  MenuItem.swift
//  MacDonalds
//
//  Created by David Jang on 4/2/24.
//

import Foundation


// 햄버거 메뉴
let baconCheeseBurger = MenuItem(name: "베이컨 치즈 버거", description: "신선한 영국산 소고기, 애플우드 훈제 베이컨, 아메리칸 치즈, 아삭한 양상추, 토마토, 하인즈 마요네즈까지! 베이컨 애호가라면 누구나 좋아하는 메뉴입니다!", price: 3700, image: "baconCheese", calories: 406, type: .burger)

let cheeseBurger = MenuItem(name: "치즈 버거", description: "신선한 영국산 소고기에 치즈, 피클, 양파, 토마토, 아삭한 양상추, 하인즈 케첩과 마요네즈를 넣은 버거!! 풍성한 맛을 합리적인 가격에 만나보세요!", price: 2800, image: "cheese", calories: 375, type: .burger)

let doubleBaconBurger = MenuItem(name: "더블 베이컨 버거", description: "신선한 영국산 소고기 0.2kg, 미국산 치즈, 바삭한 애플우드 훈제 베이컨 6조각, 하인즈 케첩과 마요네즈!! 육식주의자라면 이 메뉴가 딱입니다!", price: 6200, image: "doubleBacon", calories: 1010, type: .burger)

let tripleBurger = MenuItem(name: "트리플 버거", description: "신선한 영국산 소고기 113g, 미국산 치즈, 아삭한 양상추, 토마토, 피클, 하인즈 케첩과 마요네즈, 그리고 양파까지! 다양한 재료들을 구운 번과 함께 드세요. 양손을 모두 사용하세요!", price: 5400, image: "triple", calories: 1204, type: .burger)

let doubleBurger = MenuItem(name: "더블 버거", description: "신선한 영국산 소고기 0.2kg, 아메리칸 치즈, 아삭한 양상추, 토마토, 피클, 하인즈 케첩과 마요네즈, 그리고 양파까지! 이 모든 다양한 재료들을 구운 번과 함께 드세요. 고기는 듬뿍, 고기는 사랑이니까요~", price: 4800, image: "double", calories: 888, type: .burger)

let singleBurger = MenuItem(name: "싱글 버거", description: "신선한 영국산 소고기 113g, 미국산 치즈, 아삭한 양상추, 토마토, 피클, 하인즈 케첩과 마요네즈, 양파를 데이브의 방식대로 구운 번과 함께 드세요!", price: 3900, image: "single", calories: 524, type: .burger)


// 사이드 메뉴
let cheesepotato = MenuItem(name: "치즈 감자 베이크", description: "따뜻하고 폭신한 감자에 크리미한 치즈 소스와 슈레드 치즈를 얹은 요리. 치즈만큼 감자와 잘 어울리는 음식은 없으니까요!", price: 5400, image: "cheesepotato", calories: 342, type: .side)

let chiliCheesePotato = MenuItem(name: "칠리 치즈 감자 베이크", description: "따뜻하고 폭신한 감자에 시그니처 고기와 풍미 가득한 칠리, 크리미한 치즈 소스, 슈레드 치즈까지!! 당신의 최애 메뉴가 될 겁니다!", price: 5400, image: "chiliCheesePotato", calories: 428, type: .side)

let chiliCheeseFries = MenuItem(name: "칠리 치즈 감자튀김", description: "껍질을 벗기지 않은 자연산 천일염 감자튀김에 풍성한 칠리, 따뜻하고 크리미한 치즈 소스, 슈레드 체다 치즈를 추가했습니다. 쉽게 이길 수 없는 이 맛에 바로 사랑에 빠지실 겁니다!", price: 2800, image: "chiliCheeseFries", calories: 481, type: .side)

let friesSmall = MenuItem(name: "감자튀김 스몰", description: "껍질을 벗기지 않은 자연산 천일염 감자튀김이 따뜻하고 바삭하게 제공됩니다. 전 세계가 사랑하는 데에는 이유가 있습니다!", price: 2500, image: "friesSmall", calories: 176, type: .side)

let friesMedium = MenuItem(name: "감자튀김 미디움", description: "껍질을 벗기지 않은 자연산 천일염 감자튀김이 따뜻하고 바삭하게 제공됩니다. 전 세계가 사랑하는 데에는 이유가 있습니다!", price: 3000, image: "friesMedium", calories: 239, type: .side)

let friesLarge = MenuItem(name: "감자튀김 라지", description: "껍질을 벗기지 않은 자연산 천일염 감자튀김이 따뜻하고 바삭하게 제공됩니다. 전 세계가 사랑하는 데에는 이유가 있습니다!", price: 3500, image: "friesLarge", calories: 299, type: .side)


// 음료 메뉴
let coke = MenuItem(name: "콜라", price: 2000, image: "coke",calories: 152, type: .drink)
let cokeZero = MenuItem(name: "제로 콜라", price: 2000, image: "cokeZero",calories: 0, type: .drink)
let sprite = MenuItem(name: "스프라이트", price: 2000, image: "sprite",calories: 160, type: .drink)
let mountainDew = MenuItem(name: "마운틴듀", price: 2000, image: "mountainDew",calories: 168, type: .drink)
let fanta = MenuItem(name: "환타", price: 2000, image: "fanta",calories: 142, type: .drink)
let drPepper = MenuItem(name: "닥터 페퍼", price: 2000, image: "drPepper",calories: 148 ,type: .drink)


// 샐러드 매뉴
let avocadoChickenSalad = MenuItem(name: "아보카도 치킨 샐러드", description: "시그니처 양상추 블렌드, 체다 치즈, 다진 토마토, 시원하고 크리미한 아보카도, 애플우드 훈제 베이컨, 그릴에서 갓 구운 닭가슴살에 사우스웨스트 랜치 드레싱을 뿌려 매일 신선한 재료로 만듭니다! ", price: 15900, image: "avocadoChickenSalad", calories: 485, type: .salad)

let caesarChikenSalad = MenuItem(name: "시저 치킨 샐러드", description: "로메인 양상추, 구운 닭가슴살, 이탈리안 치즈, 크리미한 시저 드레싱으로 매일 신선하게 만들어집니다. 한 입만 먹어보면 로메인 그 이상의 맛을 느끼실 겁니다!", price: 14600, image: "caesarChikenSalad", calories: 481, type: .salad)


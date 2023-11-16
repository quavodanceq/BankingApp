//
//  ViewController.swift
//  Banking
//
//  Created by Куат Оралбеков on 14.11.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let cardView = CardView(card: CardModel(numbers: "1234 1234 5252 5252", ownerName: "Kuat Oralbekov"))
    
    private let totalSpentLabel = UILabel()
    
    private let totalSpentAmount = UILabel()
    
    private let spendingsView = SpendingsView()
    
    private let shoppingView = ShoppingView(str: "123")
    
    private let transportView = TransportView(str: "123")
    
    private let foodView = FoodView(str: "123")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(cardView)
        setupTotalSpentLabel()
        setupTotalSpentAmount()
        view.addSubview(shoppingView)
        view.addSubview(transportView)
        view.addSubview(foodView)
        setupConstraints()
    }
    
    private func setupTotalSpentLabel() {
        view.addSubview(totalSpentLabel)
        totalSpentLabel.textColor = .gray
        totalSpentLabel.text = "Total Spent"
        totalSpentLabel.font = UIFont(name: "Copperplate", size: 14)!
    }
    
    private func setupTotalSpentAmount() {
        view.addSubview(totalSpentAmount)
        totalSpentAmount.textColor = .white
        totalSpentAmount.text = "$1,520.00"
        totalSpentAmount.font = UIFont(name: "Copperplate", size: 14)!
    }
    
    private func setupConstraints() {
        cardView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(35)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.height).multipliedBy(0.4)
            make.height.equalTo(cardView.snp.width).dividedBy(1.7)
        }
        
        totalSpentLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
        
        totalSpentAmount.snp.makeConstraints { make in
            make.top.equalTo(totalSpentLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
        }
        
        shoppingView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(totalSpentAmount.snp.bottom).offset(10)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(shoppingView.snp.width).dividedBy(3)
        }
        
        transportView.snp.makeConstraints { make in
            make.leading.equalTo(shoppingView.snp.trailing)
            make.top.equalTo(totalSpentAmount.snp.bottom).offset(10)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(shoppingView.snp.width).dividedBy(3)
        }
        
        foodView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(shoppingView.snp.bottom)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(shoppingView.snp.width).dividedBy(3)

        }
        
        
    }


}


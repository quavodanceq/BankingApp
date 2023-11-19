//
//  ViewController.swift
//  Banking
//
//  Created by Куат Оралбеков on 14.11.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let cardView = CardView()
    
    private let totalSpentLabel = TotalSpentView()
    
    private let shoppingView = ShoppingView(str: "123")
    
    private let transportView = TransportView(str: "123")
    
    private let foodView = FoodView(str: "123")

    override func viewDidLoad() {
        super.viewDidLoad()
        FirestoreManager.shared.fetchCardInformation { card, error in
            if card != nil {
                self.cardView.changeCardOwner(name: card?.ownerName ?? "")
                self.cardView.changeCardNumber(number: card?.numbers ?? "")
            }
            
        }
        
        fetchSpendingInformation()
        view.backgroundColor = .black
        view.addSubview(cardView)
        view.addSubview(totalSpentLabel)
        view.addSubview(shoppingView)
        view.addSubview(transportView)
        view.addSubview(foodView)
        setupConstraints()
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
        
        shoppingView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(totalSpentLabel.snp.bottom).offset(25)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(shoppingView.snp.width).dividedBy(3)
        }
        
        transportView.snp.makeConstraints { make in
            make.leading.equalTo(shoppingView.snp.trailing)
            make.top.equalTo(totalSpentLabel.snp.bottom).offset(10)
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
    
    func fetchSpendingInformation() {
        FirestoreManager.shared.fetchSpendingsInformation { spendings, error in
            if spendings != nil {
                self.totalSpentLabel.changeAmount(sum: spendings?.total ?? 0)
                self.shoppingView.changeAmount(sum: spendings?.shopping ?? 0)
                self.transportView.changeAmount(sum: spendings?.transport ?? 0)
                self.foodView.changeAmount(sum: spendings?.food ?? 0)
            }
        }
    }


}


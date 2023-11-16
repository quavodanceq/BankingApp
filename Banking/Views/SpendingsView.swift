//
//  SpendingsView.swift
//  Banking
//
//  Created by Куат Оралбеков on 16.11.2023.
//

import Foundation
import UIKit
import SnapKit

class SpendingsView: UIScrollView {
    
    private let stackView = UIStackView()
    
    private let shoppingView = ShoppingView(str: "123")
    
    private let transportView = TransportView(str: "123")
    
    private let foodView = FoodView(str: "123")
    
    private lazy var spendings = [shoppingView, transportView,foodView]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setupConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        showsHorizontalScrollIndicator = false
        isScrollEnabled = true
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.setContentHuggingPriority(.required, for: .horizontal)
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.addArrangedSubview(shoppingView)
        stackView.addArrangedSubview(transportView)
        stackView.addArrangedSubview(foodView)
        addSubview(stackView)
    }
    
    private func setupConstaints() {

        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalToSuperview()
        }
        

        
        for spending in spendings {
            spending.snp.makeConstraints { make in
                make.height.equalToSuperview()
                
            }
        }
        
    }
    
}

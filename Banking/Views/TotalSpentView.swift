//
//  TotalSpentView.swift
//  Banking
//
//  Created by Куат Оралбеков on 19.11.2023.
//

import Foundation
import UIKit

class TotalSpentView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private let totalSpentLabel = UILabel()
    
    private let totalSpentAmount = UILabel()
    
    private func setup() {
        setupTotalSpentLabel()
        setupTotalSpentAmount()
        setupConstraints()
    }
    
    
    private func setupTotalSpentLabel() {
        addSubview(totalSpentLabel)
        totalSpentLabel.textColor = .gray
        totalSpentLabel.text = "Total Spent"
        totalSpentLabel.font = UIFont(name: "Copperplate", size: 14)!
    }
    
    private func setupTotalSpentAmount() {
        addSubview(totalSpentAmount)
        totalSpentAmount.textColor = .white
        totalSpentAmount.font = UIFont(name: "Copperplate", size: 14)!
    }
    
    private func setupConstraints() {
        totalSpentLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        totalSpentAmount.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview()
        }
    }
    
    func changeAmount(sum: Int) {
        totalSpentAmount.text = "$\(sum).00"
    }
    
}

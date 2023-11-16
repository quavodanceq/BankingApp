//
//  TransportView.swift
//  Banking
//
//  Created by Куат Оралбеков on 16.11.2023.
//

import Foundation
import UIKit
import SnapKit

class TransportView: UIView {
    
    private let imageView = UIImageView()
    
    private let nameLabel = UILabel()
    
    private let amountLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(str: String) {
        self.init()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupImageView()
        setupShoppingLabel()
        setupAmountLabel()
        setupConstraints()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.image = UIImage(systemName: "car")
        imageView.tintColor = .white
    }
    
    private func setupShoppingLabel() {
        addSubview(nameLabel)
        nameLabel.textColor = .white
        nameLabel.font = UIFont(name: "Copperplate", size: 18)!
        nameLabel.text = "Transport"
    }

    
    private func setupAmountLabel() {
        addSubview(amountLabel)
        amountLabel.textColor = .gray
        amountLabel.font = UIFont(name: "Copperplate", size: 18)!
        amountLabel.text = "$300.00"
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.height.equalToSuperview().multipliedBy(0.4)
            make.width.equalTo(imageView.snp.height)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-10)
            make.leading.equalTo(imageView.snp.trailing).offset(10)
        }
        
        amountLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(10)
            make.leading.equalTo(imageView.snp.trailing).offset(10)
        }
    }

    
}

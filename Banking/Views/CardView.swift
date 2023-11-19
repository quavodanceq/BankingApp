//
//  CardView.swift
//  Banking
//
//  Created by Куат Оралбеков on 14.11.2023.
//

import Foundation
import UIKit

class CardView: UIView {
    
    private let numbersLabel = UILabel()
    
    private let cardHolderLabel = UILabel()
    
    private let nameLabel = UILabel()
    
    private let providerImage = UIImageView(image: UIImage(named: "mastedcard"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.transform = CGAffineTransformMakeRotation(90 * M_PI/180)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .customPink
        self.layer.cornerCurve = .continuous
        self.layer.cornerRadius = 20
        setupNumbersLabel()
        setupCardHolderLabel()
        setupNameLabel()
        setupImageView()
        setupConstraints()
    }
    
    private func setupNumbersLabel() {
        addSubview(numbersLabel)
        numbersLabel.textColor = .black
        numbersLabel.font = UIFont(name: "Copperplate", size: 18)!
    }
    
    private func setupCardHolderLabel() {
        addSubview(cardHolderLabel)
        cardHolderLabel.text = "CARD HOLDER"
        cardHolderLabel.textColor = .black
        cardHolderLabel.font = UIFont(name: "Copperplate", size: 10)!
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.textColor = .black
        nameLabel.font = UIFont(name: "Copperplate", size: 16)!
    }
    
    private func setupImageView() {
        addSubview(providerImage)
    }
    
    private func setupConstraints() {
        
        numbersLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview().offset(-20)
        }
        
        cardHolderLabel.snp.makeConstraints { make in
            make.top.equalTo(numbersLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(cardHolderLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        providerImage.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.30)
            make.width.equalTo(providerImage.snp.height)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-30)
        }
        
    }
    
    func changeCardOwner(name: String) {
        nameLabel.text = name
    }
    
    func changeCardNumber(number: String) {
        numbersLabel.text = number
    }
    
}

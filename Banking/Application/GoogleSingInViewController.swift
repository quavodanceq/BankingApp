//
//  GoogleSingInViewController.swift
//  Banking
//
//  Created by Куат Оралбеков on 17.11.2023.
//

import Foundation
import UIKit
import GoogleSignIn
import GoogleSignInSwift
import SnapKit
import FirebaseAuth

class GSignInViewController: UIViewController {
    
    private let button = GIDSignInButton()
    
    override func viewDidLoad() {
        
        view.addSubview(button)
        
        setupButton()
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
        }
    }
    
    private func setupButton() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        AuthManager.shared.login(viewController: self) { result in
            switch result {
                
            case .success:
                FirestoreManager.shared.isNewUser { isNew in
                    if isNew {
                        FirestoreManager.shared.createFirebaseForNewUser()
                        TransitionManager.shared.present(viewController: ViewController())
                        
                    } else {
                        TransitionManager.shared.present(viewController: ViewController())
                    }
                }
            case .failure:
                print("failure")
            }
        }
    }
    
}

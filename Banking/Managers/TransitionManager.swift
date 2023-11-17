//
//  TransitionManager.swift
//  Banking
//
//  Created by Куат Оралбеков on 17.11.2023.
//

import Foundation
import UIKit

class TransitionManager {
    
    private init() { }
    
    static let shared = TransitionManager()
    
    func present(viewController: UIViewController) {
        
        if let window = UIApplication.shared.keyWindow {
            
            var snapShot = UIView()
            
            let destinationVC = UINavigationController(rootViewController: viewController)
            if let realSnapShot = window.snapshotView(afterScreenUpdates: true) {
                snapShot = realSnapShot
            }
            destinationVC.view.addSubview(snapShot)
            window.rootViewController = destinationVC
            window.makeKeyAndVisible()
            
            UIView.transition(
                with: window,
                duration: 0.5,
                options: .transitionCrossDissolve,
                animations: {
                    snapShot.transform = CGAffineTransform(translationX: 0, y: snapShot.frame.height)
                },
                completion: { status in
                    snapShot.removeFromSuperview()
                }
            )
        }
    }
    
}

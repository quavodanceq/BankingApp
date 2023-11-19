//
//  FirestoreManager.swift
//  Banking
//
//  Created by Куат Оралбеков on 17.11.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

class FirestoreManager {
    
    private let userCollection = Firestore.firestore().collection("users")
    
    private init() { }
    
    static let shared = FirestoreManager()
    
    func isNewUser(completion: @escaping (Bool) -> Void) {
        userCollection.document(Auth.auth().currentUser!.uid).getDocument { snap, error in
            if snap?.data() != nil {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    func createFirebaseForNewUser() {
        userCollection.document(Auth.auth().currentUser!.uid).setData(["OwnerName" : Auth.auth().currentUser!.displayName, "cardNumber" : "4400 4301 \(Int.random(in: 1000..<9999)) \(Int.random(in: 1000..<9999))", "totalSpent" : 0, "spentOnShopping" : 0, "spentOnTransport" : 0, "spentOnFood" : 0])
        
    }
    
    func fetchCardInformation(completion: @escaping (CardModel?, Error?) -> Void) {
        
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        userCollection.document(userId).getDocument { document, error in
            if let document = document, document.exists {
                let data = document.data()
                completion(CardModel(numbers: data?["cardNumber"] as! String, ownerName: data?["OwnerName"] as! String), nil)
              } else {
                completion(nil, error)
              }
        }
    }
    
    func fetchSpendingsInformation(completion: @escaping (Spendings?, Error?) -> Void) {
        
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        userCollection.document(userId).getDocument { document, error in
            if let document = document, document.exists {
                let data = document.data()
                completion(Spendings(shopping: data?["spentOnShopping"] as! Int, transport: data?["spentOnTransport"] as! Int, food: data?["spentOnFood"] as! Int, total: data?["totalSpent"] as! Int), nil)
              } else {
                completion(nil, error)
              }
        }
    }
    
}

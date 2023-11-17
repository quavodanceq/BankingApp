//
//  FirestoreManager.swift
//  Banking
//
//  Created by Куат Оралбеков on 17.11.2023.
//

import Foundation
import FirebaseFirestore
import Firebase
import FirebaseAuth

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
    
}

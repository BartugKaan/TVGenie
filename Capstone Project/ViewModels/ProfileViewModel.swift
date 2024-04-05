//
//  ProfileViewModel.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 14.03.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    @Published var user: User? = nil
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId).getDocument { [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else {
                    return
                }
                DispatchQueue.main.async {
                    self?.user = User(
                        id: data ["id"] as? String ?? "",
                        name: data["name"] as? String ?? "",
                        email: data["email"] as? String ?? "",
                        joined: data["joined"] as? TimeInterval ?? 0)
                }
            }
    }
    
    func logout(){
        do {
            try Auth.auth().signOut()
        }
        catch{
            print(error)
        }
    }
    
    func deleteAccount() {
        let currentUser = Auth.auth().currentUser
        
        currentUser?.delete(completion: { error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            }
            else {
                self.errorMessage = "Your Account is deleted."
            }
        })
        
    }
    
    
}

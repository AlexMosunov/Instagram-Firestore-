//
//  UserService.swift
//  InstagramFirestore
//
//  Created by Alex Mosunov on 14.12.2021.
//

import Firebase

struct UserService {
    
    static func fetchUser(completion: @escaping (User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let data = snapshot?.data() else { return }
            let user = User(dictionary: data)
            completion(user)
        }
    }
    
    
    static func fetchUsers(completion: @escaping ([User]) -> Void) {
        COLLECTION_USERS.getDocuments { snapshot, error in
            guard let snapshot = snapshot else { return }
            
            snapshot.documents.forEach { document in
                print("DEBUG: Doc in service - \(document.data())")
            }
            
            let users = snapshot.documents.map { User(dictionary: $0.data()) }
            completion(users)
        }
    }
    
}

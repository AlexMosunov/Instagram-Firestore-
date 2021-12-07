//
//  AuthService.swift
//  InstagramFirestore
//
//  Created by Alex Mosunov on 07.12.2021.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let image: UIImage
}

struct AuthService {
    static func registerUser(withCredential credentials: AuthCredentials) {
        print("DEBUG: Credentials are \(credentials)")
    }
}

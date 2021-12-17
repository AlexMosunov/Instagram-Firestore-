//
//  ProfileHeaderViewModel.swift
//  InstagramFirestore
//
//  Created by Alex Mosunov on 14.12.2021.
//

import Foundation


struct ProfileHeaderViewModel {
    let user: User
    
    var fullname: String {
        return user.fullname
    }
    
    var profilerImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    init(user: User) {
        self.user = user
    }
}

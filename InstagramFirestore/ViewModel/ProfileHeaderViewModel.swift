//
//  ProfileHeaderViewModel.swift
//  InstagramFirestore
//
//  Created by Alex Mosunov on 14.12.2021.
//
 
import UIKit


struct ProfileHeaderViewModel {
    let user: User
    
    var fullname: String {
        return user.fullname
    }
    
    var profilerImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    var followButtonText: String {
        if user.isCurrentUser {
            return "Edit Profile"
        }
        
        return user.isFollowed ? "Following" : "Follow"
    }
    
    var followButtonBackgroundColor: UIColor {
        if user.isCurrentUser {
            return .white
        } else if user.isFollowed {
            return .white
        } else {
            return .systemBlue
        }
    }
    
    var followButtonTextColor: UIColor {
        if user.isCurrentUser {
            return .black
        } else if user.isFollowed {
            return .black
        } else {
            return .white
        }
    }
    
    var numberOfFollowers: NSAttributedString {
        return attributedStatText(value: user.stats.followers, label: "Followers")
    }
    
    var numberOfFollowing: NSAttributedString {
        return attributedStatText(value: user.stats.following, label: "Following")
    }
    
    var numberOfPosts: NSAttributedString {
        return attributedStatText(value: 9, label: "posts")
    }
    
    init(user: User) {
        self.user = user
    }
    
    func attributedStatText(value: Int, label: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "\(value)\n",
                                                       attributes: [.font : UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "\(label)",
                                                 attributes: [.font : UIFont.systemFont(ofSize: 14),
                                                              .foregroundColor : UIColor.lightGray]))
        return attributedText
    }
}

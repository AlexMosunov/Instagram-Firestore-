//
//  ProfileCell.swift
//  InstagramFirestore
//
//  Created by Alex Mosunov on 14.12.2021.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    // MARK: Properties
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "venom-7")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    
    //MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        
        addSubview(postImageView)
        postImageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

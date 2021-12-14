//
//  ProfileHeader+Constraints.swift
//  InstagramFirestore
//
//  Created by Alex Mosunov on 14.12.2021.
//


import UIKit

// MARK: Constraints

extension ProfileHeader {
    
    func setConstraints() {
        let padding                 : CGFloat = 12
        let profileImageViewWidth   : CGFloat = 80
        let statsStackViewHeight    : CGFloat = 50
        let bottomStackViewHeight   : CGFloat = 50
        let dividerHeight           : CGFloat = 0.5
        
        setProfileImageViewConstraints(with: padding, imageWidth: profileImageViewWidth)
        setNameLabelConstraints(with: padding)
        setEditProfileFollowButtonConstraints(with: padding)
        setStatsStackViewConstraints(with: padding, height: statsStackViewHeight)
        setBottomStackViewConstraints(stackViewHeight: bottomStackViewHeight, dividerHeight: dividerHeight)
    }
    
    private func setProfileImageViewConstraints(with padding: CGFloat, imageWidth: CGFloat) {
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor,
                                left: leftAnchor,
                                paddingTop: padding + 4,
                                paddingLeft: padding)
        
        profileImageView.setDimensions(height: imageWidth,
                                       width: imageWidth)
        
        profileImageView.layer.cornerRadius = imageWidth / 2
    }
    
    private func setNameLabelConstraints(with padding: CGFloat) {
        addSubview(nameLabel)
        nameLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, paddingTop: padding, paddingLeft: padding)
    }
    
    private func setEditProfileFollowButtonConstraints(with padding: CGFloat) {
        addSubview(editProfileFollowButton)
        editProfileFollowButton.anchor(top: nameLabel.bottomAnchor,
                                       left: leftAnchor,
                                       right: rightAnchor,
                                       paddingTop: padding + 4,
                                       paddingLeft: padding * 2,
                                       paddingRight: padding * 2)
    }
    
    private func setStatsStackViewConstraints(with padding: CGFloat, height: CGFloat) {
        let stackView = UIStackView(arrangedSubviews: [postsLabel, followersLabel, followingLabel])
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.centerY(inView: profileImageView)
        stackView.anchor(left: profileImageView.rightAnchor,
                         right: rightAnchor,
                         paddingLeft: padding,
                         paddingRight: padding,
                         height: height)
    }
    
    private func setBottomStackViewConstraints(stackViewHeight: CGFloat,
                                               dividerHeight: CGFloat) {
        let topDivider = UIView()
        topDivider.backgroundColor = .lightGray
        
        let bottomDivider = UIView()
        bottomDivider.backgroundColor = .lightGray
        
        let buttonStack = UIStackView(arrangedSubviews: [gridButton, listButton, bookmarkButton])
        buttonStack.distribution = .fillEqually
        
        addSubview(buttonStack)
        addSubview(topDivider)
        addSubview(bottomDivider)
        
        buttonStack.anchor( left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: stackViewHeight)
        
        topDivider.anchor(top: buttonStack.topAnchor, left: leftAnchor, right: rightAnchor, height: dividerHeight)
        
        bottomDivider.anchor(top: buttonStack.bottomAnchor, left: leftAnchor, right: rightAnchor, height: dividerHeight)
    }
    
}

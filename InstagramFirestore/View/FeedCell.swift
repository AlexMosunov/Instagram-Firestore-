//
//  FeedCell.swift
//  InstagramFirestore
//
//  Created by Alex Mosunov on 16.11.2021.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    // MARK: Properties
    
    var viewModel: PostViewModel? {
        didSet { configure() }
    }
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    private lazy var usernameButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        btn.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return btn
    }()
    
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named: "venom-7")
        return iv
    }()
    
    private lazy var likeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "like_unselected"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    private lazy var commentButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "comment"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    private lazy var shareButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "send2"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 days ago"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor,
                                paddingTop: 12, paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2
        
        addSubview(usernameButton)
        usernameButton.centerY(inView: profileImageView,
                               leftAnchor: profileImageView.rightAnchor,
                               paddingLeft: 8)
        
        addSubview(postImageView)
        postImageView.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8)
        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
        configureActionButtons()
        
        addSubview(likesLabel)
        likesLabel.anchor(top: likeButton.bottomAnchor, left: leftAnchor, paddingTop: -4, paddingLeft: 8)
        
        addSubview(captionLabel)
        captionLabel.anchor(top: likesLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        
        addSubview(postTimeLabel)
        postTimeLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Actions
    
    @objc func didTapUsername() {
        
    }
    
    // MARK: Helpers
    
    func configure() {
        guard let viewModel = viewModel else {
            return
        }
        captionLabel.text = viewModel.caption
        postImageView.sd_setImage(with: viewModel.imageUrl)
        
        profileImageView.sd_setImage(with: viewModel.userProfileImageUrl)
        usernameButton.setTitle(viewModel.username, for: .normal)
        
        likesLabel.text = viewModel.likeLabelText
    }
    
    func configureActionButtons() {
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: postImageView.bottomAnchor, width: 120, height: 50)
    }
}

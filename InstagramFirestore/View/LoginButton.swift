//
//  LoginButton.swift
//  InstagramFirestore
//
//  Created by Alex Mosunov on 16.11.2021.
//

import UIKit

class LoginButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(UIColor(white: 1, alpha: 0.67), for: .normal)
        backgroundColor = .systemIndigo.withAlphaComponent(0.75)
        layer.cornerRadius = 5
        setHeight(50)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        isEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

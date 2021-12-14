//
//  CustomTextField.swift
//  InstagramFirestore
//
//  Created by Alex Mosunov on 16.11.2021.
//

import UIKit

class CustomTextField: UITextField {
    
    init(placeholer: String) {
        super.init(frame: .zero)
        
        let spacer = UIView()
        spacer.setDimensions(height: 50, width: 12)
        leftView = spacer
        leftViewMode = .always
        borderStyle = .none
        textColor = .white
        keyboardAppearance = .dark
        autocorrectionType = .no
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        setHeight(50)
        
        attributedPlaceholder = NSAttributedString(string: placeholer, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

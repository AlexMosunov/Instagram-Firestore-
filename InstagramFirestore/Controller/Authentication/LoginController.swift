//
//  LoginController.swift
//  InstagramFirestore
//
//  Created by Alex Mosunov on 16.11.2021.
//

import UIKit

class LoginController: UIViewController {
    
    //MARK: Properties
    
    private var viewModel = LoginViewModel()
    
    
    private let iconImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Instagram_logo_white"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let emailTextField: CustomTextField = {
        let tf = CustomTextField(placeholer: "Email")
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    private let passwordTextField: CustomTextField = {
        let tf = CustomTextField(placeholer: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let loginButton = LoginButton(title: "Log In")
    
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.attributedTitle(firstPart: "Forgot your password?", secondPart: "Get help signing in.")
        
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.attributedTitle(firstPart: "Don't have an account?", secondPart: "Sign Up")
        
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNotificationObservers()
    }
    
    // MARK: Actions
    
    @objc func handleShowSignUp() {
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: Helpers
    
    func configureUI() {
        configureGradientLayer()
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField,
                                                       loginButton, forgotPasswordButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                         paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 8)
    }
    
    func configureNotificationObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    
    
    @objc func textDidChange(sender: UITextField) {
        switch sender {
        case emailTextField:
            viewModel.email = sender.text
        case passwordTextField:
            viewModel.password = sender.text
        default:
            return
        }
        
        updateForm()
    }
}


// MARK: FormViewModel

extension LoginController: FormViewModel {
    func updateForm() {
        loginButton.backgroundColor = viewModel.buttonBackgroundColor
        loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        loginButton.isEnabled = viewModel.formIsValid
        print("loginButton.isEnabled - \(loginButton.isEnabled)")
    }
}






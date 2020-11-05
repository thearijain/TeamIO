//
//  LoginScreenView.swift
//  TeamIO
//
//  Created by Ari Jain on 10/12/20.
//

import Foundation
import UIKit

class LoginScreenView: UIView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }
    
    func sharedInit() {
        overrideUserInterfaceStyle = .light
    }
    
    override func layoutSubviews() {
        //add all of the views
        addSubview(backgroundImage)
        addSubview(skipLoginButton)
        addSubview(orLabel)
        addSubview(signUpButton)
        addSubview(dontHaveAccountLabel)
        addSubview(logo)
        addSubview(usernameTextfield)
        addSubview(passwordTextField)
        addSubview(continueArrow)
        addSubview(forgotPasswordButton)
        
        //set all of the constraints
        setupAllConstraints()
    }
    
    //MARK: Creating all the views    
    let backgroundImage: UIImageView = {
        let image = UIImage(named: "loginbackgroundgradient")
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.setImage(UIImage(named:"forgotpasswordbutton"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    let usernameTextfield: TextFieldWithPadding = {
        let sampleTextField =  TextFieldWithPadding()
        sampleTextField.placeholder = "username"
        sampleTextField.font = UIFont.systemFont(ofSize: 15)
        sampleTextField.font = UIFont(name: "DIN Alternate", size: 12)
        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = .done
        sampleTextField.layer.cornerRadius = 15
        sampleTextField.clipsToBounds = true
        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return sampleTextField
    }()
    
    let passwordTextField: TextFieldWithPadding = {
        let sampleTextField = TextFieldWithPadding()
        sampleTextField.placeholder = "password"
        sampleTextField.font = UIFont.systemFont(ofSize: 15)
        sampleTextField.font = UIFont(name: "DIN Alternate", size: 12)
        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = .done
        sampleTextField.layer.cornerRadius = 15
        sampleTextField.clipsToBounds = true
        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return sampleTextField
    }()
    
    let logo: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.font = UIFont(name: "Avenir Next", size: 50)
        label.text = "iO"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let skipLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.clipsToBounds = true
        button.backgroundColor = hexStringToUIColor(hex: "#1D2EB2")
        button.layer.cornerRadius = 10
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont(name: "DIN Alternate", size: 22)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let orLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.font = UIFont(name: "DIN Alternate", size: 20)
        label.text = "or"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let dontHaveAccountLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.font = UIFont(name: "DIN Alternate", size: 20)
        label.text = "Don't have an account?"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.clipsToBounds = true
        button.backgroundColor = hexStringToUIColor(hex: "#1D2EB2")
        button.layer.cornerRadius = 10
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont(name: "DIN Alternate", size: 22)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let continueArrow: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.setImage(UIImage(named:"loginscreenarrow"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        return button

    }()
    
    //MARK: Setting up constraints
    func setupAllConstraints() {
        setupBackgroundImageConstraints()
        setupSkipLoginButtonConstraints()
        setuporLabelConstraints()
        setupSignUpButtonConstraints()
        setupDontHaveAccountLabel()
        setupLogoConstraints()
        setupUsernameTextFieldConstraints()
        setupPasswordTextFieldConstraints()
        setupContinueArrowConstraints()
        setupForgotPasswordButtonConstraints()
    }
    
    func setupBackgroundImageConstraints() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
    }
    
    func setupForgotPasswordButtonConstraints() {
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 20),
            forgotPasswordButton.widthAnchor.constraint(equalToConstant: 94),
            forgotPasswordButton.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor, constant: 4),
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15)
        ])
    }
    
    func setupContinueArrowConstraints() {
        continueArrow.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            continueArrow.heightAnchor.constraint(equalToConstant: 24.15),
            continueArrow.widthAnchor.constraint(equalToConstant: 28.98),
            continueArrow.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25),
            continueArrow.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40)
        ])
    }
    
    func setupPasswordTextFieldConstraints() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextfield.bottomAnchor, constant: 25),
            passwordTextField.heightAnchor.constraint(equalToConstant: 47),
        ])
        addConstraintsWithFormat(format: "H:|-33-[v0]-33-|", views: passwordTextField)
    }
    
    func setupUsernameTextFieldConstraints() {
        usernameTextfield.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameTextfield.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 41),
            usernameTextfield.heightAnchor.constraint(equalToConstant: 47),
            usernameTextfield.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        addConstraintsWithFormat(format: "H:|-33-[v0]-33-|", views: usernameTextfield)
    }
    
    func setupLogoConstraints() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 97),
            logo.heightAnchor.constraint(equalToConstant: 65),
            logo.widthAnchor.constraint(equalToConstant: self.frame.width),
        ])
    }
    
    func setupDontHaveAccountLabel() {
        dontHaveAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dontHaveAccountLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dontHaveAccountLabel.heightAnchor.constraint(equalToConstant: 21),
            dontHaveAccountLabel.widthAnchor.constraint(equalToConstant: self.frame.width),
            dontHaveAccountLabel.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -18)
        ])
    }
    
    func setuporLabelConstraints() {
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            orLabel.heightAnchor.constraint(equalToConstant: 25),
            orLabel.bottomAnchor.constraint(equalTo: skipLoginButton.topAnchor, constant: -24),
            orLabel.widthAnchor.constraint(equalToConstant: 19)
        ])
    }
    
    func setupSignUpButtonConstraints() {
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 55),
            signUpButton.widthAnchor.constraint(equalToConstant: 350),
            signUpButton.bottomAnchor.constraint(equalTo: orLabel.topAnchor, constant: -18)
        ])
    }
    
    func setupSkipLoginButtonConstraints() {
        skipLoginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skipLoginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            skipLoginButton.heightAnchor.constraint(equalToConstant: 55),
            skipLoginButton.widthAnchor.constraint(equalToConstant: 350),
            skipLoginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -92)
        ])
    }
}

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 0,
        left: 10,
        bottom: 0,
        right: 10
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}

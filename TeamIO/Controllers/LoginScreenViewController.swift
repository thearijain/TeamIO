//
//  LoginScreenViewController.swift
//  TeamIO
//
//  Created by Ari Jain on 10/12/20.
//

import UIKit
import Foundation

class LoginScreenViewController: UIViewController, UITextFieldDelegate {

    let loginScreenView = LoginScreenView()
    
    override func loadView() {
        view = loginScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonActions()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // Sets status bar color
    override var preferredStatusBarStyle: UIStatusBarStyle {
         return .lightContent
    }
    
    func setupButtonActions() {
        loginScreenView.passwordTextField.delegate = self
        loginScreenView.usernameTextfield.delegate = self

        loginScreenView.skipLoginButton.addTarget(self, action: #selector(login(sender:)), for: .touchUpInside)
        loginScreenView.continueArrow.addTarget(self, action: #selector(continueArrow(sender:)), for: .touchUpInside)
        loginScreenView.forgotPasswordButton.addTarget(self, action: #selector(forgotPassword(sender:)), for: .touchUpInside)
        loginScreenView.signUpButton.addTarget(self, action: #selector(signUp(sender:)), for: .touchUpInside)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
        
    @objc func login(sender: UIButton!) {
        print("login")

        let tabBarController = configuredTabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true, completion: nil)
    }
    
    @objc func continueArrow(sender: UIButton!) {
        print("continue arrow pressed")
    }
    
    @objc func forgotPassword(sender: UIButton!) {
        print("forgot password button pressed")
    }
    
    @objc func signUp(sender: UIButton!) {
        let tabBarController = configuredTabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true, completion: nil)
        print("sign up button pressed")
    }
    
    private func configuredTabBarController() -> UITabBarController {
        
        let tabBarController = UITabBarController()
        
        let homeController = UINavigationController(rootViewController: HomeScreenViewController())
        homeController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        let cameraViewController = ForumScreenController()
        cameraViewController.tabBarItem = UITabBarItem(
            title: "Connect",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fillmes")
        )
        
        tabBarController.viewControllers = [homeController, cameraViewController]
        tabBarController.tabBar.tintColor = .label
        
        return tabBarController
    }
    
}


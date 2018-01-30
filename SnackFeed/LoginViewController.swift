//
//  LoginViewController.swift
//  SnackFeed
//
//  Created by Heather Mason on 1/25/18.
//  Copyright © 2018 HeatherMasonDev. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    var email = ""
    var password = ""
    
    let logo: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.image = #imageLiteral(resourceName: "icon_80")
        return image
    }()
    
    let emailField: UITextField = {
        let textfield = UITextField()
        textfield.clipsToBounds = true
        textfield.backgroundColor = .lightGray
        textfield.layer.cornerRadius = 10
        textfield.placeholder = "Email"
        textfield.textColor = .black
        textfield.keyboardType = .emailAddress
        return textfield
    }()
    
    let passwordField: UITextField = {
        let textfield = UITextField()
        textfield.clipsToBounds = true
        textfield.backgroundColor = .lightGray
        textfield.layer.cornerRadius = 10
        textfield.placeholder = "Password"
        textfield.textColor = .black
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.backgroundColor = UIColor.sfYellow
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log In", for: .normal)
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SnackFeed"
        view.backgroundColor = .white
        self.hideKeyboardWhenTapped()
        
        view.addSubview(logo)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        
        installConstraints()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func installConstraints() {
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.widthAnchor.constraint(equalToConstant: 80).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 80).isActive = true
        logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (view.frame.size.width / 2) - 40).isActive = true
        logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        emailField.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 40).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    @objc func signIn() {
        if let emailText = emailField.text {
            if emailText.isEmpty {
                emailField.becomeFirstResponder()
                return
            }
            email = emailText
        }
        
        if let passwordText = passwordField.text {
            if passwordText.isEmpty {
                passwordField.becomeFirstResponder()
                return
            }
            password = passwordText
        }
        
        if (emailField.text?.isEmpty)! || (passwordField.text?.isEmpty)! {
            print("Email and password are required")
        } else {
          
            print("Learn how to authenticate using Parse")
        }
    }
}


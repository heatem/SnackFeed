//
//  AddCommentView.swift
//  SnackFeed
//
//  Created by Heather Mason on 1/11/18.
//  Copyright © 2018 HeatherMasonDev. All rights reserved.
//

import UIKit

class AddCommentView: UIView, UITextFieldDelegate {
    // textfield
    let commentTextField: UITextField = {
        let textfield = UITextField()
        textfield.clipsToBounds = true
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 10
        textfield.placeholder = " Say thanks!"
        textfield.textColor = .darkGray
        return textfield
    }()
    
    // post button
    let postCommentButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.yellow, for: .normal)
        button.setTitle("Post", for: .normal)
        return button
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        addSubview(commentTextField)
        addSubview(postCommentButton)
        
        installConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installConstraints() {
        
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        commentTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        commentTextField.trailingAnchor.constraint(equalTo: postCommentButton.leadingAnchor, constant: -10).isActive = true
        commentTextField.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        commentTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        postCommentButton.translatesAutoresizingMaskIntoConstraints = false
        postCommentButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        postCommentButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        postCommentButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        postCommentButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        postCommentButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }

}

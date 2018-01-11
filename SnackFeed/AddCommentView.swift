//
//  AddCommentView.swift
//  SnackFeed
//
//  Created by Heather Mason on 1/11/18.
//  Copyright © 2018 HeatherMasonDev. All rights reserved.
//

import UIKit

class AddCommentView: UIView {
    
    // textfield
    let commentTextField: UITextField = {
        let textfield = UITextField(frame: CGRect(x: 10, y: 10, width: 300, height: 40))
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
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(commentTextField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installConstraints() {
        
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        commentTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        commentTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        commentTextField.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        commentTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        commentTextField.contentMode = .scaleAspectFill
        
        
    }

}

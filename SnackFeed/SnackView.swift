//
//  SnackView.swift
//  SnackFeed
//
//  Created by Heather Mason on 11/26/17.
//  Copyright © 2017 HeatherMasonDev. All rights reserved.
//

import UIKit
import QuartzCore

// create the header data for the SnackViewController tableview
class SnackView: UIView {

    let snackImageView: UIImageView = {
        let snackImage = UIImageView()
        snackImage.clipsToBounds = true
        snackImage.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
        snackImage.contentMode = .scaleAspectFill
        return snackImage
    }()

    // time label
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 20)
        return label
    }()

    // heart button
    let reactionButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = 20
        button.setTitleColor(UIColor.red, for: .normal)
        button.titleLabel?.font = UIFont(name: "SnackFeed", size: 22)
        button.setTitle("h", for: .normal)
        return button
    }()

    // title
    let snackItemLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 3
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 34)
        label.text = "A Delicious Snack"
        return label
    }()

    //  user image
    let userImageView: UIImageView = {
        let userImage = UIImageView()
        userImage.clipsToBounds = true
        userImage.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        userImage.layer.cornerRadius = 20
        return userImage
    }()

    // username
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "username"
        return label
    }()

    //     comment count
    let commentCountLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    // comment icon
    let commentLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.backgroundColor = UIColor.lightGray
        label.layer.cornerRadius = 20
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 3
        label.font = UIFont(name: "SnackFeed", size: 22)
        label.textColor = UIColor.mutedGreen
        label.textAlignment = NSTextAlignment.center
        label.text = "b"

        return label // return the image to the cell
    }()

    // thanks count
    let thanksCountLabel: UILabel = {
        let label = UILabel()
        label.text = "16"
        return label
    }()

    // reaction icons
    let thanksLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true // limits image to the confines of the view
        label.backgroundColor = UIColor.lightGray
        label.layer.cornerRadius = 20
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 3
        label.font = UIFont(name: "SnackFeed", size: 22)
        label.textColor = UIColor.mutedRed
        label.textAlignment = NSTextAlignment.center
        label.text = "h"
        return label // return the image to the cell
    }()

    let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.opacity = 0.5
        layer.colors = [UIColor.black.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.black.cgColor]
        layer.locations = [0.0, 0.3, 0.7, 1.0]
        return layer
    }()

    let yumLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.backgroundColor = UIColor.lightGray
        label.layer.cornerRadius = 20
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 3
        label.font = UIFont(name: "SnackFeed", size: 24)
        label.textColor = UIColor.mutedBlue
        label.textAlignment = NSTextAlignment.center
        label.text = "q"
        return label
    }()

    let yumCountLabel: UILabel = {
        let label = UILabel()
        label.text = "16"
        return label
    }()

    init() {
        super.init(frame: .zero)
        
        addSubview(snackImageView)
        addSubview(timeLabel)
        addSubview(reactionButton)
        addSubview(snackItemLabel)
        addSubview(userImageView)
        addSubview(usernameLabel)
        addSubview(commentLabel)
        addSubview(commentCountLabel)
        addSubview(thanksCountLabel)
        addSubview(thanksLabel)
        addSubview(yumLabel)
        addSubview(yumCountLabel)

        snackImageView.layer.addSublayer(gradientLayer)
        installConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = snackImageView.frame
    }
    
    func installConstraints() {
        
        snackImageView.translatesAutoresizingMaskIntoConstraints = false
        snackImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        snackImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        snackImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        snackImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1, constant: 0).isActive = true
        snackImageView.contentMode = .scaleAspectFill

        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true

        reactionButton.translatesAutoresizingMaskIntoConstraints = false
        reactionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        reactionButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        reactionButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        reactionButton.widthAnchor.constraint(equalToConstant: 40).isActive = true

        snackItemLabel.translatesAutoresizingMaskIntoConstraints = false
        snackItemLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
//        snackItemLabel.widthAnchor.constraint(equalTo: snackImageView.widthAnchor, constant: -10).isActive = true
        snackItemLabel.bottomAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: -10).isActive = true

        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        userImageView.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 10).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.contentMode = .scaleAspectFill

        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 8).isActive = true
        usernameLabel.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 20).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        usernameLabel.widthAnchor.constraint(equalToConstant: frame.width / 2).isActive = true

        commentCountLabel.translatesAutoresizingMaskIntoConstraints = false
        commentCountLabel.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 20).isActive = true
        commentCountLabel.trailingAnchor.constraint(equalTo: commentLabel.leadingAnchor, constant: -8).isActive = true
        commentCountLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.trailingAnchor.constraint(equalTo: thanksCountLabel.leadingAnchor, constant: -8).isActive = true
        commentLabel.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 10).isActive = true
        commentLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        commentLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        commentLabel.contentMode = .scaleAspectFill

        thanksCountLabel.translatesAutoresizingMaskIntoConstraints = false
        thanksCountLabel.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 20).isActive = true
        thanksCountLabel.trailingAnchor.constraint(equalTo: thanksLabel.leadingAnchor, constant: -8).isActive = true
        thanksCountLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        thanksLabel.translatesAutoresizingMaskIntoConstraints = false
        thanksLabel.trailingAnchor.constraint(equalTo: yumLabel.leadingAnchor, constant: 6).isActive = true
        thanksLabel.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 8).isActive = true
        thanksLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        thanksLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        thanksLabel.layer.zPosition = 1
        thanksLabel.contentMode = .scaleAspectFill

        yumLabel.translatesAutoresizingMaskIntoConstraints = false
        yumLabel.trailingAnchor.constraint(equalTo: yumCountLabel.leadingAnchor, constant: -8).isActive = true
        yumLabel.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 8).isActive = true
        yumLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        yumLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        yumLabel.contentMode = .scaleAspectFill

        yumCountLabel.translatesAutoresizingMaskIntoConstraints = false
        yumCountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        yumCountLabel.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 20).isActive = true
        yumCountLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

}

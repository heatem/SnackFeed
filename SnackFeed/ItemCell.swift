//
//  ItemCell.swift
//  SnackFeed
//
//  Created by Heather Mason on 10/3/17.
//  Copyright © 2017 HeatherMasonDev. All rights reserved.
//

import UIKit
import QuartzCore

var snackList: Array<NSDictionary> = []

class ItemCell: UITableViewCell {

    // add elements like image, title, etc. to the cell. Don't forget to add to the init function and add any constraints
    // image
    let snackImageView: UIImageView = {
        let snackImage = UIImageView()
        snackImage.clipsToBounds = true // limits image to the confines of the view
        snackImage.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
        snackImage.contentMode = .scaleAspectFill
        return snackImage // return the image to the cell
    }()
    
    // time label ("23 minutes ago")
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 20)
//        label.text = "23 minutes ago"
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
        userImage.clipsToBounds = true // limits image to the confines of the view
        userImage.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        userImage.layer.cornerRadius = 20
//        userImage.layer.borderColor = UIColor.white.cgColor
//        userImage.layer.borderWidth = 3
//        userImage.image = #imageLiteral(resourceName: "user.png")
        return userImage // return the image to the cell
    }()

    // username
     let usernameLabel: UILabel = {
        let label = UILabel()
//        label.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
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
        label.clipsToBounds = true // limits image to the confines of the view
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

    // reaction count
     let reactionCountLabel: UILabel = {
        let label = UILabel()
//     label.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        label.text = "16"
        return label
     }()

    // reaction icons
    let reactionLabel: UILabel = {
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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(snackImageView)
        contentView.addSubview(timeLabel)
        contentView.addSubview(reactionButton)
        contentView.addSubview(snackItemLabel)
        contentView.addSubview(userImageView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(commentLabel)
        contentView.addSubview(commentCountLabel)
        contentView.addSubview(reactionCountLabel)
        contentView.addSubview(reactionLabel)
        contentView.addSubview(yumLabel)
        
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
        timeLabel.widthAnchor.constraint(equalToConstant: frame.size.width - 60).isActive = true

        reactionButton.translatesAutoresizingMaskIntoConstraints = false
        reactionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        reactionButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        reactionButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        reactionButton.widthAnchor.constraint(equalToConstant: 40).isActive = true

        snackItemLabel.translatesAutoresizingMaskIntoConstraints = false
        snackItemLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        snackItemLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
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
        usernameLabel.widthAnchor.constraint(equalToConstant: frame.size.width / 2).isActive = true

        commentCountLabel.translatesAutoresizingMaskIntoConstraints = false
        commentCountLabel.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 20).isActive = true
        commentCountLabel.trailingAnchor.constraint(equalTo: commentLabel.leadingAnchor, constant: -8).isActive = true
        commentCountLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.trailingAnchor.constraint(equalTo: reactionCountLabel.leadingAnchor, constant: -8).isActive = true
        commentLabel.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 10).isActive = true
        commentLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        commentLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        commentLabel.contentMode = .scaleAspectFill

        reactionCountLabel.translatesAutoresizingMaskIntoConstraints = false
        reactionCountLabel.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 20).isActive = true
        reactionCountLabel.trailingAnchor.constraint(equalTo: reactionLabel.leadingAnchor, constant: -8).isActive = true
        reactionCountLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        reactionLabel.translatesAutoresizingMaskIntoConstraints = false
        reactionLabel.trailingAnchor.constraint(equalTo: yumLabel.leadingAnchor, constant: 6).isActive = true
        reactionLabel.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 8).isActive = true
        reactionLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        reactionLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        reactionLabel.layer.zPosition = 1
        reactionLabel.contentMode = .scaleAspectFill

        yumLabel.translatesAutoresizingMaskIntoConstraints = false
        yumLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        yumLabel.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 8).isActive = true
        yumLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        yumLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        yumLabel.contentMode = .scaleAspectFill
    }
    
}

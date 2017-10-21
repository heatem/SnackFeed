//
//  ItemCell.swift
//  SnackFeed
//
//  Created by Heather Mason on 10/3/17.
//  Copyright © 2017 HeatherMasonDev. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    // add elements like image, title, etc. to the cell. Don't forget to add to the init function and add any constraints
    // image
    let snackImageView: UIImageView = {
        let snackImage = UIImageView()
        snackImage.clipsToBounds = true // limits image to the confines of the view
        snackImage.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        snackImage.image = #imageLiteral(resourceName: "imagePlaceholder.png")
        return snackImage // return the image to the cell
    }()
    
    // time label ("23 minutes ago")
    let timeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        label.text = "23 minutes ago"
        return label
    }()

    // heart button
    let reactionButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 20
        return button
    }()

    // title
    let snackItemLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 3
        return label
    }()

//  user image
    let userImageView: UIImageView = {
        let userImage = UIImageView()
        userImage.clipsToBounds = true // limits image to the confines of the view
        userImage.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        userImage.layer.cornerRadius = 20
        userImage.layer.borderColor = UIColor.white.cgColor
        userImage.layer.borderWidth = 3
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
        label.text = "23"
        return label
    }()

    // comment icon
    let commentImageView: UIImageView = {
        let commentImage = UIImageView()
        commentImage.clipsToBounds = true // limits image to the confines of the view
        commentImage.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        commentImage.layer.cornerRadius = 20
        commentImage.layer.borderColor = UIColor.white.cgColor
        commentImage.layer.borderWidth = 3
        return commentImage // return the image to the cell
    }()

    // reaction count
     let reactionCountLabel: UILabel = {
        let label = UILabel()
//     label.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        label.text = "16"
        return label
     }()

    // reaction icons
    let reactionImageView: UIImageView = {
        let reactionImage = UIImageView()
        reactionImage.clipsToBounds = true // limits image to the confines of the view
        reactionImage.backgroundColor = UIColor.gray
        reactionImage.layer.cornerRadius = 20
        reactionImage.layer.borderColor = UIColor.white.cgColor
        reactionImage.layer.borderWidth = 3
        return reactionImage // return the image to the cell
    }()

    let yumImageView: UIImageView = {
        let yumImage = UIImageView()
        yumImage.clipsToBounds = true
        yumImage.backgroundColor = UIColor.gray
        yumImage.layer.cornerRadius = 20
        yumImage.layer.borderColor = UIColor.white.cgColor
        yumImage.layer.borderWidth = 3
        return yumImage
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(snackImageView)
        addSubview(timeLabel)
        addSubview(reactionButton)
        addSubview(snackItemLabel)
        addSubview(userImageView)
        addSubview(usernameLabel)
        addSubview(commentImageView)
        addSubview(commentCountLabel)
        addSubview(reactionCountLabel)
        addSubview(reactionImageView)
        addSubview(yumImageView)
        
        installConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installConstraints() {
        snackImageView.translatesAutoresizingMaskIntoConstraints = false
        snackImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        snackImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        snackImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        snackImageView.heightAnchor.constraint(equalToConstant: frame.size.width).isActive = true
        snackImageView.contentMode = .scaleAspectFill
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: frame.size.width / 2).isActive = true

        reactionButton.translatesAutoresizingMaskIntoConstraints = false
        reactionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        reactionButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        reactionButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        reactionButton.widthAnchor.constraint(equalToConstant: 40).isActive = true

        snackItemLabel.translatesAutoresizingMaskIntoConstraints = false
        snackItemLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        snackItemLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        snackItemLabel.bottomAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: -10).isActive = true
        snackItemLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

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
        commentCountLabel.trailingAnchor.constraint(equalTo: commentImageView.leadingAnchor, constant: -8).isActive = true
        commentCountLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        commentImageView.translatesAutoresizingMaskIntoConstraints = false
        commentImageView.trailingAnchor.constraint(equalTo: reactionCountLabel.leadingAnchor, constant: -8).isActive = true
        commentImageView.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 10).isActive = true
        commentImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        commentImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        commentImageView.contentMode = .scaleAspectFill

        reactionCountLabel.translatesAutoresizingMaskIntoConstraints = false
        reactionCountLabel.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 20).isActive = true
        reactionCountLabel.trailingAnchor.constraint(equalTo: reactionImageView.leadingAnchor, constant: -8).isActive = true
        reactionCountLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        reactionImageView.translatesAutoresizingMaskIntoConstraints = false
        reactionImageView.trailingAnchor.constraint(equalTo: yumImageView.leadingAnchor, constant: 8).isActive = true
        reactionImageView.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 8).isActive = true
        reactionImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        reactionImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        reactionImageView.layer.zPosition = 1
        reactionImageView.contentMode = .scaleAspectFill

        yumImageView.translatesAutoresizingMaskIntoConstraints = false
        yumImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        yumImageView.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 8).isActive = true
        yumImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        yumImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        yumImageView.contentMode = .scaleAspectFill
    }
    
}

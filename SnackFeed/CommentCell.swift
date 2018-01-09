//
//  CommentCell.swift
//  SnackFeed
//
//  Created by Heather Mason on 12/6/17.
//  Copyright © 2017 HeatherMasonDev. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    // user image
    let userImageView: UIImageView = {
        let userImage = UIImageView()
        userImage.clipsToBounds = true
        userImage.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        userImage.layer.cornerRadius = 25
        return userImage
    }()
    
    // username
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "username"
        return label
    }()
    
    // time posted
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .gray
        label.font = UIFont(name: "Helvetica", size: 14)
        label.text = "1 week ago"
        return label
    }()
    
    // comment
    let commentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "Lorem Khaled Ipsum is a major key to success. The other day the grass was brown, now it’s green because I ain’t give up. Never surrender. It’s on you how you want to live your life. Everyone has a choice. I pick my choice, squeaky clean. Look at the sunset, life is amazing, life is beautiful, life is what you make it. You see the hedges, how I got it shaped up? It’s important to shape up your hedges, it’s like getting a haircut, stay fresh. Wraith talk. They key is to have every key, the key to open every door. The key to more success is to get a massage once a week, very important, major key, cloth talk."
        return label
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        contentView.addSubview(userImageView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(commentLabel)
        
        installConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installConstraints() {
        
        // add user image constraints
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        userImageView.contentMode = .scaleAspectFill
        
        // add username constraints
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 8).isActive = true
        usernameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        usernameLabel.widthAnchor.constraint(equalToConstant: frame.size.width / 2).isActive = true
        
        // add time label constraints
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        // add comment constraints
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 8).isActive = true
        commentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        commentLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 8).isActive = true
        commentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
    }
    
}

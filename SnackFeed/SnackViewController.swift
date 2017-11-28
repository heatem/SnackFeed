//
//  SnackViewController.swift
//  SnackFeed
//
//  Created by Heather Mason on 11/24/17.
//  Copyright © 2017 HeatherMasonDev. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class SnackViewController: UIViewController {
    
    var snack = [String: Any]()
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = snack["title"] as? String
        print(snack)
        view.addSubview(tableView)
        
        // need to add constraints to be able to see the table
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // set constraints
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        view.backgroundColor = .white
//
//        view.addSubview(snackImageView)
//        view.addSubview(timeLabel)
//        view.addSubview(reactionButton)
//        view.addSubview(snackItemLabel)
//        view.addSubview(userImageView)
//        view.addSubview(usernameLabel)
//        view.addSubview(commentLabel)
//        view.addSubview(commentCountLabel)
//        view.addSubview(thanksCountLabel)
//        view.addSubview(thanksLabel)
//        view.addSubview(yumLabel)
//        view.addSubview(yumCountLabel)
//        
//        snackImageView.layer.addSublayer(gradientLayer)
//        installConstraints()
        
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension SnackViewController: UITableViewDelegate, UITableViewDataSource {
    
    // these two functions are required for UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        // create a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//
//        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
//        cell.textLabel?.textColor = .blue
        cell.textLabel?.text = "Hello"
//        cell.textLabel?.frame = CGRect(x: 0, y: 0, width: 500, height: 50)
        return cell
    }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
        }
    

        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = .blue
            return headerView
        }
}
/*
//        if let snackCell = cell as? SnackCell {
//            if
//                let file = snack["image"] as? [String: Any],
//                let imageUrl = file["url"] as? String,
//                let userObject = snack["user"] as? [String:Any],
//                let userImage = userObject["userImage"] as? [String:Any],
//                let userImageUrl = userImage["url"] as? String,
//                let usernameDisplay = userObject["username"] as? String,
//
//                let title = snack["title"],
//                let createdAt = snack["createdAt"],
//                let thanksCount = snack["thanks"],
//                let yumsCount = snack["yums"]
//            {
//                if let url = URL(string: imageUrl) {
//                    snackImageView.af_setImage(withURL: url)
//                }
//
//                if let url = URL(string: userImageUrl) {
//                    userImageView.af_setImage(withURL: url)
//                }
//
//                snackItemLabel.text = String(describing: title)
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//                //                print(dateFormatter.date(from: String(describing: createdAt)))
//                if let createdTime: Date = dateFormatter.date(from: String(describing: createdAt)) {
//                    //                print(createdAt)
//                    timeLabel.text = createdTime.timeAgo()
//                }
//                usernameLabel.text = String(describing: usernameDisplay)
//                thanksCountLabel.text = String(describing: thanksCount)
//                yumCountLabel.text = String(describing: yumsCount)
//            } */

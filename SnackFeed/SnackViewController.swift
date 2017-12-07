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
    let tableView = UITableView(frame: .zero, style: .grouped)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = snack["title"] as? String
        print(snack)
        view.addSubview(tableView)

        view.backgroundColor = .white
        
        // need to add constraints to be able to see the table
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // set constraints
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        tableView.tableHeaderView = SnackView()
        tableView.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width + 100)
        if let header = tableView.tableHeaderView as? SnackView {
            print(snack)
            if
            let file = snack["image"] as? [String: Any],
                let imageUrl = file["url"] as? String,
                let userObject = snack["user"] as? [String: Any],
                let userImage = userObject["userImage"] as? [String: Any],
                let userImageUrl = userImage["url"] as? String,
                let usernameDisplay = userObject["username"] as? String,
                let title = snack["title"] as? String,
                let createdAt = snack["createdAt"] as? String,
                let thanksCount = snack["thanks"],
                let yumsCount = snack["yums"]
            {
                if let url = URL(string: imageUrl) {
                    header.snackImageView.af_setImage(withURL: url)
                }
                
                if let url = URL(string: userImageUrl) {
                    header.userImageView.af_setImage(withURL: url)
                }
                header.snackItemLabel.text = title
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                if let createdTime: Date = dateFormatter.date(from: String(describing: createdAt)) {
                    header.timeLabel.text = createdTime.timeAgo()
                    print(createdTime)
                    print("hi")
                }
                
                header.usernameLabel.text = String(describing: usernameDisplay)
                header.thanksCountLabel.text = String(describing: thanksCount)
                header.yumCountLabel.text = String(describing: yumsCount)
            }
        }
        
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
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Hello"
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
    
}

//
//  ViewController.swift
//  SnackFeed
//
//  Created by Heather Mason on 10/2/17.
//  Copyright © 2017 HeatherMasonDev. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class FeedViewController: UIViewController {
    
    var snackList = [[String: Any]]()

    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SnackFeed"
        
        let headers: HTTPHeaders = [
            "X-Parse-REST-API-Key": PARSE_CLIENT_KEY,
            "X-Parse-Application-Id": PARSE_APP_ID,
            "Accept": "application/json",
        ]

        Alamofire.request("http://13.57.36.150:80/parse/classes/Snacks/?include=user&order=-createdAt", headers: headers).responseJSON { [weak self] response in
            if let json = response.result.value, let dict = json as? [String: Any], let snacks = dict["results"] as? [Any] {
                for snack in snacks {
                    if let snackDict = snack as? [String: Any] {
                        self?.snackList.append(snackDict)
                    }
                }
//                print(self?.snackList)
                self?.tableView.reloadData()
            }

//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
////                print("Data: \(utf8Text)")
//
//            }
            
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        // Note that if you create a self-sizing cell in Interface Builder, the default row height is changed to the value set in Interface Builder. To get the expected self-sizing behavior for a cell that you create in Interface Builder, you must explicitly set rowHeight equal to UITableViewAutomaticDimension in your code.
        tableView.register(SnackCell.self, forCellReuseIdentifier: "item")
        
        view.addSubview(tableView)
        
        // need to add constraints to be able to see the table
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // set constraints
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    // these two functions are required for UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snackList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.width + 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSnack = snackList[indexPath.row]
        let snackViewController = SnackViewController()
        snackViewController.snack = selectedSnack
        navigationController?.pushViewController(snackViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        if let snackCell = cell as? SnackCell {
            if
                let file = snackList[indexPath.row]["image"] as? [String: Any],
                let imageUrl = file["url"] as? String,
                let userObject = snackList[indexPath.row]["user"] as? [String: Any],
                let userImage = userObject["userImage"] as? [String: Any],
                let userImageUrl = userImage["url"] as? String,
                let usernameDisplay = userObject["username"] as? String,
                
                let title = snackList[indexPath.row]["title"],
                let createdAt = snackList[indexPath.row]["createdAt"],
                let thanksCount = snackList[indexPath.row]["thanks"],
                let yumsCount = snackList[indexPath.row]["yums"]
            {
                if let url = URL(string: imageUrl) {
                    snackCell.snackImageView.af_setImage(withURL: url)
                }
                
                if let url = URL(string: userImageUrl) {
                    snackCell.userImageView.af_setImage(withURL: url)
                }

                snackCell.snackItemLabel.text = String(describing: title)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//                print(dateFormatter.date(from: String(describing: createdAt)))
                if let createdTime: Date = dateFormatter.date(from: String(describing: createdAt)) {
//                    print(createdAt)
                    snackCell.timeLabel.text = createdTime.timeAgo()
                }
                snackCell.usernameLabel.text = String(describing: usernameDisplay)
                snackCell.thanksCountLabel.text = String(describing: thanksCount)
                snackCell.yumCountLabel.text = String(describing: yumsCount)
            }
        }
        return cell
    }
}

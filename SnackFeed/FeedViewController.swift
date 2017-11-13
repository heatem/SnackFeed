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

    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headers: HTTPHeaders = [
            "X-Parse-REST-API-Key": PARSE_CLIENT_KEY,
            "X-Parse-Application-Id": PARSE_APP_ID,
            "Accept": "application/json"
        ]

        Alamofire.request("http://13.57.36.150:80/parse/classes/Snacks/?include=user", headers: headers).responseJSON { [weak self] response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response?.statusCode))") // http url response
            print("Result: \(response.result)")                         // response serialization result

            if let json = response.result.value, let dict = json as? [String: Any], let snacks = dict["results"] as? [Any] {
//                print("JSON: \(json)") // serialized json response
                for snack in snacks {
                    if let snackDict = snack as? [String: Any] {
                        snackList.append(snackDict as NSDictionary)
                    }
                }
                self?.tableView.reloadData()
            }

            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")

            }
        
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        // Note that if you create a self-sizing cell in Interface Builder, the default row height is changed to the value set in Interface Builder. To get the expected self-sizing behavior for a cell that you create in Interface Builder, you must explicitly set rowHeight equal to UITableViewAutomaticDimension in your code.
//        tableView.rowHeight = view.frame.size.width + 40
        tableView.register(ItemCell.self, forCellReuseIdentifier: "item")
        
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
        // need to return the number of rows. For now, lets pick a number
        return snackList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.width + 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.allowsSelection = false
        // create a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        // create the ItemCell class then come back here
        // add the contents of the cell
        if let itemCell = cell as? ItemCell {
            if
                let file = snackList[indexPath.row]["image"] as? [String: Any],
                let imageUrl = file["url"] as? String,
                let userObject = snackList[indexPath.row]["user"] as? [String:Any],
                let userImage = userObject["userImage"] as? [String:Any],
                let userImageUrl = userImage["url"] as? String,
                let usernameDisplay = userObject["username"] as? String,
                
                let title = snackList[indexPath.row]["title"],
                let createdAt = snackList[indexPath.row]["createdAt"],
                let thanksCount = snackList[indexPath.row]["thanks"],
                let reactionCount = snackList[indexPath.row]["yums"]
            {
                if let url = URL(string: imageUrl) {
                    itemCell.snackImageView.af_setImage(withURL: url)
                }
                
                if let url = URL(string: userImageUrl) {
                    itemCell.userImageView.af_setImage(withURL: url)
                }

                itemCell.snackItemLabel.text = String(describing: title)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSSZ"
//                print(dateFormatter.date(from: String(describing: createdAt)))
                if let createdTime: Date = dateFormatter.date(from: String(describing: createdAt)) {
                    print(createdAt)
                    itemCell.timeLabel.text = timeAgo(date: createdTime)
                    print("Time Created ago: \(timeAgo(date: createdTime))")
                }
                itemCell.usernameLabel.text = String(describing: usernameDisplay)
                itemCell.commentCountLabel.text = String(describing: thanksCount)
                itemCell.reactionCountLabel.text = String(describing: reactionCount)
            }
        }
        return cell
    }
    
    func timeAgo(date:Date) -> String { // change any to Date
        let calendar = Calendar.current
        let unitFlags: Set<Calendar.Component> = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
        let now = Date()
        let oldest = now < date ? now : date
        let newest = (oldest == now) ? date : now
        let components = calendar.dateComponents(unitFlags, from: oldest, to: newest)
        
        if
            let years = components.year,
            let months = components.month,
            let weeks = components.weekOfYear,
            let days = components.day,
            let hours = components.hour,
            let minutes = components.minute,
            let seconds = components.second
        {
            if years >= 2 {
                return "\(years) years ago"
            }
            if years >= 1 {
                if months >= 1 {
                    return "Over a year ago"
                } else {
                    return "Last year"
                }
            }
            if months >= 2 {
                return "\(months) months ago"
            }
            if months >= 1 {
                return "Last month"
            }
            if weeks >= 2 {
                return "\(weeks) weeks ago"
            }
            if weeks >= 1 {
                return "Last week"
            }
            if days >= 2 {
                return "\(days) days ago"
            }
            if days >= 1 {
                return "Yesterday"
            }
            if hours >= 2 {
                return "\(hours) hours ago"
            }
            if hours >= 1 {
                return "An hour ago"
            }
            if minutes >= 2 {
                return "\(minutes) minutes ago"
            }
            if minutes >= 1 {
                return "A minute ago"
            }
            if seconds >= 10 {
                return "\(seconds) seconds ago"
            }
            if seconds < 10 {
                return "Just now"
            }
        }
        return "Date unknown"
    }
}

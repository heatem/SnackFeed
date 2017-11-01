//
//  ViewController.swift
//  SnackFeed
//
//  Created by Heather Mason on 10/2/17.
//  Copyright © 2017 HeatherMasonDev. All rights reserved.
//

import UIKit
import Alamofire

class FeedViewController: UIViewController {

    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://jsonplaceholder.typicode.com/posts").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response?.statusCode))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
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
        return snackSamples.count
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
                let fileName = snackSamples[indexPath.row]["image-url"] as? String,
                let image = UIImage(named: fileName),
                let title = snackSamples[indexPath.row]["title"] as? String,
                let createdAt = snackSamples[indexPath.row]["created-at"] as? String,
                let userImageURL = snackSamples[indexPath.row]["user-image-url"] as? String,
                let userImage = UIImage(named: userImageURL),
                let usernameDisplay = snackSamples[indexPath.row]["username"] as? String,
                let thanksCount = snackSamples[indexPath.row]["thanks"] as? Int,
                let reactionCount = snackSamples[indexPath.row]["yums"] as? Int
            {
                itemCell.snackImageView.image = image
                itemCell.snackItemLabel.text = title
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
                if let createdTime: Date = dateFormatter.date(from: createdAt) {
                    itemCell.timeLabel.text = timeAgo(date: createdTime)
                }
                
                itemCell.userImageView.image = userImage
                itemCell.usernameLabel.text = usernameDisplay
                itemCell.commentCountLabel.text = String(thanksCount)
                itemCell.reactionCountLabel.text = String(reactionCount)
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

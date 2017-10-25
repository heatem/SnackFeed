//
//  ViewController.swift
//  SnackFeed
//
//  Created by Heather Mason on 10/2/17.
//  Copyright © 2017 HeatherMasonDev. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        // create a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        // create the ItemCell class then come back here
        // add the contents of the cell
        if let itemCell = cell as? ItemCell {
            print(snackSamples[indexPath.row]["image-url"])
            if
                let fileName = snackSamples[indexPath.row]["image-url"] as? String,
                let image = UIImage(named: fileName),
                let title = snackSamples[indexPath.row]["title"] as? String,
                let createdAt = snackSamples[indexPath.row]["created-at"] as? String
                /*
 
 contentView.addSubview(reactionButton)
 contentView.addSubview(snackItemLabel)
 contentView.addSubview(userImageView)
 contentView.addSubview(usernameLabel)
 contentView.addSubview(commentLabel)
 contentView.addSubview(commentCountLabel)
 contentView.addSubview(reactionCountLabel)
 contentView.addSubview(reactionLabel)
 contentView.addSubview(yumLabel)
                 
                 */
            {
                itemCell.snackImageView.image = image
                itemCell.snackItemLabel.text = title
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
                if let createdTime: Date = dateFormatter.date(from: createdAt) {
                    itemCell.timeLabel.text = timeAgo(date: createdTime)
                }
                
                
                
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
                print("\(years)")
                return "\(years) years ago"
            }
            if years >= 1 {
                if months >= 1 {
                    print("\(years)")
                    return "Over a year ago"
                } else {
                    print("\(years)")
                    return "Last year"
                }
            }
            if months >= 2 {
                print("\(months)")
                return "\(months) months ago"
            }
            if months >= 1 {
                print("\(months)")
                return "Last month"
            }
            if weeks >= 2 {
                print("\(weeks)")
                return "\(weeks) weeks ago"
            }
            if weeks >= 1 {
                print("\(weeks)")
                return "Last week"
            }
            if days >= 2 {
                print("\(days)")
                return "\(days) days ago"
            }
            if days >= 1 {
                print("\(weeks)")
                return "Yesterday"
            }
            if hours >= 2 {
                print("\(hours)")
                return "\(hours) hours ago"
            }
            if hours >= 1 {
                print("\(hours)")
                return "An hour ago"
            }
            if minutes >= 2 {
                print("\(minutes)")
                return "\(minutes) minutes ago"
            }
            if minutes >= 1 {
                print("\(minutes)")
                return "A minute ago"
            }
            if seconds >= 10 {
                print("\(seconds)")
                return "\(seconds) seconds ago"
            }
            if seconds < 10 {
                print("\(seconds)")
                return "Just now"
            }
        }
        return "Date unknown"
    }
}

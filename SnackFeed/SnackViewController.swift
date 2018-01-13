//
//  SnackViewController.swift
//  SnackFeed
//
//  Created by Heather Mason on 11/24/17.
//  Copyright © 2017 HeatherMasonDev. All rights reserved.
//

// Need to refactor how comments are filtered. Right now, I loop through all comments and compare the snack object id to filter them. Need to request only the required comments. Resume here: Check if you've done this

import UIKit
import Alamofire
import AlamofireImage

class SnackViewController: UIViewController, UITextFieldDelegate {
    
    var snack = [String: Any]()
    let tableView = UITableView(frame: .zero, style: .grouped)
    var commentList = [[String: Any]]()
//    var commentCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTapped()
        
        title = snack["title"] as? String

        view.backgroundColor = .white
        
        tableView.tableHeaderView = SnackView()
        tableView.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width + 100)
        
        let addCommentView = AddCommentView()
        addCommentView.frame = CGRect(x: 0, y: view.frame.size.height - 60, width: view.frame.size.width, height: 60)
        addCommentView.backgroundColor = UIColor.lightGray
        
        self.view.addSubview(addCommentView)
        
        let textField = addCommentView.commentTextField
        textField.delegate = self
        
        // IN PROGRESS
        let headers: HTTPHeaders = [
            "X-Parse-REST-API-Key": PARSE_CLIENT_KEY,
            "X-Parse-Application-Id": PARSE_APP_ID,
            "Accept": "application/json",
            ]
        
        Alamofire.request("http://13.57.36.150:80/parse/classes/Comments/?include=author", headers: headers).responseJSON { [weak self] response in
            if let json = response.result.value, let dict = json as? [String: Any], let comments = dict["results"] as? [Any] {
                for comment in comments {
                    if let commentDict = comment as? [String: Any] {
                        if
                            let snackObj = commentDict["snack"] as? [String: Any],
                            let objIdForSnack = snackObj["objectId"] as? String,
                            let snackId = self?.snack["objectId"] as? String
                        {
                            if snackId == objIdForSnack {
                                self?.commentList.append(commentDict)
                            }
                        }
                    }
                }
                self?.loadHeader()
                self?.tableView.reloadData()
            }
            
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
////                                print("Data: \(utf8Text)")
//
//            }
            
        }
        
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CommentCell.self, forCellReuseIdentifier: "item")
        
        view.addSubview(tableView)
        
        // need to add constraints to be able to see the table
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // set constraints
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: addCommentView.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}


extension SnackViewController: UITableViewDelegate, UITableViewDataSource {
    
    // these two functions are required for UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        if let commentCell = cell as? CommentCell {
            if
                let userObject = commentList[indexPath.row]["author"] as? [String: Any],
                let userImage = userObject["userImage"] as? [String: Any],
                let userImageUrl = userImage["url"] as? String,
                let usernameDisplay = userObject["username"] as? String,
                let createdAt = commentList[indexPath.row]["createdAt"],
                let commentItem = commentList[indexPath.row]["comment"]
            {
                
                //  set user image
                if let url = URL(string: userImageUrl) {
                    commentCell.userImageView.af_setImage(withURL: url)
                }

                // set username
                commentCell.usernameLabel.text = String(describing: usernameDisplay)

                // set time
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                if let createdTime: Date = dateFormatter.date(from: String(describing: createdAt)) {
                    commentCell.timeLabel.text = createdTime.timeAgo()
                }

                // set comment
                commentCell.commentLabel.text = String(describing: commentItem)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
        // look up automatic height dimension
//    will have to set constraints for all sides (top, bottom, leading trailing
    }
    
    func loadHeader() {
        if let header = tableView.tableHeaderView as? SnackView {
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
                }
                header.usernameLabel.text = String(describing: usernameDisplay)
                header.thanksCountLabel.text = String(describing: thanksCount)
                header.yumCountLabel.text = String(describing: yumsCount)
                
                header.commentCountLabel.text = String(describing: commentList.count)
            }
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}


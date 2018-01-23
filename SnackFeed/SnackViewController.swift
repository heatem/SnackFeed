//
//  SnackViewController.swift
//  SnackFeed
//
//  Created by Heather Mason on 11/24/17.
//  Copyright © 2017 HeatherMasonDev. All rights reserved.
//

// Need to refactor how comments are filtered. Right now, I loop through all comments and compare the snack object id to filter them. Need to request only the required comments. Resume here: Check if you've done this

// TODO: can post dummy comment by clicking the button now. Need to figure out how to get the text from the textfield to register, not be optional, and add it into the comment (think i got the last part but need the first 2)

import UIKit
import Alamofire
import AlamofireImage

class SnackViewController: UIViewController, UITextFieldDelegate {
    
    var snack = [String: Any]()
    let tableView = UITableView(frame: .zero, style: .grouped)
    var commentList = [[String: Any]]()
    let addCommentView = AddCommentView()
    var newComment = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTapped()
        
        title = snack["title"] as? String

        view.backgroundColor = .white
        
        tableView.tableHeaderView = SnackView()
        tableView.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width + 100)
        
        addCommentView.frame = CGRect(x: 0, y: view.frame.size.height - 60, width: view.frame.size.width, height: 60)
        addCommentView.backgroundColor = UIColor.lightGray
        
        self.view.addSubview(addCommentView)
        
        addCommentView.commentTextField.delegate = self
            addCommentView.postCommentButton.addTarget(self, action: #selector(postComment), for: .touchUpInside)
        
        loadTable()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CommentCell.self, forCellReuseIdentifier: "item")
        
        view.addSubview(tableView)
        
        // need to add these constraints to be able to see the table
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // set constraints
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: addCommentView.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        postComment()
        return true
    }
    
    func loadTable() {
        // Need to figure out a better way to filter comments
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
            
        }
    }
    
    @objc func postComment() {
        if addCommentView.commentTextField.text != "" {
            commentList = [[String: Any]]()
            if let commentField = addCommentView.commentTextField.text {
                newComment = commentField
            }
            let commentAuthor = "AklIHGtwPl"
            let commentSnack = "5jsFAPTaLF"
            let dict: [String: Any] = [
                "comment": newComment,
                "author": [
                    "__type": "Pointer",
                    "className": "_User",
                    "objectId": commentAuthor
                ],
                "snack": [
                    "__type": "Pointer",
                    "className": "Snacks",
                    "objectId": commentSnack
                ]
            ]

            let headers: HTTPHeaders = [
                "X-Parse-REST-API-Key": PARSE_CLIENT_KEY,
                "X-Parse-Application-Id": PARSE_APP_ID,
                "Accept": "application/json",
                ]
            
            Alamofire.request("http://13.57.36.150:80/parse/classes/Comments", method: .post, parameters: dict, encoding: JSONEncoding.default, headers: headers)
    //            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
    //                print("Progress: \(progress.fractionCompleted)")
    //            }
    //            .validate { request, response, data in
    //                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
    //                return .success
    //            }
    //            .responseJSON { response in
    //                debugPrint(response)
    //        }
            DispatchQueue.main.async {
                self.addCommentView.commentTextField.text = ""
                self.loadTable()
            }
        }
    }
    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let keyboardHeight = view.convert(keyboardFrame, from:nil).size.height
        let keyboardAnimationDuration = ((notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0)
        
        UIView.animate(withDuration: keyboardAnimationDuration, delay: 0, options: UIViewAnimationOptions.beginFromCurrentState, animations: {
            self.addCommentView.frame = CGRect(x: 0, y: self.view.frame.size.height - (keyboardHeight + 60), width: self.view.frame.size.width, height: 60)
            self.view.layoutIfNeeded()
        }) { (complete) in
            //
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let keyboardAnimationDuration = ((notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0)
        
        UIView.animate(withDuration: keyboardAnimationDuration, delay: 0, options: UIViewAnimationOptions.beginFromCurrentState, animations: {
            self.addCommentView.frame = CGRect(x: 0, y: self.view.frame.size.height - 60, width: self.view.frame.size.width, height: 60)
            self.view.layoutIfNeeded()
        }) { (complete) in
            //
        }
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


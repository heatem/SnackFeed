//
//  AddSnackViewController.swift
//  SnackFeed
//
//  Created by Heather Mason on 1/23/18.
//  Copyright © 2018 HeatherMasonDev. All rights reserved.
//

import UIKit

class AddSnackViewController: UIViewController {
    
    let snackImageView: UIImageView = {
        let snackImage = UIImageView()
        snackImage.clipsToBounds = true
        snackImage.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
        snackImage.contentMode = .scaleAspectFill
        return snackImage
    }()
    
    let postSnackButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = 30
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("+", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 3
        return button
    }()
    
    let photoLibraryButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("p", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Snack"
        view.backgroundColor = .white
        
//        let barHeight: CGFloat = self.navigationController!.navigationBar.frame.height
        
        view.addSubview(snackImageView)
        view.addSubview(postSnackButton)
        view.addSubview(photoLibraryButton)
        
        installConstraints()
        
        postSnackButton.addTarget(self, action: #selector(postSnack), for: .touchUpInside)
        photoLibraryButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func postSnack() {
        print("post a snack")
    }
    
    @objc func addImage() {
        print("touched up inside")
    }
    
    func installConstraints() {
        snackImageView.translatesAutoresizingMaskIntoConstraints = false
        snackImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        snackImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        snackImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        snackImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1, constant: 0).isActive = true
        snackImageView.contentMode = .scaleAspectFill
        
        postSnackButton.translatesAutoresizingMaskIntoConstraints = false
        postSnackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        postSnackButton.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: -30).isActive = true
        postSnackButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        postSnackButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        photoLibraryButton.translatesAutoresizingMaskIntoConstraints = false
        photoLibraryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        photoLibraryButton.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 100).isActive = true
        photoLibraryButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        photoLibraryButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

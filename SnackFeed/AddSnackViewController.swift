//
//  AddSnackViewController.swift
//  SnackFeed
//
//  Created by Heather Mason on 1/23/18.
//  Copyright © 2018 HeatherMasonDev. All rights reserved.
//

import UIKit

class AddSnackViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
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
    
    let cameraButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("c", for: .normal)
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
        view.addSubview(cameraButton)
        
        installConstraints()
        
        postSnackButton.addTarget(self, action: #selector(postSnack), for: .touchUpInside)
        photoLibraryButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        cameraButton.addTarget(self, action: #selector(showCamera), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        cameraButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        cameraButton.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 100).isActive = true
        cameraButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        cameraButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc func postSnack() {
        print("post a snack")
    }
    
    @objc func addImage() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
        
        print("touched up inside")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            snackImageView.image = image
        } else {
            print("Error getting image")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func showCamera() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerControllerSourceType.camera
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
        
        print("touched up inside show camera")
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

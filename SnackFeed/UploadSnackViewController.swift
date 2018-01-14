//
//  UploadSnackViewController.swift
//  SnackFeed
//
//  Created by Heather Mason on 1/13/18.
//  Copyright © 2018 HeatherMasonDev. All rights reserved.
//

import UIKit

class UploadSnackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let uploadView = UploadView()
        uploadView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width + 100)
        self.view.addSubview(uploadView)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

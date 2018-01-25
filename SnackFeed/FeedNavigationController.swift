//
//  FeedNavigationController.swift
//  SnackFeed
//
//  Created by Heather Mason on 11/25/17.
//  Copyright © 2017 HeatherMasonDev. All rights reserved.
//

import UIKit

class FeedNavigationController: UINavigationController {
    let feedVC = FeedViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [feedVC]
        
//        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
    }
}

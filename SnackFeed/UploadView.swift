//
//  UploadView.swift
//  SnackFeed
//
//  Created by Heather Mason on 1/13/18.
//  Copyright © 2018 HeatherMasonDev. All rights reserved.
//

import UIKit

class UploadView: UIView {

    let snackImageView: UIImageView = {
        let snackImage = UIImageView()
        snackImage.clipsToBounds = true
        snackImage.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
        snackImage.contentMode = .scaleAspectFill
        return snackImage
    }()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(snackImageView)
        
        installConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installConstraints() {
        snackImageView.translatesAutoresizingMaskIntoConstraints = false
        snackImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        snackImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        snackImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        snackImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1, constant: 0).isActive = true
        snackImageView.contentMode = .scaleAspectFill
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

//
//  UIColor.swift
//  SnackFeed
//
//  Created by Daniel Burke on 7/29/17.
//  Copyright © 2017 SnackFeed. All rights reserved.
//

import class UIKit.UIColor
import CoreGraphics
import func Darwin.round

public extension UIColor {
    @nonobjc public static func hexa(value: UInt32) -> UIColor {
        let a = CGFloat((value & 0xFF000000) >> 24) / 255.0
        let r = CGFloat((value & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((value & 0xFF00) >> 8) / 255.0
        let b = CGFloat((value & 0xFF)) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    @nonobjc public static func hex(value: UInt32) -> UIColor {
        let r = CGFloat((value & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((value & 0xFF00) >> 8) / 255.0
        let b = CGFloat((value & 0xFF)) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}

public extension UIColor {
    public convenience init(rgb: (r: CGFloat, g: CGFloat, b: CGFloat)) {
        self.init(red: rgb.r/255, green: rgb.g/255, blue: rgb.b/255, alpha: 1.0)
    }
}

public extension UIColor {
    public class var gray: UIColor { return UIColor.hex(value: 0xAAAAAA) }
    public class var lightGray: UIColor { return UIColor.hex(value: 0xECECEC) }
    public class var mutedGreen: UIColor { return UIColor.hex(value: 0xB0D785) }
    public class var mutedRed: UIColor { return UIColor.hex(value: 0xFF8997) }
    public class var mutedBlue: UIColor { return UIColor.hex(value: 0x7AADE9) }
    public class var sfYellow: UIColor { return UIColor.hex(value: 0xFED340) }
}

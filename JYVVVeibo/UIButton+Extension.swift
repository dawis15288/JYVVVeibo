//
//  UIButton+Extension.swift
//  JYVVVeibo
//
//  Created by atom on 16/9/15.
//  Copyright © 2016年 atom. All rights reserved.
//

import UIKit

extension UIButton {
    
    class func jyTextButton(_ title: String, fontSize: CGFloat, color: UIColor = UIColor.blue, heightColor: UIColor) -> UIButton {
        
        let button = UIButton()
        
        button.setTitle(title, for: .normal)
        
        button.setTitleColor(UIColor.darkGray, for: .normal)
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        
        button.setTitleColor(heightColor, for: .highlighted)
        
        button.sizeToFit()
        
        return button
    
    }
    
}

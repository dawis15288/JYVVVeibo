//
//  JYBaseViewController.swift
//  JYVVVeibo
//
//  Created by atom on 16/9/13.
//  Copyright © 2016年 atom. All rights reserved.
//

import UIKit

class JYBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUI()
        
    }
    
    override var title: String? {
        
        didSet {
            
            navItem.title = title
        
        }
    
    }
    
    
    
    lazy var navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
    
    lazy var navItem: UINavigationItem = UINavigationItem()
    
    
}

extension JYBaseViewController {

    func setUI() {
        
        setNavBar()
    
    }
    
    fileprivate func setNavBar() {
        
        view.addSubview(navBar)
        
        navBar.items = [navItem]
        
        navBar.barTintColor = UIColor(red: 246, green: 246, blue: 246, alpha: 1)
        
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
        
    }
    
}

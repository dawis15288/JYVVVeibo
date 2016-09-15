//
//  JYDemoViewController.swift
//  JYVVVeibo
//
//  Created by atom on 16/9/15.
//  Copyright © 2016年 atom. All rights reserved.
//

import UIKit

class JYDemoViewController: JYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "第\(navigationController?.childViewControllers.count ?? 0)个"
    }

    

}

extension JYDemoViewController {
    
    override func setUI() {
        super.setUI()
        
        let btn = UIButton.jyTextButton("下一个", fontSize: 16, heightColor: .orange)
        
        btn.addTarget(self, action: #selector(showNext), for: .touchUpInside)
        
        navItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
    }
    
    @objc fileprivate func showNext() {
        
        let vc = JYDemoViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }

}

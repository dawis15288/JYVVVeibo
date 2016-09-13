//
//  ViewController.swift
//  JYVVVeibo
//
//  Created by atom on 16/9/13.
//  Copyright © 2016年 atom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        jybutton.frame = CGRect(x: 100, y: 100, width: 100, height: 20)
        
        view.addSubview(jybutton)
        
    }
    
    
    lazy var jybutton: UIButton = {
        
        let button = UIButton()
        
        button.setTitle("真机", for: UIControlState.normal)
        
        button.setTitleColor(UIColor.red, for: .normal)
        
        button.sizeToFit()
        
        return button
    
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


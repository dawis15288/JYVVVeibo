//
//  JYMainController.swift
//  JYVVVeibo
//
//  Created by atom on 16/9/13.
//  Copyright © 2016年 atom. All rights reserved.
//

import UIKit

class JYMainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChildController()
        
        setCompose()
    }
    
    lazy var composeButton: UIButton = {
        
        let button = UIButton()
        
        button.setImage(UIImage(named: "tabbar_compose_icon_add"), for: UIControlState(rawValue: 0))
        
        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: UIControlState(rawValue: 0))
        
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: .highlighted)
        
        
        return button
    
    }()

}

extension JYMainController {
    
    func setCompose() {
        
        tabBar.addSubview(composeButton)
        
        let count = CGFloat(childViewControllers.count)
        
        let w = tabBar.bounds.width / count
        
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
    }
    
    func controllers(_ dict: [String: AnyObject]) -> UIViewController {
        
        guard let clsName = dict["clsName"] as? String, let title = dict["title"] as? String,
        
        let image = dict["imageName"] as? String,
        
        let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? JYBaseViewController.Type
        
        else {
            
            return UIViewController()
            
        }
        
        let vc = cls.init()
        
        vc.title = title
        
        vc.tabBarItem.image = UIImage(named: "tabbar_" + image)
        
        vc.tabBarItem.setBadgeTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: .selected)
        
        let nav = JYNavigationController(rootViewController: vc)
        
        return nav
    
    }

    func setChildController(){
        
        let vcJSON = Bundle.main.path(forResource: "Main", ofType: "json")
        
        var vcDict: Any?
        
        do {
        
            let vcData = try Data(contentsOf: URL(fileURLWithPath: vcJSON!))
            
            vcDict = try JSONSerialization.jsonObject(with: vcData, options: .mutableContainers)
        
        } catch {
        
        }
        
        var newArry = [UIViewController]()
        
        for item in vcDict as! [[String: AnyObject]] {
            
            newArry.append(controllers(item))
        
        }
        
        viewControllers = newArry
    
    }

}

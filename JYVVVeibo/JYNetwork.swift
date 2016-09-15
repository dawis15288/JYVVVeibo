//
//  JYNetwork.swift
//  JYVVVeibo
//
//  Created by atom on 16/9/15.
//  Copyright © 2016年 atom. All rights reserved.
//id: int

import Alamofire

class WeiboNetWork {
    
    class func getWeiboData(sinceID: Int = 0, maxID: Int = 0, completationHandler: ((_ moduels: [[String: AnyObject]]?, _ error: Error?) -> Void)?) {
    
        /*var homeURL = "\(url!)"
        
        if sinceID > 0 {
            
            homeURL = "\(homeURL)&since_id=\(sinceID)"
        
        }
        
        if maxID > 0 {
            
            homeURL = "\(homeURL)&max_id=\(maxID - 1)"
        
        }*/
        
        let params = ["since_id": "\(sinceID)", "max_id": "\(maxID > 0 ? maxID - 1 : 0)"]
        
        Alamofire.request(JYAPIHelper.homeTimeline, method: .get, parameters: params).responseJSON { (response) in
            
            if response.result.isSuccess {
                
                if let dataJSON = response.result.value as? [String: AnyObject] {
                    
                    if let moduels = dataJSON["statuses"] as? [[String: AnyObject]]  {
                        
                        completationHandler!(moduels, nil)
                        
                    }
                    
                }
                
            }
        }
    
    }

}

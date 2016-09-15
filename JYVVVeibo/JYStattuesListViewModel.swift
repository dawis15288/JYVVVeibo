//
//   .swift
//  JYVVVeibo
//
//  Created by atom on 16/9/15.
//  Copyright © 2016年 atom. All rights reserved.
//

import Foundation


class JYStatuesList {
    
    lazy var statues = [Status]()

    func loadstatues(pullup: Bool, completionHandler: ((_ isSuccess: Bool) ->  Void)? ) {
    
        let sinceID = pullup ? 0 : (statues.first?.id ?? 0)
        
        let maxID = !pullup ? 0 : (statues.last?.id ?? 0)
        
        WeiboNetWork.getWeiboData(sinceID: sinceID, maxID: maxID) { (moduels, error) in
            
            if moduels != nil && error == nil {
                
                let statues = Status.status(array: moduels!)
                
                if pullup {
                    
                    self.statues += statues
                
                } else {
                    
                    self.statues = statues + self.statues
                
                }
                
                completionHandler!(true)
            
            } else {
            
                completionHandler!(false)
                
            }
            
            
            
        }
    
    }

}

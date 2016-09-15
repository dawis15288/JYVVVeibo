//
//  Data+Extension.swift
//  JYVVVeibo
//
//  Created by atom on 16/9/15.
//  Copyright © 2016年 atom. All rights reserved.
//

import Foundation

extension Data {
    
    static func sinaDate(time: String) -> Date? {
        
        let formatter = DateFormatter()
        
        //EEE MM dd HH:mm:ss Z yyyy
        
        formatter.dateFormat = "EEE MM dd HH:mm:ss Z yyyy"
        
        formatter.locale = Locale(identifier: "en")
        
        return formatter.date(from: time)
        
    }

}

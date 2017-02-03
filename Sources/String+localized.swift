//
//  String+localized.swift
//  tiny.swift
//
//  Created by YehYungCheng on 2017/2/3.
//  Copyright © 2017年 YehYungCheng. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        var localized = Bundle.main.localizedString(forKey:self, value: nil, table:nil)
        
        if let osBundle = Bundle(identifier: "com.apple.UIKit"), localized == self {
            localized = osBundle.localizedString(forKey:self, value: nil, table:nil)
        }
        
        return localized
    }
}

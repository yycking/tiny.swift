//
//  DispatchQueue+
//  tiny.swift
//
//  Created by YehYungCheng on 2017/2/3.
//  Copyright © 2017年 YehYungCheng. All rights reserved.
//

import Foundation

extension DispatchQueue {
    
    func async(after second: Int, execute workItem: @escaping @convention(block) () -> Swift.Void) {
        let deadlineTime = DispatchTime.now() + .seconds(second)
        self.asyncAfter(deadline: deadlineTime, execute: workItem)
    }
}

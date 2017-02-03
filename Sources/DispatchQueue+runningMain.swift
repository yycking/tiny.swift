//
//  DispatchQueue+runningMain.swift
//  tiny.swift
//
//  Created by YehYungCheng on 2017/2/3.
//  Copyright © 2017年 YehYungCheng. All rights reserved.
//

import Foundation

extension DispatchQueue {
    static func runningMain(after second: Int, execute workItem: @escaping @convention(block) () -> Swift.Void) {
        let deadlineTime = DispatchTime.now() + .seconds(second)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: workItem)
    }
    
    static func runningMain(execute workItem: @escaping @convention(block) () -> Swift.Void) {
        DispatchQueue.main.async(execute: workItem)
    }
}

//
//  Squared.swift
//  tiny.swift
//
//  Created by Wayne Yeh on 2017/2/7.
//  Copyright © 2017年 YehYungCheng. All rights reserved.
//

import UIKit

prefix operator √
prefix func √ (number: Double) -> Double {
    return sqrt(number)
}
let squared = √3 // 1.7320508075688

protocol Squared {
    var ²: Self { get }
}

extension Int: Squared {
    internal var ²: Int {
        return self * self
    }
}

extension Double: Squared {
    internal var ²: Double {
        return self * self
    }
}

extension Float: Squared {
    internal var ²: Float {
        return self * self
    }
}

extension CGFloat: Squared {
    internal var ²: CGFloat {
        return self * self
    }
}

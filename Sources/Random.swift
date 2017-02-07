//
//  Random.swift
//  tiny.swift
//
//  Created by Wayne Yeh on 2017/2/7.
//  Copyright © 2017年 YehYungCheng. All rights reserved.
//

import UIKit

public protocol Random {
    static var random:Self {get}
    var random:Self {get}
}

extension Int: Random {
    public static var random: Int {
        return Int(UInt32.max).random
    }
    
    public var random: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}

extension UInt: Random {
    public static var random: UInt {
        return UInt.max.random
    }
    
    public var random: UInt {
        var temp = self
        if temp > UInt(UInt32.max) {
            temp = UInt(UInt32.max)
        }
        return UInt(arc4random_uniform(UInt32(temp)))
    }
}

extension Float: Random {
    public static var random: Float {
        return Float.greatestFiniteMagnitude.random
    }
    
    public var random: Float {
        return self * Float(UInt.random) / Float(UInt.max)
    }
}

extension Double: Random {
    public static var random: Double {
        return Double.greatestFiniteMagnitude.random
    }
    
    public var random: Double {
        return self * Double(UInt.random) / Double(UInt.max)
    }
}

extension Bool: Random {
    public static var random: Bool {
        return true.random
    }
    
    public var random: Bool {
        return (2.random == 0)
    }
}

extension String: Random {
    public static var random: String {
        return UUID().uuidString.random
    }
    
    public var random: String {
        return self.random(length: self.characters.count)
    }
    
    public func random(length: Int) -> String {
        var randomString = ""
        let base = self.characters
        let len = base.count
        for _ in 0..<length {
            randomString += "\(base[base.index(base.startIndex, offsetBy: len.random)])"
        }
        
        return randomString
    }
    
    public var randomCharacter: Character {
        let base = self.characters
        
        return base[base.index(base.startIndex, offsetBy: base.count.random)]
    }
}

extension CGFloat: Random {
    public static var random: CGFloat {
        return CGFloat.greatestFiniteMagnitude
    }
    
    public var random: CGFloat {
        return self * CGFloat(UInt.random) / CGFloat(UInt.max)
    }
}

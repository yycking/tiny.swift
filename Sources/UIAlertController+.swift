//
//  UIAlertController+.swift
//  tiny.swift
//
//  Created by YehYungCheng on 2017/2/3.
//  Copyright © 2017年 YehYungCheng. All rights reserved.
//

import UIKit

extension UIAlertController {
    convenience init(title: String?) {
        self.init(title:title, message: nil, preferredStyle: .alert)
    }
    
    public func addOk(_ title: String = "OK".localized, action: (() -> Void)? = nil) -> UIAlertController {
        return self.addAction(title, action: action)
    }
    
    public func addCancel(_ title: String = "Cancel".localized, action: (() -> Void)? = nil) -> UIAlertController {
        return self.addAction(title, action: action)
    }
    
    public func addAction(_ title: String, action: (() -> Void)? = nil) -> UIAlertController {
        self.addAction(UIAlertAction(title: title, style: .default) {_ in action?() })
        return self
    }
    
    public func show() {
        guard let vc = UIApplication.shared.keyWindow?.rootViewController else { return }
        DispatchQueue.main.async {
            let animated = (self.actions.count != 0)
            vc.present(self, animated: animated) {
                // auto close if actions is empty
                guard
                    let superview = self.view.superview,
                    self.actions.count == 0
                    else { return }
                
                superview.subviews.first?.backgroundColor = UIColor.clear
                
                UIView.animate(withDuration: 2, animations: {
                    self.view.alpha = 0;
                }, completion: { _ in
                    self.close(animated: false)
                })
            }
        }
    }
    
    public func close(animated: Bool = true) {
        self.dismiss(animated: animated, completion: nil)
    }
}

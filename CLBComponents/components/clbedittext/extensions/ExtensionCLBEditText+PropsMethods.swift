//
//  ExtensionCLBEditText+Methods.swift
//  CLBComponents
//
//  Created EMRE CELEBI Bt on 8/9/18. cLB
//  Copyright © 2018 cLB. All rights reserved.
//

import UIKit

extension CLBTextField {
    internal func clearButtonVisibility(visible: Bool) {
        if(isClearButton) {
            changeVisibleView(visible: visible, view1: self.clearButton, view2: self.infoButton, isView2: self.isInfoButton)
        }
    }
    
    internal func leftClearButtonVisibility(visible: Bool) {
        if(isLeftClearButton) {
            changeVisibleView(visible: visible, view1: self.leftClearButton, view2: self.leftImageView, isView2: self.leftIcon != nil)
        }
    }
    
    // self.button.transform = CGAffineTransform.identity
    internal func changeVisibleView(visible: Bool, view1: UIView, view2: UIView, isView2: Bool) {
        if (visible) {
            view1.visibleView()
            UIView.animate(withDuration: 0.2, animations: {
                view1.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                if(isView2) {
                    UIView.animate(withDuration: 0.1, animations: {
                        view2.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
                    }, completion: { _ in
                        view2.invisibleView()
                    })
                }
            })
        } else {
            UIView.animate(withDuration: 0.1, animations: {
                view1.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            }, completion: { _ in
                view1.invisibleView()
                if(isView2) {
                    view2.visibleView()
                    UIView.animate(withDuration: 0.2, animations: {
                        view2.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    })
                }
            })
        }
    }
}

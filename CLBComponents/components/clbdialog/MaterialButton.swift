//
//  MaterialButton.swift
//  CLBComponents
//
//  Created by Bt on 4/4/18. cLB
//  Copyright © 2018 cLB. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialButtons

@IBDesignable
class MaterialButton: MDCButton {

    @IBInspectable var rippleColor: UIColor = .gray {
        didSet {
            self.inkColor = rippleColor.withAlphaComponent(0.3)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialMyProperties()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initialMyProperties()
    }
    
//    override func prepareForInterfaceBuilder() {
//        initialMyProperties()
//    }

    func initialMyProperties() {
        self.setElevation(ShadowElevation.raisedButtonResting, for: .normal)
        self.setElevation(ShadowElevation.raisedButtonPressed, for: .highlighted)
    }
    
    

}

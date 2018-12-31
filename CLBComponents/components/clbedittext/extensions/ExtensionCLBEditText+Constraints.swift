//
//  ExtensionCLBEditText+Constraints.swift
//  CLBComponents
//
//  Created EMRE CELEBI Bt on 8/9/18. cLB
//  Copyright © 2018 cLB. All rights reserved.
//

import UIKit

extension CLBTextField {
    
    // LEFT ICON
    func addConstraintLeftImageView() {
        addConstraint(NSLayoutConstraint(item: self.leftImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: self.leftImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 8))
        
        leftIconWidthConstraint = NSLayoutConstraint(item: self.leftImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.leftIconWidth)
        leftIconHeightConstraint = NSLayoutConstraint(item: self.leftImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: leftIconHeight)
        
        addConstraint(leftIconWidthConstraint!)
        addConstraint(leftIconHeightConstraint!)
        
    }
    
    // TEXTFIELD
    func addConstraintTextField() {
        addConstraint(NSLayoutConstraint(item: self.textField, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))
        
        textFieldConsLeading = NSLayoutConstraint(item: self.textField, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: leadingConstant)
        textFieldConsTrailing = NSLayoutConstraint(item: self.textField, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -trailingConstant) // NEDEN -(eksi) ile çalışıyor bilmiyorum.
        
        addConstraint(textFieldConsLeading!)
        addConstraint(textFieldConsTrailing!)
    }
    
    // CLEAR ICON
    func addConstraintClearButton() {
        addConstraint(NSLayoutConstraint(item: self.clearButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: self.clearButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -8))
        
        clearButtonWidthConstraint = NSLayoutConstraint(item: self.clearButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.clearButtonWidth)
        
        clearButtonHeightConstraint = NSLayoutConstraint(item: self.clearButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: clearButtonHeight)
        
        addConstraint(clearButtonHeightConstraint!)
        addConstraint(clearButtonWidthConstraint!)
    }
    
    // ERROR LABEl
    func addConstraintErrorLabel() {
        addConstraint(NSLayoutConstraint(item: self.errorLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -4))
        addConstraint(NSLayoutConstraint(item: self.errorLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -8))
    }
    
    // ################################################################################################### //
    
    // LEFT CLEAR ICON
    func addConstraintLeftClearButton() {
        addConstraint(NSLayoutConstraint(item: self.leftClearButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: self.leftClearButton, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 8))
        
        leftClearButtonWidthConstraint = NSLayoutConstraint(item: self.leftClearButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.leftIconWidth)
        leftClearButtonHeightConstraint = NSLayoutConstraint(item: self.leftClearButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: leftIconHeight)
        
        addConstraint(leftClearButtonWidthConstraint!)
        addConstraint(leftClearButtonHeightConstraint!)
    }
    
    // INFO ICON
    func addConstraintInfoButton() {
        addConstraint(NSLayoutConstraint(item: self.infoButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: self.infoButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -8))
        
        infoButtonWidthConstraint = NSLayoutConstraint(item: self.infoButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.clearButtonWidth)
        
        infoButtonHeightConstraint = NSLayoutConstraint(item: self.infoButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: clearButtonHeight)
        
        addConstraint(infoButtonHeightConstraint!)
        addConstraint(infoButtonWidthConstraint!)
    }
}

//
//  ExtensionCardSpinnerView+Constraint.swift
//  CLBComponents
//
//  Created by EMRE CELEBI on 9/3/18. cLB
//  Copyright © 2018 cLB. All rights reserved.
//

import UIKit

extension CLBCardSpinner {

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
        addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))

        textFieldConsLeading = NSLayoutConstraint(item: self.titleLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: leadingConstant)
        textFieldConsTrailing = NSLayoutConstraint(item: self.titleLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -trailingConstant) // NEDEN -(eksi) ile çalışıyor bilmiyorum.

        addConstraint(textFieldConsLeading!)
        addConstraint(textFieldConsTrailing!)
    }

    // RIGHT ICON
    func addConstraintRightImageView() {
        addConstraint(NSLayoutConstraint(item: self.rightImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: self.rightImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -8))

        rightIconWidthConstraint = NSLayoutConstraint(item: self.rightImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.rightIconWidth)

        rightIconHeightConstraint = NSLayoutConstraint(item: self.rightImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.rightIconHeight)

        addConstraint(rightIconWidthConstraint!)
        addConstraint(rightIconHeightConstraint!)
    }

    // ERROR LABEl
    func addConstraintErrorLabel() {
        addConstraint(NSLayoutConstraint(item: self.errorLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -4))
        addConstraint(NSLayoutConstraint(item: self.errorLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -8))
    }
}

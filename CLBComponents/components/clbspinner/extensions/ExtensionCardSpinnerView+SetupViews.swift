//
//  ExtensionCardSpinnerView+SetupViews.swift
//  CLBComponents
//
//  Created by EMRE CELEBI on 9/3/18. cLB
//  Copyright © 2018 cLB. All rights reserved.
//

import UIKit

extension CLBCardSpinner {

    func setupLeftImageView() {
        if leftIcon != nil {
            self.leftImageView.image = leftIcon
            self.leftImageView.image = self.leftImageView.image?.withRenderingMode(.alwaysTemplate)
            self.leftImageView.tintColor = leftIconTintColor
            self.leftIconWidthConstraint?.constant = leftIconWidth
            self.leftIconHeightConstraint?.constant = leftIconHeight

            // FOR TEXTFIELD // 8 textfield için 8 imagedan gelen ve leftIconWidth
            leadingConstant = (8 + 8 + self.leftIconWidth)
            textFieldConsLeading?.constant = leadingConstant
        } else {
            self.leftIconWidthConstraint?.constant = 0
            self.leftIconHeightConstraint?.constant = 0

            // FOR TEXTFIELD
            leadingConstant = 8
            textFieldConsLeading?.constant = leadingConstant
        }
    }

    func setupTitleLabel() {
        self.titleLabel.text = spinnerTitle
        self.titleLabel.textColor = textColor
        self.titleLabel.font = UIFont(name: RobotoFontType.RB_REGULAR.rawValue, size: textSize)
    }

    func setupErrorLabel() {
        self.errorLabel.text = errorMessage
        self.errorLabel.textColor = self.errorColor
        self.errorLabel.font = UIFont(name: RobotoFontType.RB_MEDIUM.rawValue, size: self.errorSize)
    }

    func setupRightImageView() {
        if leftIcon != nil {
            self.rightImageView.image = rightIcon
            self.rightImageView.image = self.rightImageView.image?.withRenderingMode(.alwaysTemplate)
            self.rightImageView.tintColor = rightIconTintColor
            self.rightIconWidthConstraint?.constant = rightIconWidth
            self.rightIconHeightConstraint?.constant = rightIconHeight

            // FOR TEXTFIELD
            trailingConstant = -(8 + 4 + self.rightIconWidth)
            textFieldConsTrailing?.constant = trailingConstant
        } else {
            self.rightIconWidthConstraint?.constant = 0
            self.rightIconHeightConstraint?.constant = 0

            // FOR spinnerTitleLabel
            trailingConstant = -8
            textFieldConsTrailing?.constant = trailingConstant
        }
    }

    // DROP DOWN
    func setupDropDown(dataSource: [String], blockListener: DropDownListener) {
        self.dropDownList.anchorView = self
        self.dropDownList.dataSource = dataSource
        self.dropDownList.width = UIScreen.main.bounds.width
        self.dropDownList.direction = .bottom
        self.dropDownList.bottomOffset = CGPoint(x: 0, y: (self.frame.size.height / 2))
        self.dropDownList.backgroundColor = UIColor.MKColor.Blue.P500
        self.dropDownList.textColor = UIColor.white
        self.dropDownList.selectionBackgroundColor = UIColor.MKColor.Blue.P700!

        self.dropDownList.selectionAction = { [unowned self] (index: Int, item: String) in
            blockListener?(index, item)
        }
    }
}

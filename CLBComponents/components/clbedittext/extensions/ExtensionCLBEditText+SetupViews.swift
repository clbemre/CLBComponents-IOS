//
//  ExtensionCLBEditText+SetupViews.swift
//  CLBComponents
//
//  Created EMRE CELEBI Bt on 8/9/18. cLB
//  Copyright © 2018 cLB. All rights reserved.
//

import UIKit

extension CLBTextField {
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

    func setupTextField() {
        self.textField.delegate = self
        self.textField.text = cardText
        self.textField.textColor = textColor
        self.textField.tintColor = UIColor.MKColor.Blue.P300
        self.textField.maxLength = maxCharacter
        self.textField.keyboardType = UIKeyboardType.init(rawValue: inputType)!
        self.textField.font = UIFont(name: RobotoFontType.RB_REGULAR.rawValue, size: textSize)
        self.attributedHint(text: cardHint)

        onFocusListener { (hasFocus) in
            if(hasFocus) {
                if !((self.textField.text?.isEmpty)!) {
                    self.clearButtonVisibility(visible: true)
                    self.leftClearButtonVisibility(visible: true)
                }
            } else {
                self.clearButtonVisibility(visible: false)
                self.leftClearButtonVisibility(visible: false)
            }
        }
    }
    
    internal func attributedHint(text: String){
        self.textField.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: hintColor, NSAttributedString.Key.font: UIFont(name: RobotoFontType.RB_REGULAR.rawValue, size: hintSize)!])
    }

    func setupClearButton() {
        if (isClearButton) {
            self.clearButton.setImage(clearIconButton?.withRenderingMode(.alwaysTemplate), for: .normal)
            self.clearButton.tintColor = clearButtonTintColor
            self.clearButtonWidthConstraint?.constant = clearButtonWidth
            self.clearButtonHeightConstraint?.constant = clearButtonHeight

            self.clearButton.addTarget(self, action: #selector(tapClearButtons(_sender:)), for: UIControl.Event.touchUpInside)

            // FOR TEXTFIELD
            trailingConstant = -(8 + 4 + self.clearButtonWidth)
            textFieldConsTrailing?.constant = trailingConstant
        } else {
            self.clearButtonWidthConstraint?.constant = 0
            self.clearButtonHeightConstraint?.constant = 0

            // FOR TEXTFIELD
            trailingConstant = -8
            textFieldConsTrailing?.constant = trailingConstant
        }
    }

    func setupErrorLabel() {
        self.errorLabel.text = errorMessage
        self.errorLabel.textColor = self.errorColor
        self.errorLabel.font = UIFont(name: RobotoFontType.RB_MEDIUM.rawValue, size: self.errorSize)
    }

    // ################################################################################################### //

    func setupClearLeftButton() {
        if (isLeftClearButton) {
            self.leftClearButton.setImage(leftClearIconButton?.withRenderingMode(.alwaysTemplate), for: .normal)
            self.leftClearButton.tintColor = leftClearButtonTintColor
            self.leftClearButtonWidthConstraint?.constant = leftClearButtonWidth
            self.leftClearButtonHeightConstraint?.constant = leftClearButtonHeight

            self.leftClearButton.addTarget(self, action: #selector(tapClearButtons(_sender:)), for: UIControl.Event.touchUpInside)

            // FOR TEXTFIELD // 8 textfield için 8 imagedan gelen ve leftIconWidth
            leadingConstant = (8 + 8 + self.leftClearButtonWidth)
            textFieldConsLeading?.constant = leadingConstant
        } else {
            self.leftClearButtonWidthConstraint?.constant = 0
            self.leftClearButtonHeightConstraint?.constant = 0

            // FOR TEXTFIELD
            leadingConstant = 8
            textFieldConsLeading?.constant = leadingConstant
        }
    }

    // ################################################################################################### //

    func setupInfoButton() {
        if (isInfoButton) {
            self.infoButton.setImage(infoIconButton, for: .normal)
            self.infoButton.tintColor = UIColor.red
            self.infoButtonWidthConstraint?.constant = infoButtonWidth
            self.infoButtonHeightConstraint?.constant = infoButtonHeight

            self.infoButton.addTarget(self, action: #selector(tapInfoButtons(_sender:)), for: UIControl.Event.touchUpInside)

            // FOR TEXTFIELD
            trailingConstant = -(8 + 4 + self.clearButtonWidth)
            textFieldConsTrailing?.constant = trailingConstant
        } else {
            self.infoButtonWidthConstraint?.constant = 0
            self.infoButtonHeightConstraint?.constant = 0

            // FOR TEXTFIELD
            trailingConstant = -8
            textFieldConsTrailing?.constant = trailingConstant
        }
    }
}

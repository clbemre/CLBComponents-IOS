//
//  UITextField+Extensions.swift
//  CLBComponents
//
//  Created by EMRE CELEBI on 31.12.2018.
//  Copyright © 2018 cLb. All rights reserved.
//

import UIKit

private var __maxLengths = [UITextField: Int]()
private var __mask = [UITextField: String]()


private var kAssociationKeyMaxLength: Int = 0
extension UITextField {
    
    func setEmptyText() {
        self.text = ""
    }
    
    func enable() {
        isEnabled = true
    }
    
    func disable() {
        isEnabled = false
    }
    
    
    func addLeftImage(imageName: String) {
        self.leftViewMode = UITextField.ViewMode.always
        let mView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        let mImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        mImage.image = UIImage(named: imageName)
        mView.addSubview(mImage)
        self.leftView = mView
    }
    
    func useUnderline() {
        self.layer.sublayers?.forEach {
            if($0.name == "underline") {
                $0.removeFromSuperlayer()
            }
        }
        
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(origin: CGPoint(x: 0, y: self.frame.size.height - borderWidth), size: CGSize(width: self.frame.size.width, height: borderWidth))
        border.borderWidth = borderWidth
        border.name = "underline"
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
    }
    
    
    func changeColorUnderline(color: CGColor) {
        self.layer.sublayers?.forEach {
            if($0.name == "underline") {
                $0.borderColor = color
            }
        }
    }
    
    //------- LATER DELETE
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        let t = textField.text
        textField.text = t?.safelyLimitedTo(length: maxLength)
    }
    
    
    // ################### MAX CHARACTER ###################
    @IBInspectable var maxCharacter: Int {
        get {
            if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int {
                return length
            } else {
                return Int.max
            }
        }
        set {
            objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
            self.addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
        }
    }
    
    //The method is used to cancel the check when use Chinese Pinyin input method.
    //Becuase the alphabet also appears in the textfield when inputting, we should cancel the check.
    func isInputMethod() -> Bool {
        if let positionRange = self.markedTextRange {
            if let _ = self.position(from: positionRange.start, offset: 0) {
                return true
            }
        }
        return false
    }
    
    
    @objc func checkMaxLength(textField: UITextField) {
        
        guard !self.isInputMethod(), let prospectiveText = self.text,
            prospectiveText.count > maxLength
            else {
                return
        }
        
        let selection = selectedTextRange
        let maxCharIndex = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        text = String(prospectiveText[..<maxCharIndex])
        selectedTextRange = selection
    }
    
    // ################### MAX CHARACTER ###################
    
}

//
//  UILabel+Extensions.swift
//  CLBComponents
//
//  Created by EMRE CELEBI on 31.12.2018.
//  Copyright © 2018 cLb. All rights reserved.
//

import UIKit

extension UILabel {

    func setRobotoRegularFont() {
        setCustomFont(name: RobotoFontType.RB_REGULAR.rawValue)
    }

    func setCustomFont(name: String) {
        font = UIFont(name: name, size: self.font.pointSize)
    }

    func setCustomFont(name: String, fontSize: CGFloat) {
        font = UIFont(name: name, size: fontSize)
    }

    func setEmptyText() {
        self.text = ""
    }

    func dynamicHeight() -> CGFloat {
        let label = UILabel(frame: self.bounds)
        label.numberOfLines = self.numberOfLines
        label.lineBreakMode = self.lineBreakMode
        label.font = self.font
        label.text = self.text
        label.sizeToFit()
        return label.frame.size.height
    }

    private struct AssociatedKeys {
        static var padding = UIEdgeInsets()
    }

    public var padding: UIEdgeInsets? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.padding) as? UIEdgeInsets
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.padding, newValue as UIEdgeInsets?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }

    override open func draw(_ rect: CGRect) {
        if let insets = padding {
            self.drawText(in: rect.inset(by: insets))
        } else {
            self.drawText(in: rect)
        }
    }

    override open var intrinsicContentSize: CGSize {
        guard let text = self.text else { return super.intrinsicContentSize }

        var contentSize = super.intrinsicContentSize
        var textWidth: CGFloat = frame.size.width
        var insetsHeight: CGFloat = 0.0

        if let insets = padding {
            textWidth -= insets.left + insets.right
            insetsHeight += insets.top + insets.bottom
        }

        let newSize = text.boundingRect(with: CGSize(width: textWidth, height: CGFloat.greatestFiniteMagnitude),
            options: NSStringDrawingOptions.usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: self.font], context: nil)

        contentSize.height = ceil(newSize.size.height) + insetsHeight

        return contentSize
    }
}


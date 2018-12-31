//
//  UIView+Extensions.swift
//  CLBComponents
//
//  Created by EMRE CELEBI on 31.12.2018.
//  Copyright © 2018 cLb. All rights reserved.
//

import UIKit

enum VerticalLocation: String {
    case bottom
    case top
}

extension UIView {

    func selectedViewBackground(borderColor: UIColor, backgroundColor: UIColor) {
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = false
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = 5.0
        self.backgroundColor = backgroundColor
        self.clipsToBounds = true
    }

    func unSelectedViewBackground() {
        self.layer.borderWidth = 0.0
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = 0.0
        self.backgroundColor = UIColor.clear
        self.clipsToBounds = false
    }

    func zeroAlpha() {
        self.alpha = 0.0
    }

    func fillAlpha() {
        self.alpha = 1.0
    }

    func setCircledWithBorder(color: UIColor) {
        self.layer.borderWidth = 3
        self.layer.masksToBounds = false
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }

    func setCircledWithBorder(color: UIColor, borderWidth: CGFloat) {
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = false
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }

    func shadowLeftRight() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 4.0
        self.layer.masksToBounds = false
        let shadowRect: CGRect = bounds.insetBy(dx: 0, dy: 4)
        layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
    }

    func setCustomCornerRadius(corners: UIRectCorner, wh: CGFloat) {
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.frame
        rectShape.position = self.center
        rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: wh, height: wh)).cgPath
        self.layer.mask = rectShape
    }

    func addShadow(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
        switch location {
        case .bottom:
            addShadow(offset: CGSize(width: 0, height: 1), color: color, opacity: opacity, radius: radius)
        case .top:
            addShadow(offset: CGSize(width: 0, height: -1), color: color, opacity: opacity, radius: radius)
        }
    }

    func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }

    func setDefaultShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
    }

    func getStatusBarAndHiddenAndStyle() -> UIView {
        UIApplication.shared.isStatusBarHidden = false
        UIApplication.shared.statusBarStyle = .lightContent
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        return statusBar
    }

    func toastMessage(view: UIView, message: String) {
        let toastLabel = UILabel(frame: CGRect(x: view.frame.size.width / 2 - 150, y: view.frame.size.height - 100, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.gray
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = NSTextAlignment.center
        view.addSubview(toastLabel)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        toastLabel.font = UIFont.systemFont(ofSize: 12)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseInOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: nil)
    }

    func visibleView() {
        isHidden = false
    }

    func invisibleView() {
        isHidden = true
    }

    func visibleViewWithAlpha() {
        isHidden = false
        alpha = 1.0
    }

    func invisibleViewWithAlpha() {
        isHidden = true
        alpha = 0.0
    }

}

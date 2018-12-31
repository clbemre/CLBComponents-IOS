//
//  GradientBackground.swift
//  CLBComponents
//
//  Created by EMRE CELEBI on 31.12.2018. cLB
//  Copyright © 2018 cLb. All rights reserved.
//

import UIKit
typealias GradientPoints = (startPoint: CGPoint, endPoint: CGPoint)

enum GradientOrientation {
    case topRightBottomLeft
    case topLeftBottomRight
    case horizontal
    case horizontalReverse
    case vertical
    
    var startPoint: CGPoint {
        return points.startPoint
    }
    
    var endPoint: CGPoint {
        return points.endPoint
    }
    
    var points: GradientPoints {
        get {
            switch(self) {
            case .topRightBottomLeft:
                return (CGPoint(x: 0.0, y: 1.0), CGPoint(x: 1.0, y: 0.0))
            case .topLeftBottomRight:
                return (CGPoint(x: 0.0, y: 0.0), CGPoint(x: 1, y: 1))
            case .horizontal:
                return (CGPoint(x: 0.0, y: 0.5), CGPoint(x: 1.0, y: 0.5))
            case .horizontalReverse:
                return (CGPoint(x: 1.0, y: 0.5), CGPoint(x: 0.0, y: 0.5))
            case .vertical:
                return (CGPoint(x: 0.0, y: 0.0), CGPoint(x: 0.0, y: 1.0))
            }
        }
    }
}

extension UIView {
    
    func applyGradient(withColours colours: [UIColor], locations: [NSNumber]? = nil, cornerRadius: CGFloat? = 0) -> Void {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        gradient.cornerRadius = cornerRadius!
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    // self.view.applyGradient([UIColor.yellowColor(), UIColor.blueColor(), UIColor.redColor()], locations: [0.0, 0.5, 1.0])
    func applyGradient(withColours colours: [UIColor], gradientOrientation orientation: GradientOrientation, cornerRadius: CGFloat? = 0) -> Void {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint = orientation.startPoint
        gradient.endPoint = orientation.endPoint
        gradient.cornerRadius = cornerRadius!
        self.layer.insertSublayer(gradient, at: 0)
    }
}

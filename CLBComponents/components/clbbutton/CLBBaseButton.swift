//
//  CLBBaseButton.swift
//  CLBComponents
//
//  Created EMRE CELEBI Bt on 8/9/18. cLB
//  Copyright © 2018 cLB. All rights reserved.
//

import UIKit

@IBDesignable
public class CLBBaseButton: UIButton
{
    @IBInspectable public var maskEnabled: Bool = true {
        didSet {
            clbLayer.maskEnabled = maskEnabled
        }
    }
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
            clbLayer.superLayerDidResize()
        }
    }
    @IBInspectable public var elevation: CGFloat = 0 {
        didSet {
            clbLayer.elevation = elevation
        }
    }
    @IBInspectable public var shadowOffset: CGSize = CGSize.zero {
        didSet {
            clbLayer.shadowOffset = shadowOffset
        }
    }
    @IBInspectable public var roundingCorners: UIRectCorner = UIRectCorner.allCorners {
        didSet {
            clbLayer.roundingCorners = roundingCorners
        }
    }
    @IBInspectable public var rippleEnabled: Bool = true {
        didSet {
            clbLayer.rippleEnabled = rippleEnabled
        }
    }
    @IBInspectable public var rippleDuration: CFTimeInterval = 0.35 {
        didSet {
            clbLayer.rippleDuration = rippleDuration
        }
    }
    @IBInspectable public var rippleScaleRatio: CGFloat = 1.0 {
        didSet {
            clbLayer.rippleScaleRatio = rippleScaleRatio
        }
    }
    @IBInspectable public var rippleLayerColor: UIColor = UIColor.gray {
        didSet {
            clbLayer.setRippleColor(color: rippleLayerColor)
        }
    }
    
    @IBInspectable public var backgroundAnimationEnabled: Bool = true {
        didSet {
            clbLayer.backgroundAnimationEnabled = backgroundAnimationEnabled
        }
    }
    
    override public var bounds: CGRect {
        didSet {
            clbLayer.superLayerDidResize()
        }
    }
    
    private lazy var clbLayer: CLBLayer = CLBLayer(withView: self)
    
    // MARK: Init
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupLayer()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayer()
    }
    
    // MARK: Setup
    private func setupLayer() {
        clbLayer = CLBLayer(withView: self)
        clbLayer.elevation = self.elevation
        self.clipsToBounds = true
        self.layer.cornerRadius = self.cornerRadius
        clbLayer.elevationOffset = self.shadowOffset
        clbLayer.roundingCorners = self.roundingCorners
        clbLayer.maskEnabled = self.maskEnabled
        clbLayer.rippleScaleRatio = self.rippleScaleRatio
        clbLayer.rippleDuration = self.rippleDuration
        clbLayer.rippleEnabled = self.rippleEnabled
        clbLayer.backgroundAnimationEnabled = self.backgroundAnimationEnabled
        clbLayer.setRippleColor(color: self.rippleLayerColor)
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        clbLayer.touchesBegan(touches: touches, withEvent: event)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        clbLayer.touchesEnded(touches: touches, withEvent: event)
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        clbLayer.touchesCancelled(touches: touches, withEvent: event)
    }
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        clbLayer.touchesMoved(touches: touches, withEvent: event)
    }
}

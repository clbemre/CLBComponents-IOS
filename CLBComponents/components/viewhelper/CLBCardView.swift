//
//  CLBBaseCardVie.swift
//  CLBComponents
//
//  Created by EMRE CELEBI on 8/7/18. cLB
//  Copyright © 2018 cLB. All rights reserved.
//

import UIKit

@IBDesignable
open class CLBCardView: UIView {
    
     private var touchListener: TouchListener? = nil
    
    @IBInspectable public var elevation: CGFloat = 5.0 { // old 2
        didSet {
            clbLayer.elevation = elevation
            
        }
    }
    @IBInspectable public var cornerRadius: CGFloat = 2.0 { // old 1
        didSet {
            self.layer.cornerRadius = cornerRadius
            clbLayer.superLayerDidResize()
        }
    }
    @IBInspectable public var shadowOffset: CGSize = CGSize.zero {
        didSet {
            clbLayer.elevationOffset = shadowOffset
        }
    }
    @IBInspectable public var roundingCorners: UIRectCorner = UIRectCorner.allCorners {
        didSet {
            clbLayer.roundingCorners = roundingCorners
        }
    }
    @IBInspectable public var maskEnabled: Bool = true {
        didSet {
            clbLayer.maskEnabled = maskEnabled
        }
    }
    @IBInspectable public var rippleScaleRatio: CGFloat = 1.0 {
        didSet {
            clbLayer.rippleScaleRatio = rippleScaleRatio
        }
    }
    @IBInspectable public var rippleDuration: CFTimeInterval = 0.35 {
        didSet {
            clbLayer.rippleDuration = rippleDuration
        }
    }
    @IBInspectable public var rippleEnabled: Bool = true {
        didSet {
            clbLayer.rippleEnabled = rippleEnabled
        }
    }
    // UIColor(hex: 0xEEEEEE)!
    @IBInspectable public var rippleLayerColor: UIColor = UIColor.lightGray {
        didSet {
            clbLayer.setRippleColor(color: rippleLayerColor)
        }
    }
    @IBInspectable public var backgroundAnimationEnabled: Bool = true {
        didSet {
            clbLayer.backgroundAnimationEnabled = backgroundAnimationEnabled
        }
    }

    override open var bounds: CGRect {
        didSet {
            clbLayer.superLayerDidResize()
        }
    }

    public lazy var clbLayer: CLBLayer = CLBLayer(withView: self)

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupLayer()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayer()
    }

    private func setupLayer() {
        clbLayer.elevation = self.elevation
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

    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        clbLayer.touchesBegan(touches: touches, withEvent: event)
    }

    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        clbLayer.touchesEnded(touches: touches, withEvent: event)
        
        if let touch = touches.first {
            let currentPoint = touch.location(in: self)
            let selfView = self.hitTest(currentPoint, with: event)
            if (selfView == self) {
                // touch inside
                if let touchListener = self.touchListener {
                    touchListener!()
                }
            } else {
                // touch outside
            }
        }
    }

    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        clbLayer.touchesCancelled(touches: touches, withEvent: event)
    }
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        clbLayer.touchesMoved(touches: touches, withEvent: event)
    }
    
    func setTouchListener(block: TouchListener) {
        self.touchListener = block
    }
}

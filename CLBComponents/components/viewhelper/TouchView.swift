//
//  TouchView.swift
//  CLBComponents
//
//  Created by EMRE CELEBI on 8/16/18. cLB
//  Copyright © 2018 cLB. All rights reserved.
//

import UIKit

typealias TouchListener = (() -> Void)?

class TouchView: UIView {

    private var touchListener: TouchListener? = nil
    private var defaultBackgroundColor: UIColor? = nil
    private var pressedBackgroundColor: UIColor? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setTouchListener(block: TouchListener) {
        self.touchListener = block
    }

    func setDefaultBackgroundColor(color: UIColor) {
        self.defaultBackgroundColor = color
    }

    func setPressedBackgroundColor(color: UIColor) {
        self.pressedBackgroundColor = color
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let _ = touch.location(in: self)
            self.backgroundColor = pressedBackgroundColor
        }
    }


    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: self)
            let selfView = self.hitTest(currentPoint, with: event)
            if (selfView == self) {
                // touch inside
                self.backgroundColor = pressedBackgroundColor
            } else {
                // touch outside
                self.backgroundColor = defaultBackgroundColor
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
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

            self.backgroundColor = defaultBackgroundColor
        }
    }
}

//
//  CLBChipView.swift
//  CLBComponents
//
//  Created by EMRE CELEBI on 9/4/18. cLB
//  Copyright © 2018 cLB. All rights reserved.
//

import UIKit

@IBDesignable
class CLBChipView: CLBCardView {

    @IBInspectable public var isSelected: Bool = false

    @IBInspectable var text: String = "" {
        didSet {
            self.setupTitleLabel()
        }
    }

    @IBInspectable public var textSize: CGFloat = 14.0 {
        didSet {
            self.setupTitleLabel()
        }
    }

    @IBInspectable public var textColor: UIColor? = UIColor(hexString: "#616161") {
        didSet {
            self.setupTitleLabel()
        }
    }

    @IBInspectable public var selectedTextColor: UIColor? = UIColor.white {
        didSet {
            self.setupTitleLabel()
        }
    }

    @IBInspectable public var unSelectedBackgroundColor: UIColor? = UIColor.white
    @IBInspectable public var selectedBackgroundColor: UIColor? = UIColor(hexString: "#4CAF50")
    @IBInspectable public var unSelectedRippleColor: UIColor? = UIColor.lightGray
    @IBInspectable public var selectedRippleColor: UIColor? = UIColor(hexString: "#388E3C")

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }

    func commonInit() {
        addViews()
        setupConstraint()
        setupTitleLabel()
        if (isSelected) {
            setSelected()
        }

        self.elevation = 1
        self.cornerRadius = 20
    }

    func addViews() {
        addSubview(self.titleLabel)
    }

    func setupConstraint() {
        self.addConstraintTitleLabel()
    }


    // TEXTFIELD
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

extension CLBChipView {

    private func setupTitleLabel() {
        self.titleLabel.text = text
        self.titleLabel.textColor = textColor
        self.titleLabel.font = UIFont(name: RobotoFontType.RB_REGULAR.rawValue, size: textSize)
    }

    public func setSelected() {
        isSelected = true
        self.titleLabel.textColor = selectedTextColor
        self.backgroundColor = selectedBackgroundColor
        self.rippleLayerColor = selectedRippleColor!
    }

    public func unSelected() {
        isSelected = false
        self.titleLabel.textColor = textColor
        self.backgroundColor = unSelectedBackgroundColor
        self.rippleLayerColor = unSelectedRippleColor!
    }
}

extension CLBChipView {
    private func addConstraintTitleLabel() {
        addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))
    }
}

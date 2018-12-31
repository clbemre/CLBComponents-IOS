//
//  CLBCardSpinner.swift
//  CLBComponents
//
//  Created EMRE CELEBI Bt on 9/3/18. cLB
//  Copyright © 2018 cLB. All rights reserved.
//

import UIKit
import DropDown

typealias DropDownListener = ((Int, String) -> Void)?

@IBDesignable
class CLBCardSpinner: CLBCardView {

    // LEFT IMAGE VIEW
    var leftIconWidthConstraint: NSLayoutConstraint? = nil
    var leftIconHeightConstraint: NSLayoutConstraint? = nil

    // TEXTFIELD
    var leadingConstant: CGFloat = 0
    var textFieldConsLeading: NSLayoutConstraint? = nil
    var trailingConstant: CGFloat = 0
    var textFieldConsTrailing: NSLayoutConstraint? = nil


    // RIGHT IMAGE VIEW
    var rightIconWidthConstraint: NSLayoutConstraint? = nil
    var rightIconHeightConstraint: NSLayoutConstraint? = nil

    internal var onTouchesListener: OnTouchesListener? = nil

    @IBInspectable var spinnerTitle: String = "" {
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

    // ERROR LABEL
    @IBInspectable var errorMessage: String = "" {
        didSet {
            self.setupErrorLabel()
        }
    }

    @IBInspectable public var errorColor: UIColor = UIColor(hexString: "#D32F2F")! {
        didSet {
            self.setupErrorLabel()
        }
    }

    @IBInspectable public var errorSize: CGFloat = 12.0 {
        didSet {
            self.setupErrorLabel()
        }
    }

    // ################################################################################################### //

    @IBInspectable public var leftIcon: UIImage? = nil {
        didSet {
            if leftIcon != nil {
                addSubview(leftImageView)
                self.addConstraintLeftImageView()
            }
            setupLeftImageView()
        }
    }

    @IBInspectable public var leftIconTintColor: UIColor? = UIColor(hexString: "#42A5F5") {
        didSet {
            setupLeftImageView()
        }
    }

    @IBInspectable public var leftIconWidth: CGFloat = 25.0 {
        didSet {
            setupLeftImageView()
        }
    }

    @IBInspectable public var leftIconHeight: CGFloat = 25.0 {
        didSet {
            setupLeftImageView()
        }
    }

    // ################################################################################################### //

    // RIGHT ICON
    @IBInspectable public var rightIcon: UIImage? = nil {
        didSet {
            if rightIcon != nil {
                addSubview(rightImageView)
                self.addConstraintRightImageView()
            }
            setupRightImageView()
        }
    }

    @IBInspectable public var rightIconTintColor: UIColor? = UIColor(hexString: "#42A5F5") {
        didSet {
            setupRightImageView()
        }
    }

    @IBInspectable public var rightIconWidth: CGFloat = 25.0 {
        didSet {
            setupRightImageView()
        }
    }

    @IBInspectable public var rightIconHeight: CGFloat = 25.0 {
        didSet {
            setupRightImageView()
        }
    }


    // ################################################################################################### //

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
        setupErrorLabel()
        setupLeftImageView()
        setupRightImageView()
        shadowOffset = CGSize(width: 0, height: 1)
    }

    func addViews() {
        addSubview(self.titleLabel)
        addSubview(self.errorLabel)
    }

    func setupConstraint() {
        self.addConstraintTextField()
        self.addConstraintErrorLabel()
    }

    // LEFT ICON
    let leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // TEXTFIELD
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // RIGHT ICON
    let rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // ERROR LABEL
    let errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()

    // DROP DOWN
    internal let dropDownList: DropDown = {
        let dropDown = DropDown()
        return dropDown
    }()

}

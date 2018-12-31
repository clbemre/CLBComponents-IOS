//
//  CLBTextField.swift
//  CLBComponents
//
//  Created by Bt on 8/9/18.
//  Copyright © 2018 cLB. All rights reserved.
//

import UIKit

typealias TextFieldDidChangeBlock = ((String?) -> Void)?
typealias TextFieldOnFocusBlock = ((Bool) -> Void)?
typealias OnTouchesListener = (() -> Void)?

@IBDesignable
class CLBTextField: CLBCardView, UITextFieldDelegate {

    // LEFT IMAGE VIEW
    var leftIconWidthConstraint: NSLayoutConstraint? = nil
    var leftIconHeightConstraint: NSLayoutConstraint? = nil

    // TEXTFIELD
    var leadingConstant: CGFloat = 0
    var textFieldConsLeading: NSLayoutConstraint? = nil
    var trailingConstant: CGFloat = 0
    var textFieldConsTrailing: NSLayoutConstraint? = nil

    // CLEAR IMAGE VIEW
    var clearButtonWidthConstraint: NSLayoutConstraint? = nil
    var clearButtonHeightConstraint: NSLayoutConstraint? = nil

    // LEFT CLEAR IMAGE VIEW
    var leftClearButtonWidthConstraint: NSLayoutConstraint? = nil
    var leftClearButtonHeightConstraint: NSLayoutConstraint? = nil

    // CLEAR IMAGE VIEW
    var infoButtonWidthConstraint: NSLayoutConstraint? = nil
    var infoButtonHeightConstraint: NSLayoutConstraint? = nil

    // #######################################_-_T_E_X_T_F_I_E_L_D_-_###################################### //

    internal var completionList: [TextFieldDidChangeBlock] = [TextFieldDidChangeBlock]()
    internal var focusBlock: TextFieldOnFocusBlock? = nil
    internal var onTouchesListener: OnTouchesListener? = nil

    internal var characterSet: CharacterSet? = nil

    internal var infoMessageTitle: String = ""
    internal var infoMessageDescription: String = ""

    public weak var viewController: UIViewController? = nil

    // TEXTFIELD
    @IBInspectable public var isInput: Bool = true {
        didSet {
            self.textField.isEnabled = isInput
        }
    }

    @IBInspectable var cardText: String = "" {
        didSet {
            self.setupTextField()
        }
    }

    @IBInspectable var cardHint: String = "" {
        didSet {
            self.setupTextField()
        }
    }

    @IBInspectable var maxCharacter: Int = Int.max {
        didSet {
            self.setupTextField()
        }
    }

    @IBInspectable var inputType: Int = UIKeyboardType.default.rawValue {
        didSet {
            self.setupTextField()
        }
    }

    @IBInspectable public var textSize: CGFloat = 14.0 {
        didSet {
            self.setupTextField()
        }
    }

    @IBInspectable public var textColor: UIColor? = UIColor(hexString: "#616161") {
        didSet {
            self.setupTextField()
        }
    }

    @IBInspectable public var hintSize: CGFloat = 13.0 {
        didSet {
            self.setupTextField()
        }
    }

    @IBInspectable public var hintColor: UIColor = UIColor(hexString: "#BDBDBD")! {
        didSet {
            self.setupTextField()
        }
    }

    @IBInspectable public var characterSetString: String? = nil {
        didSet {
            if let characterSetString = characterSetString {
                setCharacterSet(characterSetString)
            }
        }
    }

    @IBInspectable public var isSecurityText: Bool = false {
        didSet {
            setSecurityTextForPassword(isSecurityText)
        }
    }

    // #######################################_-_E_R_R_O_R__L_A_B_E_L-_###################################### //

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

    // CLEAR BUTTON
    @IBInspectable public var isClearButton: Bool = false {
        didSet {
            if (isClearButton) {
                addSubview(clearButton)
                self.addConstraintClearButton()
            }
            setupClearButton()
        }
    }

    @IBInspectable public var clearIconButton: UIImage? = nil {
        didSet {
            setupClearButton()
        }
    }

    @IBInspectable public var clearButtonTintColor: UIColor? = UIColor(hexString: "#EF5350") {
        didSet {
            setupClearButton()
        }
    }

    @IBInspectable public var clearButtonWidth: CGFloat = 25.0 {
        didSet {
            setupClearButton()
        }
    }

    @IBInspectable public var clearButtonHeight: CGFloat = 25.0 {
        didSet {
            setupClearButton()
        }
    }

    // #######################################_-_C_L_E_A_R_-_L_E_F_T_-_B_U_T_T_O_N_-_###################################### //

    @IBInspectable public var isLeftClearButton: Bool = false {
        didSet {
            if (isLeftClearButton) {
                addSubview(leftClearButton)
                self.addConstraintLeftClearButton()
            }
            setupClearLeftButton()
        }
    }

    @IBInspectable public var leftClearIconButton: UIImage? = nil {
        didSet {
            setupClearLeftButton()
        }
    }

    @IBInspectable public var leftClearButtonTintColor: UIColor? = UIColor(hexString: "#EF5350") {
        didSet {
            setupClearLeftButton()
        }
    }

    @IBInspectable public var leftClearButtonWidth: CGFloat = 25.0 {
        didSet {
            setupClearLeftButton()
        }
    }

    @IBInspectable public var leftClearButtonHeight: CGFloat = 25.0 {
        didSet {
            setupClearLeftButton()
        }
    }

    // ################################################################################################### //

    // INFO BUTTON
    @IBInspectable public var isInfoButton: Bool = false {
        didSet {
            if (isInfoButton) {
                addSubview(infoButton)
                self.addConstraintInfoButton()
            }
            setupInfoButton()
        }
    }

    @IBInspectable public var infoIconButton: UIImage? = nil {
        didSet {
            setupInfoButton()
        }
    }

    @IBInspectable public var infoButtonTintColor: UIColor? = UIColor(hexString: "#42A5F5") {
        didSet {
            setupInfoButton()
        }
    }

    @IBInspectable public var infoButtonWidth: CGFloat = 25.0 {
        didSet {
            setupInfoButton()
        }
    }

    @IBInspectable public var infoButtonHeight: CGFloat = 25.0 {
        didSet {
            setupInfoButton()
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
        setupTextField()
        setupErrorLabel()
        setupLeftImageView()
        setupClearButton()
        setupClearLeftButton()
        rippleEnabled = false
        shadowOffset = CGSize(width: 0, height: 1)
    }

    func addViews() {
        addSubview(self.textField)
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
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = UITextField.BorderStyle.none
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()

    // CLEAR ICON
    let clearButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()

    let infoButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // ERROR LABEL
    let errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()

    // ################################################################################################### //

    // LEFT ICON
    let leftClearButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
}

/** KEYBOARD TYPE
 0: default // Default type for the current input method.
 
 1: asciiCapable // Displays a keyboard which can enter ASCII characters
 
 2: numbersAndPunctuation // Numbers and assorted punctuation.
 
 3: URL // A type optimized for URL entry (shows . / .com prominently).
 
 4: numberPad // A number pad with locale-appropriate digits (0-9, ۰-۹, ०-९, etc.). Suitable for PIN entry.
 
 5: phonePad // A phone pad (1-9, *, 0, #, with letters under the numbers).
 
 6: namePhonePad // A type optimized for entering a person's name or phone number.
 
 7: emailAddress // A type optimized for multiple email address entry (shows space @ . prominently).
 
 8: decimalPad // A number pad with a decimal point.
 
 9: twitter // A type optimized for twitter text entry (easy access to @ #)
 
 */

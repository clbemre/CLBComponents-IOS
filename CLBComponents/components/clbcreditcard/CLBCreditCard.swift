//
//  CLBCreditCard.swift
//  CLBComponents
//
//  Created by EMRE CELEBI on 9/5/18. cLB
//  Copyright © 2018 cLB. All rights reserved.
//

import UIKit

// if startsWith f -> for FrontView
// if startsWith b -> for BackView
@IBDesignable
class CLBCreditCard: UIView {

    internal var isFrontVisible: Bool = true

    // #################################### FRONT ####################################

    @IBInspectable public var fBackgroundColor: UIColor? = UIColor(hexString: "#FFF3E0") {
        didSet {
            self.fContainerView.backgroundColor = fBackgroundColor
        }
    }

    @IBInspectable public var fBackgroundImage: UIImage? = UIImage(named: "image_world_map.png") {
        didSet {
            if fBackgroundImage != nil {
                self.fContainerView.addSubview(fBackgroundImageView)
                self.fAddConsraintBackgroundImageView()
            }
            self.fSetupBackgroundImageView()
        }
    }

    @IBInspectable public var fTintBackground: UIColor? = UIColor(hexString: "#FFE0B2") {
        didSet {
            self.fSetupBackgroundImageView()
        }
    }

    @IBInspectable public var fOverlayColor: UIColor? = UIColor(hexString: "#FFE0B2") {
        didSet {
            self.setupFOverlayView()
        }
    }

    @IBInspectable public var bankLogoImage: UIImage? = nil {
        didSet {
            if bankLogoImage != nil {
                self.fContainerView.addSubview(imageViewBankLogo)
                self.addConstraintImageViewBankLogo()
            }
            self.setupImageViewBankLogo()
        }
    }

    @IBInspectable var cardNumberText: String = "" {
        didSet {
            self.setupCardNumber()
        }
    }

    @IBInspectable var cardAdSoyadText: String = "" {
        didSet {
            self.setupLblAdSoyad()
        }
    }

    @IBInspectable var cardSonKullanmaTarihiText: String = "" {
        didSet {
            self.setupLblSonKullanmaTarihi()
        }
    }

    @IBInspectable var cardCVCText: String = "" {
        didSet {
            self.setupLblCardCVC()
        }
    }

    // #################################### FRONT ####################################

    // #################################### BACK ####################################

    @IBInspectable public var bBackgroundColor: UIColor? = UIColor(hexString: "#FFF3E0") {
        didSet {
            self.bContainerView.backgroundColor = bBackgroundColor
        }
    }

    @IBInspectable public var bBackgroundImage: UIImage? = UIImage(named: "image_world_map_back.png") {
        didSet {
            if bBackgroundImage != nil {
                self.bContainerView.addSubview(bBackgroundImageView)
                self.bAddConsraintBackgroundImageView()
            }
            self.bSetupBackgroundImageView()
        }
    }

    @IBInspectable public var bTintBackground: UIColor? = UIColor(hexString: "#FFE0B2") {
        didSet {
            self.bSetupBackgroundImageView()
        }
    }

    // #################################### BACK ####################################

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
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.addViews()
        self.setupConstraint()
        self.setupViews()
        self.bContainerView.bringSubviewToFront(self.viewMagneticArea)
    }

    func setupViews() {
        self.fContainerView.backgroundColor = fBackgroundColor
        self.bContainerView.backgroundColor = bBackgroundColor
        self.fContainerView.clipsToBounds = true
        self.bContainerView.clipsToBounds = true

        // FRONTVIEW
        self.setupFOverlayView()

        // BACKVIEW
        self.setupImageViewCrossLine()

        self.showHideViewForFlip(isFrontVisible: self.isFrontVisible)
    }

    func addViews() {
        self.addFContainerView()
        self.addBContainerView()
    }

    func addFContainerView() {
        self.addSubview(self.fContainerView)
        if let _ = fBackgroundImage {
            self.fContainerView.addSubview(fBackgroundImageView)
            self.fAddConsraintBackgroundImageView()
            self.fSetupBackgroundImageView()
        }

        self.fContainerView.addSubview(self.fOverlayView)
        self.fContainerView.addSubview(self.lblCardNumber)
        self.fContainerView.addSubview(self.lblAdSoyad)
        self.fContainerView.addSubview(self.etiketAdSoyad)
        self.fContainerView.addSubview(self.lblSonKullanmaTarihi)
        self.fContainerView.addSubview(self.etiketSonKullanmaTarihi)
    }

    func addBContainerView() {
        self.addSubview(self.bContainerView)
        if let _ = bBackgroundImage {
            self.bContainerView.addSubview(bBackgroundImageView)
            self.bAddConsraintBackgroundImageView()
            self.bSetupBackgroundImageView()
        }

        self.bContainerView.addSubview(self.viewMagneticArea)
        self.bContainerView.addSubview(self.viewCrossLinePattern)
        self.viewCrossLinePattern.addSubview(self.imageViewCrossLinePattern)
        self.viewCrossLinePattern.addSubview(self.lblCardCVC)
    }

    func setupConstraint() {
        self.fSetupContainerViewConstraint()
        self.bSetupContainerViewConstraint()
    }

    func fSetupContainerViewConstraint() {
        self.fAddConstraintContainerView()
        self.addConstraintFOverlayView()
        self.addConstraintLabelCardNumber()
        self.addConstraintLabelAdSoyad()
        self.addConstraintEtiketAdSoyad()
        self.addConstraintLabelSonKullanmaTarihi()
        self.addConstraintEtiketSonKullanmaTarihi()
    }

    func bSetupContainerViewConstraint() {
        self.bAddConstraintContainerView()
        self.addConstraintViewMagneticArea()
        self.addConstraintViewCrossLine()
        self.addConstraintImageViewCrossLine()
        self.addConstraintLabelCardCVC()
    }

    // #################################### FRONT ####################################
    let fContainerView: CLBCardView = {
        let clbCardView = CLBCardView()
        clbCardView.translatesAutoresizingMaskIntoConstraints = false
        clbCardView.rippleEnabled = false
        clbCardView.cornerRadius = 10.0
        clbCardView.layer.masksToBounds = false
        clbCardView.shadowOffset = CGSize(width: 0, height: 1)
        return clbCardView
    }()

    let fBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0.5
        return imageView
    }()

    let fOverlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        view.alpha = 0.3
        return view
    }()

    let imageViewBankLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let lblCardNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.setCustomFont(name: RobotoFontType.RB_BOLD_CONDENSED.rawValue, fontSize: 28.0)
        label.textColor = UIColor.MKColor.Orange.P700
        return label
    }()

    let etiketAdSoyad: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = "Name"
        label.setCustomFont(name: RobotoFontType.RB_CONDENSED.rawValue, fontSize: 12.0)
        label.textColor = UIColor.MKColor.Orange.P300
        return label
    }()

    let lblAdSoyad: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.setCustomFont(name: RobotoFontType.RB_BOLD_CONDENSED.rawValue, fontSize: 16.0)
        label.textColor = UIColor.MKColor.Orange.P500
        return label
    }()

    let etiketSonKullanmaTarihi: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = "Last Date"
        label.setCustomFont(name: RobotoFontType.RB_CONDENSED.rawValue, fontSize: 12.0)
        label.textColor = UIColor.MKColor.Orange.P300
        return label
    }()

    let lblSonKullanmaTarihi: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.setCustomFont(name: RobotoFontType.RB_BOLD_CONDENSED.rawValue, fontSize: 16.0)
        label.textColor = UIColor.MKColor.Orange.P500
        return label
    }()

    // #################################### FRONT ####################################

    // #################################### BACK ####################################
    let bContainerView: CLBCardView = {
        let clbCardView = CLBCardView()
        clbCardView.translatesAutoresizingMaskIntoConstraints = false
        clbCardView.rippleEnabled = false
        clbCardView.cornerRadius = 10
        clbCardView.shadowOffset = CGSize(width: 0, height: 1)
        return clbCardView
    }()

    let bBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0.5
        return imageView
    }()

    let viewMagneticArea: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = UIColor.MKColor.Orange.P700
        return uiView
    }()

    let viewCrossLinePattern: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = UIColor.MKColor.Orange.P400
        return uiView
    }()

    let imageViewCrossLinePattern: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0.4
        return imageView
    }()

    let lblCardCVC: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.setCustomFont(name: RobotoFontType.RB_BOLD_CONDENSED.rawValue, fontSize: 16.0)
        label.textColor = UIColor.MKColor.Orange.P50
        return label
    }()

    // #################################### BACK ####################################
}

// FOR FRONT SETUP VIEWS
extension CLBCreditCard {
    internal func fSetupBackgroundImageView() {
        self.fBackgroundImageView.image = self.fBackgroundImage?.withRenderingMode(.alwaysTemplate)
        self.fBackgroundImageView.contentMode = .scaleToFill
        self.fBackgroundImageView.tintColor = self.fTintBackground
    }

    internal func setupImageViewBankLogo() {
        self.imageViewBankLogo.image = self.bankLogoImage
        self.imageViewBankLogo.contentMode = .scaleAspectFit
        self.fContainerView.bringSubviewToFront(self.imageViewBankLogo)
    }

    internal func setupFOverlayView() {
        self.fOverlayView.backgroundColor = self.fOverlayColor
    }

    internal func setupCardNumber() {
        self.lblCardNumber.text = self.cardNumberText
    }

    internal func setupLblAdSoyad() {
        self.lblAdSoyad.text = self.cardAdSoyadText
    }

    internal func setupLblSonKullanmaTarihi() {
        self.lblSonKullanmaTarihi.text = self.cardSonKullanmaTarihiText
    }
}


// FOR FRONT CONSTRAINT
extension CLBCreditCard {

    internal func fAddConstraintContainerView() {
        let space: CGFloat = 5.0
        let top = NSLayoutConstraint(item: self.fContainerView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: space)
        let leading = NSLayoutConstraint(item: self.fContainerView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: space)
        let trailing = NSLayoutConstraint(item: self.fContainerView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -space)
        let bottom = NSLayoutConstraint(item: self.fContainerView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -space)

        addConstraints([top, leading, trailing, bottom])
    }

    internal func fAddConsraintBackgroundImageView() {
        let top = NSLayoutConstraint(item: self.fBackgroundImageView, attribute: .top, relatedBy: .equal, toItem: self.fContainerView, attribute: .top, multiplier: 1.0, constant: 0)
        let leading = NSLayoutConstraint(item: self.fBackgroundImageView, attribute: .leading, relatedBy: .equal, toItem: self.fContainerView, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: self.fBackgroundImageView, attribute: .trailing, relatedBy: .equal, toItem: self.fContainerView, attribute: .trailing, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: self.fBackgroundImageView, attribute: .bottom, relatedBy: .equal, toItem: self.fContainerView, attribute: .bottom, multiplier: 1.0, constant: 0)

        self.fContainerView.addConstraints([top, leading, trailing, bottom])
    }

    internal func addConstraintFOverlayView() {
        let top = NSLayoutConstraint(item: self.fOverlayView, attribute: .top, relatedBy: .equal, toItem: self.fContainerView, attribute: .top, multiplier: 1.0, constant: 0.0)
        let trailing = NSLayoutConstraint(item: self.fOverlayView, attribute: .trailing, relatedBy: .equal, toItem: self.fContainerView, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let bottom = NSLayoutConstraint(item: self.fOverlayView, attribute: .bottom, relatedBy: .equal, toItem: self.fContainerView, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let equalWidth = NSLayoutConstraint(item: self.fOverlayView, attribute: .width, relatedBy: .equal, toItem: self.fContainerView, attribute: .width, multiplier: 0.5, constant: 0)

        self.fContainerView.addConstraints([top, trailing, bottom, equalWidth])
    }

    internal func addConstraintImageViewBankLogo() {
        let top = NSLayoutConstraint(item: self.imageViewBankLogo, attribute: .top, relatedBy: .equal, toItem: self.fContainerView, attribute: .top, multiplier: 1.0, constant: 16)
        let trailing = NSLayoutConstraint(item: self.imageViewBankLogo, attribute: .trailing, relatedBy: .equal, toItem: self.fContainerView, attribute: .trailing, multiplier: 1.0, constant: -16)
        let width = NSLayoutConstraint(item: self.imageViewBankLogo, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 75)
        let height = NSLayoutConstraint(item: self.imageViewBankLogo, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 38)

        self.fContainerView.addConstraints([top, trailing, width, height])
    }

    internal func addConstraintLabelCardNumber() {
        let centerX = NSLayoutConstraint(item: self.lblCardNumber, attribute: .centerX, relatedBy: .equal, toItem: self.fContainerView, attribute: .centerX, multiplier: 1.0, constant: 0)
        let centerY = NSLayoutConstraint(item: self.lblCardNumber, attribute: .centerY, relatedBy: .equal, toItem: self.fContainerView, attribute: .centerY, multiplier: 1.0, constant: 0)

        self.fContainerView.addConstraints([centerX, centerY])
    }

    internal func addConstraintEtiketAdSoyad() {
        let bottom = NSLayoutConstraint(item: self.etiketAdSoyad, attribute: .bottom, relatedBy: .equal, toItem: self.lblAdSoyad, attribute: .top, multiplier: 1.0, constant: -2.0)
        let leading = NSLayoutConstraint(item: self.etiketAdSoyad, attribute: .leading, relatedBy: .equal, toItem: self.fContainerView, attribute: .leading, multiplier: 1.0, constant: 16.0)

        self.fContainerView.addConstraints([bottom, leading])
    }

    internal func addConstraintLabelAdSoyad() {
        let bottom = NSLayoutConstraint(item: self.lblAdSoyad, attribute: .bottom, relatedBy: .equal, toItem: self.fContainerView, attribute: .bottom, multiplier: 1.0, constant: -12.0)
        let leading = NSLayoutConstraint(item: self.lblAdSoyad, attribute: .leading, relatedBy: .equal, toItem: self.fContainerView, attribute: .leading, multiplier: 1.0, constant: 16.0)

        self.fContainerView.addConstraints([bottom, leading])
    }

    internal func addConstraintEtiketSonKullanmaTarihi() {
        let bottom = NSLayoutConstraint(item: self.etiketSonKullanmaTarihi, attribute: .bottom, relatedBy: .equal, toItem: self.lblSonKullanmaTarihi, attribute: .top, multiplier: 1.0, constant: -2.0)
        let trailing = NSLayoutConstraint(item: self.etiketSonKullanmaTarihi, attribute: .trailing, relatedBy: .equal, toItem: self.fContainerView, attribute: .trailing, multiplier: 1.0, constant: -16.0)

        self.fContainerView.addConstraints([bottom, trailing])
    }

    internal func addConstraintLabelSonKullanmaTarihi() {
        let bottom = NSLayoutConstraint(item: self.lblSonKullanmaTarihi, attribute: .bottom, relatedBy: .equal, toItem: self.fContainerView, attribute: .bottom, multiplier: 1.0, constant: -12.0)
        let trailing = NSLayoutConstraint(item: self.lblSonKullanmaTarihi, attribute: .trailing, relatedBy: .equal, toItem: self.fContainerView, attribute: .trailing, multiplier: 1.0, constant: -16.0)

        self.fContainerView.addConstraints([bottom, trailing])
    }
}

// FOR BACK SETUP VIEWS
extension CLBCreditCard {
    internal func bSetupBackgroundImageView() {
        // let image = UIImage(cgImage: (fBackgroundImage?.withRenderingMode(.alwaysTemplate).cgImage!)!, scale: 1.0, orientation: UIImageOrientation.downMirrored)
        self.bBackgroundImageView.image = bBackgroundImage?.withRenderingMode(.alwaysTemplate)
        self.bBackgroundImageView.contentMode = .scaleToFill
        self.bBackgroundImageView.tintColor = bTintBackground
    }

    internal func setupImageViewCrossLine() {
        self.imageViewCrossLinePattern.image = UIImage(named: "image_cross_line_pattern.png")?.withRenderingMode(.alwaysTemplate)
        self.imageViewCrossLinePattern.tintColor = UIColor.MKColor.Orange.P800
    }

    internal func setupLblCardCVC() {
        self.lblCardCVC.text = cardCVCText
    }
}

// FOR BACK CONSTRAINT
extension CLBCreditCard {

    internal func bAddConstraintContainerView() {
        let space: CGFloat = 5.0
        let top = NSLayoutConstraint(item: self.bContainerView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: space)
        let leading = NSLayoutConstraint(item: self.bContainerView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: space)
        let trailing = NSLayoutConstraint(item: self.bContainerView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -space)
        let bottom = NSLayoutConstraint(item: self.bContainerView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -space)

        addConstraints([top, leading, trailing, bottom])
    }

    internal func bAddConsraintBackgroundImageView() {
        let top = NSLayoutConstraint(item: self.bBackgroundImageView, attribute: .top, relatedBy: .equal, toItem: self.bContainerView, attribute: .top, multiplier: 1.0, constant: 0)
        let leading = NSLayoutConstraint(item: self.bBackgroundImageView, attribute: .leading, relatedBy: .equal, toItem: self.bContainerView, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: self.bBackgroundImageView, attribute: .trailing, relatedBy: .equal, toItem: self.bContainerView, attribute: .trailing, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: self.bBackgroundImageView, attribute: .bottom, relatedBy: .equal, toItem: self.bContainerView, attribute: .bottom, multiplier: 1.0, constant: 0)

        self.bContainerView.addConstraints([top, leading, trailing, bottom])
    }

    internal func addConstraintViewMagneticArea() {
        let top = NSLayoutConstraint(item: self.viewMagneticArea, attribute: .top, relatedBy: .equal, toItem: self.bContainerView, attribute: .top, multiplier: 1.0, constant: 20)
        let leading = NSLayoutConstraint(item: self.viewMagneticArea, attribute: .leading, relatedBy: .equal, toItem: self.bContainerView, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: self.viewMagneticArea, attribute: .trailing, relatedBy: .equal, toItem: self.bContainerView, attribute: .trailing, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: self.viewMagneticArea, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 45.0)

        self.bContainerView.addConstraints([top, leading, trailing, height])
    }

    internal func addConstraintViewCrossLine() {
        let top = NSLayoutConstraint(item: self.viewCrossLinePattern, attribute: .top, relatedBy: .equal, toItem: self.viewMagneticArea, attribute: .bottom, multiplier: 1.0, constant: 8)
        let leading = NSLayoutConstraint(item: self.viewCrossLinePattern, attribute: .leading, relatedBy: .equal, toItem: self.bContainerView, attribute: .leading, multiplier: 1.0, constant: 12)
        let equalWidth = NSLayoutConstraint(item: self.viewCrossLinePattern, attribute: .width, relatedBy: .equal, toItem: self.bContainerView, attribute: .width, multiplier: 0.45, constant: 0)
        let height = NSLayoutConstraint(item: self.viewCrossLinePattern, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 23.0)

        self.bContainerView.addConstraints([top, leading, equalWidth, height])
    }

    internal func addConstraintImageViewCrossLine() {
        let top = NSLayoutConstraint(item: self.imageViewCrossLinePattern, attribute: .top, relatedBy: .equal, toItem: self.viewCrossLinePattern, attribute: .top, multiplier: 1.0, constant: 0)
        let leading = NSLayoutConstraint(item: self.imageViewCrossLinePattern, attribute: .leading, relatedBy: .equal, toItem: self.viewCrossLinePattern, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: self.imageViewCrossLinePattern, attribute: .trailing, relatedBy: .equal, toItem: self.viewCrossLinePattern, attribute: .trailing, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: self.imageViewCrossLinePattern, attribute: .bottom, relatedBy: .equal, toItem: self.viewCrossLinePattern, attribute: .bottom, multiplier: 1.0, constant: 0)

        self.viewCrossLinePattern.addConstraints([top, leading, trailing, bottom])
    }

    internal func addConstraintLabelCardCVC() {
        let top = NSLayoutConstraint(item: self.lblCardCVC, attribute: .top, relatedBy: .equal, toItem: self.viewCrossLinePattern, attribute: .top, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: self.lblCardCVC, attribute: .trailing, relatedBy: .equal, toItem: self.viewCrossLinePattern, attribute: .trailing, multiplier: 1.0, constant: -4)
        let bottom = NSLayoutConstraint(item: self.lblCardCVC, attribute: .bottom, relatedBy: .equal, toItem: self.viewCrossLinePattern, attribute: .bottom, multiplier: 1.0, constant: 0)

        self.viewCrossLinePattern.addConstraints([top, trailing, bottom])
    }
}

// FOR HELPERS
extension CLBCreditCard {
    internal func flipContainerViews() {
        let flipDirection: UIView.AnimationOptions = isFrontVisible ? .transitionFlipFromLeft : .transitionFlipFromRight
        let options: UIView.AnimationOptions = [flipDirection, .showHideTransitionViews]

        UIView.transition(with: self, duration: 0.7, options: options, animations: {
            self.isFrontVisible = !self.isFrontVisible
            self.showHideViewForFlip(isFrontVisible: self.isFrontVisible)
        })
    }
}

// FOR PROPS METHODS
extension CLBCreditCard {

    internal func showHideViewForFlip(isFrontVisible: Bool) {
        if (self.isFrontVisible) {
            self.visibleFrontView()
            self.hiddenBackView()
        } else {
            self.visibleBackView()
            self.hiddenFrontView()
        }
    }

    internal func visibleFrontView() {
        self.fContainerView.visibleView()
        self.fBackgroundImageView.visibleView()

    }

    internal func hiddenFrontView() {
        self.fContainerView.invisibleView()
        self.fBackgroundImageView.invisibleView()

    }

    internal func visibleBackView() {
        self.bContainerView.visibleView()
        self.bBackgroundImageView.visibleView()
    }

    internal func hiddenBackView() {
        self.bContainerView.invisibleView()
        self.bBackgroundImageView.invisibleView()
    }
}

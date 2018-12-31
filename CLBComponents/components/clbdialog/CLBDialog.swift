//
//  CLBDialog.swift
//  CLBComponents
//
//  Created by EMRE CELEBI on 6/11/18. cLB
//  Copyright © 2018 cLB. All rights reserved.
//

import UIKit
import MaterialComponents.MDCCard

typealias CLBDialogBlock = ((CLBDialog?) -> Void)?

class CLBDialog: UIViewController {

    @IBOutlet weak var constraintCardContainer: NSLayoutConstraint!
    @IBOutlet weak var cardContainer: MDCCard!
    @IBOutlet weak var lblContainerTitle: UILabel!
    @IBOutlet weak var lblContainerMessage: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var stackButtons: UIStackView!

    @IBOutlet weak var positiveButton: MaterialButton!
    @IBOutlet weak var neutralButton: MaterialButton!
    @IBOutlet weak var negativeButton: MaterialButton!

    private var defaultHeightDialog: CGFloat = 160.0
    private var lastPositionYCardContainer: CGFloat = 0.0

    // VARIABLE
    private var isPositiveButton: Bool? = nil
    private var positiveText: String? = nil
    private var positiveBlock: CLBDialogBlock = nil

    private var isNegativeButton: Bool? = nil
    private var negativeText: String? = nil
    private var negativeBlock: CLBDialogBlock = nil

    private var isNeutralButton: Bool? = nil
    private var neutralText: String? = nil
    private var neutralBlock: CLBDialogBlock = nil

    private var dialogType: CLBDialog.DialogType? = nil
    private var buttonType: CLBDialog.ButtonType? = nil

    /*
     * SUCCESS
     * */
    private let imageSuccess = "icon_tick_large"
    private let colorSuccessBackground = UIColor.MKColor.LightGreen.P50
    private let colorSuccessImageTint = UIColor.MKColor.LightGreen.P100
    private let colorSuccessTitle = UIColor.MKColor.LightGreen.P500
    private let colorSuccessMesaj = UIColor.MKColor.LightGreen.P400
    private let colorSuccessPositiveButton = UIColor.MKColor.LightGreen.P700
    private let colorSuccessNegativeButton = UIColor.MKColor.LightGreen.P400
    private let colorSuccessNeutralButton = UIColor.MKColor.LightGreen.P200

    /*
     * WARNING
     * */
    private let imageWarning = "icon_warning_large"
    private let colorWarningBackground = UIColor.MKColor.Teal.P50
    private let colorWarningImageTint = UIColor.MKColor.Teal.P100
    private let colorWarningTitle = UIColor.MKColor.Teal.P500
    private let colorWarningMesaj = UIColor.MKColor.Teal.P400
    private let colorWarningPositiveButton = UIColor.MKColor.Teal.P700
    private let colorWarningNegativeButton = UIColor.MKColor.Teal.P400
    private let colorWarningNeutralButton = UIColor.MKColor.Teal.P200

    /*
     * QUESTION
     * */
    private let imageQuestion = "icon_question_large"
    private let colorQuestionBackground = UIColor.MKColor.Orange.P50
    private let colorQuestionImageTint = UIColor.MKColor.Orange.P100
    private let colorQuestionTitle = UIColor.MKColor.Orange.P500
    private let colorQuestionMesaj = UIColor.MKColor.Orange.P400
    private let colorQuestionPositiveButton = UIColor.MKColor.Orange.P700
    private let colorQuestionNegativeButton = UIColor.MKColor.Orange.P400
    private let colorQuestionNeutralButton = UIColor.MKColor.Orange.P200

    /*
     * ERROR
     * */
    private let imageError = "icon_cross_large"
    private let colorErrorBackground = UIColor.MKColor.Red.P50
    private let colorErrorImageTint = UIColor.MKColor.Red.P100
    private let colorErrorTitle = UIColor.MKColor.Red.P500
    private let colorErrorMesaj = UIColor.MKColor.Red.P400
    private let colorErrorPositiveButton = UIColor.MKColor.Red.P700
    private let colorErrorNegativeButton = UIColor.MKColor.Red.P400
    private let colorErrorNeutralButton = UIColor.MKColor.Red.P200

    /*
     * CONTAINER
     * */
    private var colorContainerBackground: UIColor? = nil
    private var imageNameContainer: String? = nil
    private var colorContainerImageTint: UIColor? = nil
    private var colorContainerTitle: UIColor? = nil
    private var colorContainerMessage: UIColor? = nil
    private var colorContainerPositiveButton: UIColor? = nil
    private var colorContainerPositiveButtonText: UIColor? = nil
    private var colorContainerNegativeButton: UIColor? = nil
    private var colorContainerNegativeButtonText: UIColor? = nil
    private var colorContainerNeutralButton: UIColor? = nil
    private var colorContainerNeutralButtonText: UIColor? = nil

    private var mTitle: String?
    private var mMessage: String?
    private var isAutoDismiss: Bool?

    private func constructor(mTitle: String?, mMessage: String?, isAutoDismiss: Bool? = true) {
        self.mTitle = mTitle
        self.mMessage = mMessage
        self.isAutoDismiss = isAutoDismiss
    }

    func constructor(viewController: UIViewController, dialogType: CLBDialog.DialogType?, buttonType: ButtonType?, mTitle: String?, mMessage: String?,
        isPositiveButton: Bool?, positiveText: String?, positiveButtonTextColor: UIColor?, positiveBlock: CLBDialogBlock,
        isNegativeButton: Bool?, negativeText: String?, negativeButtonTextColor: UIColor?, negativeBlock: CLBDialogBlock,
        isNeutralButton: Bool?, neutralText: String?, neutralButtonTextColor: UIColor?, neutralBlock: CLBDialogBlock,
        isAutoDismiss: Bool?) {
        self.constructor(mTitle: mTitle, mMessage: mMessage, isAutoDismiss: isAutoDismiss)

        self.dialogType = dialogType
        self.buttonType = buttonType

        self.isPositiveButton = isPositiveButton
        self.positiveText = positiveText
        self.colorContainerPositiveButtonText = positiveButtonTextColor
        self.positiveBlock = positiveBlock

        self.isNegativeButton = isNegativeButton
        self.negativeText = negativeText
        self.colorContainerNegativeButtonText = negativeButtonTextColor
        self.negativeBlock = negativeBlock

        self.isNeutralButton = isNeutralButton
        self.neutralText = neutralText
        self.colorContainerNeutralButtonText = neutralButtonTextColor
        self.neutralBlock = neutralBlock
    }

    // FOR CUSTOM
    private func constructor(viewController: UIViewController, dialogType: CLBDialog.DialogType?, buttonType: ButtonType?, mTitle: String?, mMessage: String?,
        isPositiveButton: Bool?, positiveText: String?, positiveButtonTextColor: UIColor?, positiveButtonBackgroundColor: UIColor?, positiveBlock: CLBDialogBlock,
        isNegativeButton: Bool?, negativeText: String?, negativeButtonTextColor: UIColor?, negativeButtonBackgroundColor: UIColor?, negativeBlock: CLBDialogBlock,
        isNeutralButton: Bool?, neutralText: String?, neutralButtonTextColor: UIColor?, neutralButtonBackgroundColor: UIColor?, neutralBlock: CLBDialogBlock,
        containerBackgroundColor: UIColor?, imageName: String?, imageTintColor: UIColor?, titleColor: UIColor?, messageColor: UIColor?, isAutoDismiss: Bool?) {
        self.constructor(mTitle: mTitle, mMessage: mMessage, isAutoDismiss: isAutoDismiss)

        self.dialogType = dialogType
        self.buttonType = buttonType

        self.colorContainerBackground = containerBackgroundColor

        self.imageNameContainer = imageName
        self.colorContainerImageTint = imageTintColor

        self.colorContainerTitle = titleColor
        self.colorContainerMessage = messageColor

        self.isPositiveButton = isPositiveButton
        self.positiveText = positiveText
        self.colorContainerPositiveButton = positiveButtonBackgroundColor
        self.colorContainerPositiveButtonText = positiveButtonTextColor
        self.positiveBlock = positiveBlock

        self.isNegativeButton = isNegativeButton
        self.negativeText = negativeText
        self.colorContainerNegativeButton = negativeButtonBackgroundColor
        self.colorContainerNegativeButtonText = negativeButtonTextColor
        self.negativeBlock = negativeBlock

        self.isNeutralButton = isNeutralButton
        self.neutralText = neutralText
        self.colorContainerNeutralButton = neutralButtonBackgroundColor
        self.colorContainerNeutralButtonText = neutralButtonTextColor
        self.neutralBlock = neutralBlock

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        openAnimation()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialComponents()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    func initialComponents() {

        lblContainerTitle.layer.zPosition = 1
        lblContainerMessage.layer.zPosition = 1

        initialDialogTheme()
        lblContainerTitle.text = mTitle
        lblContainerMessage.text = mMessage

        self.cardContainer.inkView.inkColor = colorContainerBackground!.withAlphaComponent(0.001)
        self.cardContainer.setNoneShadowsAllState()

        self.positiveButton.setElevation(ShadowElevation.raisedButtonResting, for: .normal)
        self.positiveButton.setElevation(ShadowElevation.none, for: .highlighted)

        self.neutralButton.setElevation(ShadowElevation.raisedButtonResting, for: .normal)
        self.neutralButton.setElevation(ShadowElevation.none, for: .highlighted)

        self.negativeButton.setElevation(ShadowElevation.raisedButtonResting, for: .normal)
        self.negativeButton.setElevation(ShadowElevation.none, for: .highlighted)

        if(self.isPositiveButton!) {
            setPositiveButton(text: self.positiveText!)
        }

        if(self.isNegativeButton!) {
            setNegativeButton(text: self.negativeText!)
        }

        if(self.isNeutralButton!) {
            setNeutralButton(text: self.neutralText!)
        }


        // CALCULATE TEXT SIZE AND NEW HEIGHT CONTAINER ViEW
        let lastHeightLabelTitle = self.lblContainerTitle.frame.size.height
        let lastHeightLabelMessage = self.lblContainerMessage.frame.size.height

        let dynamicHeightLabelTitle = self.lblContainerTitle.dynamicHeight()
        let dynamicHeightLabelMessage = self.lblContainerMessage.dynamicHeight()


        if lastHeightLabelTitle != dynamicHeightLabelTitle {
            self.defaultHeightDialog += (dynamicHeightLabelTitle - lastHeightLabelTitle)
        }

        if lastHeightLabelMessage != dynamicHeightLabelMessage {
            self.defaultHeightDialog += (dynamicHeightLabelMessage - lastHeightLabelMessage)
        }

        UIView.animate(withDuration: 0.1) {
            self.constraintCardContainer.constant = self.defaultHeightDialog
        }
    }

    func initialDialogTheme() {
        switch self.dialogType?.rawValue {
        case DialogType.SUCCESS.rawValue:
            imageNameContainer = imageSuccess
            colorContainerBackground = colorSuccessBackground
            colorContainerImageTint = colorSuccessImageTint
            colorContainerTitle = colorSuccessTitle
            colorContainerMessage = colorSuccessMesaj
            colorContainerPositiveButton = colorSuccessPositiveButton
            colorContainerNegativeButton = colorSuccessNegativeButton
            colorContainerNeutralButton = colorSuccessNeutralButton

        case DialogType.WARNING.rawValue:
            imageNameContainer = imageWarning
            colorContainerBackground = colorWarningBackground
            colorContainerImageTint = colorWarningImageTint
            colorContainerTitle = colorWarningTitle
            colorContainerMessage = colorWarningMesaj
            colorContainerPositiveButton = colorWarningPositiveButton
            colorContainerNegativeButton = colorWarningNegativeButton
            colorContainerNeutralButton = colorWarningNeutralButton

        case DialogType.QUESTION.rawValue:
            imageNameContainer = imageQuestion
            colorContainerBackground = colorQuestionBackground
            colorContainerImageTint = colorQuestionImageTint
            colorContainerTitle = colorQuestionTitle
            colorContainerMessage = colorQuestionMesaj
            colorContainerPositiveButton = colorQuestionPositiveButton
            colorContainerNegativeButton = colorQuestionNegativeButton
            colorContainerNeutralButton = colorQuestionNeutralButton

        case DialogType.ERROR.rawValue:
            imageNameContainer = imageError
            colorContainerBackground = colorErrorBackground
            colorContainerImageTint = colorErrorImageTint
            colorContainerTitle = colorErrorTitle
            colorContainerMessage = colorErrorMesaj
            colorContainerPositiveButton = colorErrorPositiveButton
            colorContainerNegativeButton = colorErrorNegativeButton
            colorContainerNeutralButton = colorErrorNeutralButton

        case DialogType.CUSTOM.rawValue: break
            // NOTHING HERE
        default:
            // SUCCESS
            imageNameContainer = imageSuccess
            colorContainerBackground = colorSuccessBackground
            colorContainerImageTint = colorSuccessImageTint
            colorContainerTitle = colorSuccessTitle
            colorContainerMessage = colorSuccessMesaj
            colorContainerPositiveButton = colorSuccessPositiveButton
            colorContainerNegativeButton = colorSuccessNegativeButton
            colorContainerNeutralButton = colorSuccessNeutralButton
        }

        imgIcon.image = UIImage(named: imageNameContainer!)
        imgIcon.image = imgIcon.image!.withRenderingMode(.alwaysTemplate)
        imgIcon.tintColor = colorContainerImageTint!

        cardContainer.backgroundColor = colorContainerBackground!

        lblContainerTitle.textColor = colorContainerTitle!
        lblContainerMessage.textColor = colorContainerMessage!

        if(self.isPositiveButton!) {
            positiveButton.backgroundColor = colorContainerPositiveButton
            positiveButton.setTitleColor(colorContainerPositiveButtonText, for: [])
        }

        if(self.isNegativeButton!) {
            negativeButton.backgroundColor = colorContainerNegativeButton
            negativeButton.setTitleColor(colorContainerNegativeButtonText, for: [])
        }

        if(self.isNeutralButton!) {
            neutralButton.backgroundColor = colorContainerNeutralButton
            neutralButton.setTitleColor(colorContainerNeutralButtonText, for: [])
        }

    }

    private func setPositiveButton(text: String) {
        self.positiveButton.isHidden = false
        self.positiveButton.setTitle(text, for: [])
    }

    private func setNegativeButton(text: String) {
        self.defaultHeightDialog += 40.0
        self.negativeButton.isHidden = false
        self.negativeButton.setTitle(text, for: [])
    }

    private func setNeutralButton(text: String) {
        self.defaultHeightDialog += 40.0
        self.neutralButton.isHidden = false
        self.neutralButton.setTitle(text, for: [])
    }

    /**
     * BUTTONS ACTIONS
     */

    @IBAction func positiveAction(_ sender: Any) {
        positiveBlock?(self)
        if (isAutoDismiss!) {
            self.dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func neutralAction(_ sender: Any) {
        neutralBlock?(self)
        if (isAutoDismiss!) {
            self.dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func negativeAction(_ sender: Any) {
        negativeBlock?(self)
        if (isAutoDismiss!) {
            self.dismiss(animated: true, completion: nil)
        }
    }

    private func openAnimation() {
        lastPositionYCardContainer = self.cardContainer.layer.position.y
        self.cardContainer.layer.position.y = self.view.frame.height
        UIView.animate(withDuration: 0.5) {
            self.cardContainer.layer.position.y = self.lastPositionYCardContainer
        }

    }

    enum DialogType: Int {
        case SUCCESS = 0
        case QUESTION = 1
        case WARNING = 2
        case ERROR = 3
        case CUSTOM = 4
    }

    enum ButtonType: Int {
        case VERTICAL = 0
        case HORIZONTAL = 1
    }

    class Builder {

        private var viewController: UIViewController? = nil

        init(viewController: UIViewController) {
            self.viewController = viewController
        }

        private var mTitle: String? = nil
        private var mMessage: String? = nil

        private var isPositiveButton: Bool? = true
        private var positiveText: String? = nil
        private var positiveBlock: CLBDialogBlock = nil

        private var isNegativeButton: Bool? = false
        private var negativeText: String? = nil
        private var negativeBlock: CLBDialogBlock = nil

        private var isNeutralButton: Bool? = false
        private var neutralText: String? = nil
        private var neutralBlock: CLBDialogBlock = nil

        private var buttonType: CLBDialog.ButtonType = CLBDialog.ButtonType.VERTICAL

        /*
         * CUSTOM COLOR - Change it as you like.
         * */

        private var imageNameContainer: String? = "icon_tick_large"
        private var backgroundColor: UIColor? = UIColor.green
        private var imageTintColor: UIColor? = UIColor.red
        private var titleColor: UIColor? = UIColor.white
        private var messageColor: UIColor? = UIColor.white
        private var positiveButtonBackgroundColor: UIColor? = UIColor.green.withAlphaComponent(0.7)
        private var positiveButtonTextColor: UIColor? = UIColor.white
        private var negativeButtonBackgroundColor: UIColor? = UIColor.green.withAlphaComponent(0.7)
        private var negativeButtonTextColor: UIColor? = UIColor.white
        private var neutralButtonBackgroundColor: UIColor? = UIColor.green.withAlphaComponent(0.7)
        private var neutralButtonTextColor: UIColor? = UIColor.white

        func withTitle(title: String) -> Builder {
            self.mTitle = title
            return self
        }

        func withMessage(message: String) -> Builder {
            self.mMessage = message
            return self
        }

        func withPositiveButton(positiveText: String?, block: CLBDialogBlock = nil) -> Builder {
            if let positiveText = positiveText {
                self.isPositiveButton = true
                self.positiveText = positiveText
                self.positiveBlock = block
            }
            return self
        }

        func withNegativeButton(negativeText: String?, block: CLBDialogBlock = nil) -> Builder {
            if let negativeText = negativeText {
                self.isNegativeButton = true
                self.negativeText = negativeText
                self.negativeBlock = block
            }
            return self
        }

        func withNeutralButton(neutralText: String?, block: CLBDialogBlock = nil) -> Builder {
            if let neutralText = neutralText {
                self.isNeutralButton = true
                self.neutralText = neutralText
                self.neutralBlock = block
            }
            return self
        }

        /**
         * - parameter buttonType: Default (CLBDialog.ButtonType) VERTICAL, if you want to set HORIZONTAL
         * */
        func buttonType(buttonType: CLBDialog.ButtonType) -> Builder {
            self.buttonType = buttonType
            return self
        }

        /**
         * - Warning if type == CLBDialog.DialogType.CUSTOM else don't use
         * - parameter imageName: Just image name
         * sample "image_example"
         * - Author cLb
         * */

        func image(imageName: String?) -> Builder {
            self.imageNameContainer = imageName
            return self
        }

        /**
         * - Warning: if type == CLBDialog.DialogType.CUSTOM else don't use
         * - parameter color: Just UIColor
         * sample UIColor.white
         * - Author: cLb
         * */
        func background(color: UIColor?) -> Builder {
            self.backgroundColor = color
            return self
        }

        /**
         * - Warning if type == CLBDialog.DialogType.CUSTOM else don't use
         * - parameter color: Just UIColor
         * sample UIColor.white
         * - Author cLb
         * */
        func imageTint(color: UIColor?) -> Builder {
            self.imageTintColor = color
            return self
        }

        /**
         * - Warning if type == CLBDialog.DialogType.CUSTOM else don't use
         * - parameter color: Just UIColor
         * sample UIColor.white
         * - Author cLb
         * */
        func titleColor(color: UIColor) -> Builder {
            self.titleColor = color
            return self
        }

        /**
         * - Warning if type == CLBDialog.Type.CUSTOM else don't use
         * - parameter color: Just UIColor
         * sample UIColor.white
         * - Author cLb
         * */
        func messageColor(color: UIColor?) -> Builder {
            self.messageColor = color
            return self
        }

        /**
         * - Warning if type == CLBDialog.Type.CUSTOM else don't use
         * - parameter backgroundColor: Just UIColor
         * sample backgroundColor UIColor.white
         * - parameter textColor: Just UIColor
         * sample textColor UIColor.white
         * - Author cLb
         * */
        func positiveButtonColor(backgroundColor: UIColor?, textColor: UIColor? = UIColor.white) -> Builder {
            self.positiveButtonBackgroundColor = backgroundColor
            self.positiveButtonTextColor = textColor
            return self
        }

        /**
         * - Warning if type == CLBDialog.Type.CUSTOM else don't use
         * - parameter backgroundColor: Just UIColor
         * sample backgroundColor UIColor.white
         * - parameter textColor: Just UIColor
         * sample textColor UIColor.white
         * - Author cLb
         * */
        func negativeButtonColor(backgroundColor: UIColor?, textColor: UIColor? = UIColor.white) -> Builder {
            self.negativeButtonBackgroundColor = backgroundColor
            self.negativeButtonTextColor = textColor
            return self
        }

        /**
         * - Warning if type == CLBDialog.Type.CUSTOM else don't use
         * - parameter backgroundColor: Just UIColor
         * sample backgroundColor UIColor.white
         * - parameter textColor: Just UIColor
         * sample textColor UIColor.white
         * - Author cLb
         * */
        func neutralButtonColor(backgroundColor: UIColor?, textColor: UIColor? = UIColor.white) -> Builder {
            self.neutralButtonBackgroundColor = backgroundColor
            self.neutralButtonTextColor = textColor
            return self
        }

        /**
         *
         * - parameter dialogType: Default (CLBDialog.Type) SUCCESS, if you want to change these are  ->  SUCCESS,QUESTION,WARNING,ERROR,CUSTOM
         * - parameter isAutoDismiss: Default true, if you do false -> please use dialog.dismiss() so completionBlock inside (it?.dismiss())
         * - Warning if you change the type of dialog: CUSTOM -> please use image(..), background(..), imageTint(..), titleColor(..), messageColor(..), positiveButtonColor(....), negativeButtonColor(..), neutralButtonColor(..)
         * - Author cLB
         * */
        func show(dialogType: CLBDialog.DialogType = CLBDialog.DialogType.SUCCESS, isAutoDismiss: Bool = true) {
            let dialog = CLBDialog(nibName: "CLBDialog", bundle: nil)
            dialog.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            dialog.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
            if(dialogType == CLBDialog.DialogType.CUSTOM) {
                dialog.constructor(viewController: self.viewController!, dialogType: dialogType, buttonType: self.buttonType, mTitle: self.mTitle, mMessage: self.mMessage,
                    isPositiveButton: self.isPositiveButton, positiveText: self.positiveText, positiveButtonTextColor: self.positiveButtonTextColor, positiveButtonBackgroundColor: self.positiveButtonBackgroundColor, positiveBlock: self.positiveBlock,
                    isNegativeButton: self.isNegativeButton, negativeText: self.negativeText, negativeButtonTextColor: self.negativeButtonTextColor, negativeButtonBackgroundColor: self.negativeButtonBackgroundColor, negativeBlock: self.negativeBlock,
                    isNeutralButton: self.isNeutralButton, neutralText: self.neutralText, neutralButtonTextColor: self.neutralButtonTextColor, neutralButtonBackgroundColor: self.neutralButtonBackgroundColor, neutralBlock: self.neutralBlock, containerBackgroundColor: self.backgroundColor, imageName: self.imageNameContainer, imageTintColor: self.imageTintColor, titleColor: self.titleColor, messageColor: self.messageColor, isAutoDismiss: isAutoDismiss)
            } else {
                dialog.constructor(viewController: self.viewController!, dialogType: dialogType, buttonType: self.buttonType, mTitle: self.mTitle, mMessage: self.mMessage,
                    isPositiveButton: self.isPositiveButton, positiveText: self.positiveText, positiveButtonTextColor: self.positiveButtonTextColor, positiveBlock: self.positiveBlock,
                    isNegativeButton: self.isNegativeButton, negativeText: self.negativeText, negativeButtonTextColor: self.negativeButtonTextColor, negativeBlock: self.negativeBlock,
                    isNeutralButton: self.isNeutralButton, neutralText: self.neutralText, neutralButtonTextColor: self.neutralButtonTextColor, neutralBlock: self.neutralBlock, isAutoDismiss: isAutoDismiss)
            }
            UIView.animate(withDuration: 1.0) {
                self.viewController?.present(dialog, animated: true, completion: nil)
            }
        }
    }
}

extension CLBDialog.Builder {

    static func clbSuccessDialog(_ viewController: UIViewController, title: String = "Başarılı!", message: String,
        positiveText: String = "TAMAM", blockPositive: CLBDialogBlock = nil,
        negativeText: String? = nil, blockNegative: CLBDialogBlock = nil,
        neutralText: String? = nil, blockNeutral: CLBDialogBlock = nil) {
        CLBDialog.Builder(viewController: viewController)
            .withTitle(title: title)
            .withMessage(message: message)
            .withPositiveButton(positiveText: positiveText, block: blockPositive)
            .withNegativeButton(negativeText: negativeText, block: blockNegative)
            .withNeutralButton(neutralText: neutralText, block: blockNeutral)
            .show(dialogType: CLBDialog.DialogType.SUCCESS)
    }

    static func clbWarningDialog(_ viewController: UIViewController, title: String = "Uyarı!", message: String,
        positiveText: String = "TAMAM", blockPositive: CLBDialogBlock = nil,
        negativeText: String? = nil, blockNegative: CLBDialogBlock = nil,
        neutralText: String? = nil, blockNeutral: CLBDialogBlock = nil) {
        CLBDialog.Builder(viewController: viewController)
            .withTitle(title: title)
            .withMessage(message: message)
            .withPositiveButton(positiveText: positiveText, block: blockPositive)
            .withNegativeButton(negativeText: negativeText, block: blockNegative)
            .withNeutralButton(neutralText: neutralText, block: blockNeutral)
            .show(dialogType: CLBDialog.DialogType.WARNING)

    }

    static func clbQuestionDialog(_ viewController: UIViewController, title: String = "?", message: String,
        positiveText: String = "TAMAM", blockPositive: CLBDialogBlock = nil,
        negativeText: String? = nil, blockNegative: CLBDialogBlock = nil,
        neutralText: String? = nil, blockNeutral: CLBDialogBlock = nil) {
        CLBDialog.Builder(viewController: viewController)
            .withTitle(title: title)
            .withMessage(message: message)
            .withPositiveButton(positiveText: positiveText, block: blockPositive)
            .withNegativeButton(negativeText: negativeText, block: blockNegative)
            .withNeutralButton(neutralText: neutralText, block: blockNeutral)
            .show(dialogType: CLBDialog.DialogType.QUESTION)

    }

    static func clbErrorDialog(_ viewController: UIViewController, title: String = "Hata!", message: String,
        positiveText: String = "TAMAM", blockPositive: CLBDialogBlock = nil,
        negativeText: String? = nil, blockNegative: CLBDialogBlock = nil,
        neutralText: String? = nil, blockNeutral: CLBDialogBlock = nil) {
        CLBDialog.Builder(viewController: viewController)
            .withTitle(title: title)
            .withMessage(message: message)
            .withPositiveButton(positiveText: positiveText, block: blockPositive)
            .withNegativeButton(negativeText: negativeText, block: blockNegative)
            .withNeutralButton(neutralText: neutralText, block: blockNeutral)
            .show(dialogType: CLBDialog.DialogType.ERROR)

    }
}

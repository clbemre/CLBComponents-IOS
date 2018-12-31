//
//  ExtensionCLBEditText+Methods.swift
//  CLBComponents
//
//  Created EMRE CELEBI Bt on 8/9/18. cLB
//  Copyright © 2018 cLB. All rights reserved.
//

import UIKit

extension CLBTextField {
    
    func getCardText() -> String? {
        return self.textField.text
    }

    func setCardText(text: String) {
        self.textField.text = text
    }

    func clearText() {
        self.textField.text = ""
        self.textFieldDidChange(self.textField)
    }

    func clearTextWithClearError() {
        self.textField.text = ""
        self.textFieldDidChange(self.textField)
        self.clearError()
    }

    func setCardHint(hint: String) {
        self.attributedHint(text: hint)
    }

    func setError() {
        self.errorLabel.isHidden = false
    }

    func clearError() {
        self.errorLabel.isHidden = true
    }

    func setErrorMessage(_ errorMessage: String) {
        self.errorMessage = errorMessage
        self.errorLabel.text = self.errorMessage
        self.errorLabel.visibleView()
    }

    func clearErrorMessage() {
        self.errorLabel.text = ""
        self.errorLabel.invisibleView()
    }

    /** JUST isInfoIcon == true*/
    func setInfoMessageTitle(messageTitle: String) {
        self.infoMessageTitle = messageTitle
    }

    func setInfoMessageDescription(messageDescription: String) {
        self.infoMessageDescription = messageDescription
    }

    func setInfoMessage(messageTitle: String, messageDescription: String) {
        self.infoMessageTitle = messageTitle
        self.infoMessageDescription = messageDescription
    }
    /** JUST isInfoIcon == true END*/

    func addTextDidChangeCompletion(block: TextFieldDidChangeBlock) {
        completionList.append(block)
    }

    func setSecurityTextForPassword(_ isSecurity: Bool) {
        self.textField.isSecureTextEntry = isSecurity
    }

    func setSecurityTextForPassword() {
        self.textField.isSecureTextEntry = true
    }

    internal func onFocusListener(block: TextFieldOnFocusBlock) {
        self.focusBlock = block
        textField.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
    }

    func setOnTouchesListener(_ block: OnTouchesListener) {
        self.onTouchesListener = block
    }

    func setCharacterSet(_ string: String) {
        characterSet = CharacterSet(charactersIn: string)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.textField.becomeFirstResponder()
        if let onTouchesListener = self.onTouchesListener {
            onTouchesListener!()
        }
    }
}

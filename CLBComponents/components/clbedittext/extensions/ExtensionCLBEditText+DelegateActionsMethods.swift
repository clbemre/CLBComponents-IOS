//
//  ExtensionCLBEditText+DelegateActionsMethods.swift
//  CLBComponents
//
//  Created EMRE CELEBI Bt on 8/9/18. cLB
//  Copyright © 2018 cLB. All rights reserved.
//

import UIKit

extension CLBTextField {

    @objc func tapClearButtons(_sender: UITapGestureRecognizer) {
        clearText()
    }

    @objc func tapInfoButtons(_sender: UITapGestureRecognizer) {
        if (isInfoButton) {
            CLBDialog.Builder.clbWarningDialog(self.viewController!, title: infoMessageTitle, message: infoMessageDescription)
        }
    }

    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    //        guard let text = textField.text else { return true }
    //        if maxCharacter == -1 { return true }
    //        let newLength = text.count + string.count - range.length
    //        return newLength <= self.maxCharacter // Bool
    //    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)

        // let characterSet = CharacterSet(charactersIn: "0123456789.-")
        if let characterSet = self.characterSet {
            return newString.rangeOfCharacter(from: characterSet.inverted) == nil
        } else {
            return true
        }

    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        for completion in completionList {
            completion?(textField.text)
        }
        if !((textField.text?.isEmpty))! {
            leftClearButtonVisibility(visible: true)
            clearButtonVisibility(visible: true)
            clearError()
        } else {
            leftClearButtonVisibility(visible: false)
            clearButtonVisibility(visible: false)
            setError()
        }
    }

    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        self.focusBlock!!(true)
    }

    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        self.focusBlock!!(false)
    }
}

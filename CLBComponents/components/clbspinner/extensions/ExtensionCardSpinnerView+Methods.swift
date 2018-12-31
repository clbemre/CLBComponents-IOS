//
//  ExtensionCardSpinnerView+Methods.swift
//  CLBComponents
//
//  Created by EMRE CELEBI on 9/3/18. cLB
//  Copyright © 2018 cLB. All rights reserved.
//

import UIKit

extension CLBCardSpinner {

    func getCardText() -> String? {
        return self.titleLabel.text
    }

    func setCardText(text: String) {
        self.titleLabel.text = text
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

    func setOnTouchesListener(_ block: OnTouchesListener) {
        self.onTouchesListener = block
    }

    func showDropDown() {
        self.dropDownList.show()
    }

    func dismissDropDown() {
        self.dropDownList.hide()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if let onTouchesListener = self.onTouchesListener {
            onTouchesListener!()
        }
    }
}

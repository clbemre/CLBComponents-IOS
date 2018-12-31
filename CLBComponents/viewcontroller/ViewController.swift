//
//  ViewController.swift
//  CLBComponents
//
//  Created by EMRE CELEBI on 31.12.2018.
//  Copyright © 2018 cLb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clbGradientButton: CLBGradientButton!
    @IBOutlet weak var clbCardSpinner: CLBCardSpinner!

    @IBOutlet weak var clbTextField: CLBTextField!
    
    @IBOutlet weak var clbChipView1: CLBChipView!
    @IBOutlet weak var clbChipView2: CLBChipView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        clbTextField.viewController = self
        clbTextField.setInfoMessage(messageTitle: "Info", messageDescription: "Info Message")
        
        initChipViews()
        
        clbGradientButton.selfApplyGradient(gradientOrientation: GradientOrientation.horizontal)
        clbGradientButton.setDefaultShadow()

        initSpinner()
    }
    
    func initChipViews(){
        self.clbChipView1.setTouchListener {
            self.clbChipView1.setSelected()
            self.clbChipView2.unSelected()
        }
        
        self.clbChipView2.setTouchListener {
            self.clbChipView2.setSelected()
            self.clbChipView1.unSelected()
        }
    }

    func initSpinner() {
        let source: [String] = ["item 1", "item 2", "item 3", "item 4", "item 5", "item 6", "item 7"]
        self.clbCardSpinner.setupDropDown(dataSource: source) { (index, item) in
            print("Selected item: \(source[index]) at index: \(index)")
        }

        self.clbCardSpinner.setTouchListener {
            self.clbCardSpinner.showDropDown()
        }
    }


    @IBAction func ShowSuccessDialog(_ sender: Any) {
        CLBDialog.Builder.clbSuccessDialog(self, title: "Success", message: "Message", positiveText: "Ok", blockPositive: { (dialog) in
            UIView().toastMessage(view: self.view, message: "Ok")
        }, negativeText: "Cancel", blockNegative: { (dialog) in
                UIView().toastMessage(view: self.view, message: "Cancel")
            }, neutralText: "Neutral") { (dialog) in
            UIView().toastMessage(view: self.view, message: "Neutral")
        }
    }

    @IBAction func ShowWarningDialog(_ sender: Any) {
        CLBDialog.Builder.clbWarningDialog(self, title: "Warning", message: "Message", positiveText: "Ok", blockPositive: { (dialog) in
            UIView().toastMessage(view: self.view, message: "Ok")
        }, negativeText: "Cancel", blockNegative: { (dialog) in
                UIView().toastMessage(view: self.view, message: "Cancel")
            }, neutralText: "Neutral") { (dialog) in
            UIView().toastMessage(view: self.view, message: "Neutral")
        }
    }

    @IBAction func ShowQuestionDialog(_ sender: Any) {
        CLBDialog.Builder.clbQuestionDialog(self, title: "Question", message: "Message", positiveText: "Ok", blockPositive: { (dialog) in
            UIView().toastMessage(view: self.view, message: "Ok")
        }, negativeText: "Cancel", blockNegative: { (dialog) in
                UIView().toastMessage(view: self.view, message: "Cancel")
            }, neutralText: "Neutral") { (dialog) in
            UIView().toastMessage(view: self.view, message: "Neutral")
        }
    }

    @IBAction func ShowErrorDialog(_ sender: Any) {
        CLBDialog.Builder.clbErrorDialog(self, title: "Error", message: "Message", positiveText: "Ok", blockPositive: { (dialog) in
            UIView().toastMessage(view: self.view, message: "Ok")
        }, negativeText: "Cancel", blockNegative: { (dialog) in
                UIView().toastMessage(view: self.view, message: "Cancel")
            }, neutralText: "Neutral") { (dialog) in
            UIView().toastMessage(view: self.view, message: "Neutral")
        }
    }

    // HORIZONTAL BUTTON Not ready yet
    @IBAction func ShowCustomDialog(_ sender: Any) {
        CLBDialog.Builder(viewController: self)
            .withTitle(title: "Custom Dialog")
            .withMessage(message: "Custom Dialog Style Message")
            .background(color: UIColor.MKColor.Purple.P50!)
            .image(imageName: "icon_1")
            .imageTint(color: UIColor.MKColor.Purple.P100!)
            .titleColor(color: UIColor.MKColor.Purple.P500!)
            .messageColor(color: UIColor.MKColor.Purple.P400!)
            .buttonType(buttonType: CLBDialog.ButtonType.VERTICAL)
            .positiveButtonColor(backgroundColor: UIColor.MKColor.Purple.P700, textColor: UIColor.white)
            .negativeButtonColor(backgroundColor: UIColor.MKColor.Purple.P400, textColor: UIColor.white)
            .neutralButtonColor(backgroundColor: UIColor.MKColor.Purple.P300, textColor: UIColor.white)
            .withPositiveButton(positiveText: "Positive Button", block: { (dialog) in
                UIView().toastMessage(view: self.view, message: "Positive")
            })
            .withNegativeButton(negativeText: "Negative Button", block: { (dialog) in
                UIView().toastMessage(view: self.view, message: "Negative")
            })
            .withNeutralButton(neutralText: "Neutral Button", block: { (dialog) in
                UIView().toastMessage(view: self.view, message: "Neutral")
            })
            .show(dialogType: CLBDialog.DialogType.CUSTOM, isAutoDismiss: true)
    }
}


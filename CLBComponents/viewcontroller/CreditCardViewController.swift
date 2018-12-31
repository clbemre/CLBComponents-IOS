//
//  CreditCardViewController.swift
//  CLBComponents
//
//  Created by EMRE CELEBI on 31.12.2018.
//  Copyright © 2018 cLb. All rights reserved.
//

import UIKit

class CreditCardViewController: UIViewController {
    @IBOutlet weak var clbCreditCard: CLBCreditCard!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func FlipCreditCard(_ sender: Any) {
        clbCreditCard.flipContainerViews()
    }
}

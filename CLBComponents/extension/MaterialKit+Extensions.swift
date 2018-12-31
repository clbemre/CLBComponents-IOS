//
//  MaterialKit+Extensions.swift
//  CLBComponents
//
//  Created by EMRE CELEBI on 31.12.2018.
//  Copyright © 2018 cLb. All rights reserved.
//

import UIKit
import MaterialComponents

extension MDCCard {
    func setNoneShadowsAllState() {
        self.setShadowElevation(ShadowElevation.none, for: .normal)
        self.setShadowElevation(ShadowElevation.none, for: .highlighted)
        self.setShadowElevation(ShadowElevation.none, for: .selected)
        self.setShadowElevation(ShadowElevation.none, for: .disabled)
        self.setShadowElevation(ShadowElevation.none, for: .focused)
        self.setShadowElevation(ShadowElevation.none, for: .reserved)
    }
}

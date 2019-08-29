//
//  LayerContainerView.swift
//  LoginTask
//
//  Created by Tech Labs on 8/29/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

import UIKit

class LayerContainerView : UIView {
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
}

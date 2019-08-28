//
//  HomeViewController.swift
//  splashScreen
//
//  Created by Jets39 on 7/15/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let label = UILabel(frame: CGRect(x: self.view.bounds.width/2, y: self.view.bounds.height/2, width: 50, height: 50))
        label.text = "Hello"
        label.textColor = UIColor.black
        self.view.addSubview(label)
    }
}

//
//  ViewController.swift
//  splashScreen
//
//  Created by Jets39 on 7/14/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

import UIKit


class SplashViewController: UIViewController {
    var window:UIWindow!
    private let activityView = UIActivityIndicatorView(style: .gray)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(gradientLayer)
        view.addSubview(logoImage)
        view.addSubview(activityView)
        makeServiceCall()
        setUpUI()
    }
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = view.bounds
    }
    let gradientLayer : CAGradientLayer = {
           var layer = CAGradientLayer()
        layer.colors = [UIColor(red: 0xff, green: 0x90, blue: 0x00).cgColor, UIColor(red: 0xff, green: 0x5f, blue: 0x00).cgColor]
        return layer
       }()
    func setUpUI() {
        logoImage.centerEqualTo(view: self.view)
        activityView.centerXequalTo(constraint: self.view.centerXAnchor)
        activityView.bottomEqualTo(constraint: self.view.bottomAnchor, constant: -46)
    }
    let logoImage : UIImageView = {
        let logoImage = UIImageView(image: UIImage(named: "logo"))
        logoImage.widthEqualTo(constant: 250)
        logoImage.heightEqualTo(constant: 275)
        return logoImage
    }()
    func makeServiceCall() {
        self.activityView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+4) {
            self.activityView.stopAnimating()
//           if let _ = UserDefaults.standard.object(forKey: "userName") {
//               AppDelegate.shared.rootViewController.switchToMainScreen()
//           }
//            else {
                AppDelegate.shared.rootViewController.showLoginScreen()
          //  }
               }
           }
}


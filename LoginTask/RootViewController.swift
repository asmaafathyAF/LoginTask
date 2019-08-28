//
//  RootViewController.swift
//  TamatmayaIOS
//
//  Created by Tech Labs on 8/23/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
private var current: UIViewController
    init() {
       self.current = SplashViewController()
       super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)
    }
    func showLoginScreen() {
        let new = ViewControllersProvider.viewController(className: "AuthViewController", storyboard: .Auth) as! LoginViewController
       // let new = UINavigationController(rootViewController: vc)
        addChild(new)
        new.view.frame = view.bounds
        view.addSubview(new.view)
        new.didMove(toParent: self)
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = new
     }
    func switchToMainScreen() {
        let vc = ViewControllersProvider.viewController(className: "HomeViewController", storyboard: .Home) as! HomeViewController
        let new = UINavigationController(rootViewController: vc)
         new.view.frame = view.bounds
              view.addSubview(new.view)
              new.didMove(toParent: self)
              current.willMove(toParent: nil)
              current.view.removeFromSuperview()
              current.removeFromParent()
              current = new
    }
}

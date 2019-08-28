//
//  HomeViewController.swift
//  splashScreen
//
//  Created by Jets39 on 7/15/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

import UIKit
import SVProgressHUD


class LoginViewController: UIViewController  {
    
    let loginAPI = LoginAPI.shared
    @IBOutlet weak var backgrounView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailEditText: UITextField!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordEditText: UITextField!
    
   override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    createIconsToTextFields()
    addShadowToTextFields()
   }
    func setupUI() {
        self.backgrounView.setGradient(firstColorGradient: UIColor(red: 0xff, green: 0x5f, blue: 0x00), secondColorGradient: UIColor(red: 0xff, green: 0x90, blue: 0x00))
        self.loginButton.setGradient(firstColorGradient: UIColor(red: 0xff, green: 0x5f, blue: 0x00), secondColorGradient: UIColor(red: 0xff, green: 0x90, blue: 0x00), startPoint: CGPoint(x: 1.0, y: 0.5), endPoint: CGPoint(x: 0.0, y: 0.5))
        self.backgrounView.roundCorners(corners: UIRectCorner.bottomLeft, radius: self.backgrounView.frame.height/3)
        self.backgrounView.layer.addSublayer(self.logoImageView.layer)
        self.backgrounView.layer.addSublayer(self.loginLabel.layer)
   }
    func addShadowToTextFields() {
        emailEditText.addShadow(shadowRadius:4 ,shadowOpacity: 0.5)
        passwordEditText.addShadow(shadowRadius:4 ,shadowOpacity: 0.5)
    }
    func createIconsToTextFields() {
        let emailIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        emailIcon.image = UIImage(named: "email")
        emailEditText.leftView = emailIcon
        emailEditText.leftViewMode = .always
        let passwordIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        passwordIcon.image = UIImage(named: "password")
        passwordEditText.leftView = passwordIcon
        passwordEditText.leftViewMode = .always
    }
    @IBAction func loginBtn(_ sender: UIButton) {
        guard let email = emailEditText.text , !email.isEmpty else {
            SVProgressHUD.showError(withStatus: "Please fill all required fields")
            return
        }
        guard let password = passwordEditText.text , !password.isEmpty else { SVProgressHUD.showError(withStatus: "Please fill all required fields")
            return
        }
        SVProgressHUD.show()
        loginAPI.login(email: email, password: password, completion: { response, message  in
            SVProgressHUD.dismiss()
           switch response {
            case .success(let result):
                 print(result)
                switch result {
                case true:
                    SVProgressHUD.showSuccess(withStatus: message)
                    AppDelegate.shared.rootViewController.switchToMainScreen()
                case false:
                     SVProgressHUD.showError(withStatus: message)
            }
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}


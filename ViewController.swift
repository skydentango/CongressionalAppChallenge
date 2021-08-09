//
//  ViewController.swift
//  CongressionalAppChallenge2
//
//  Created by Skyden Tang on 7/22/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var WelcomeText: UILabel!
    @IBOutlet weak var SignupButton: UIButton!
    @IBOutlet weak var LoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        positionElements()
        attributesElements()
        let mode = traitCollection.userInterfaceStyle.rawValue
        if mode == 2 {
            SignupButton.layer.borderColor = UIColor.white.cgColor
            SignupButton.setTitleColor(UIColor.white, for: .normal)
            LoginButton.layer.borderColor = UIColor.white.cgColor
            LoginButton.setTitleColor(UIColor.white, for: .normal)
            WelcomeText.layer.borderColor = UIColor.white.cgColor
            
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func OnClickSignup(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeToSignup", sender: nil)
    }
    @IBAction func OnClickLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeToLogin", sender: nil)
    }
    func positionElements(){
        var width = self.view.frame.width
        var height = self.view.frame.height
        WelcomeText.frame = CGRect(x: width * (1.0/8.0), y: (112.0/896.0) * height, width: width * (6.0/8.0), height: (132.0/896.0) * height)
        SignupButton.frame = CGRect(x: width / 4, y: height / 2, width: width / 2, height: (60.0/896.0) * height)
        LoginButton.frame = CGRect(x: width / 4, y: (height / 2) + (SignupButton.frame.height), width: width / 2, height: SignupButton.frame.height)
    }
    func attributesElements(){
        WelcomeText.text = "Welcome to the app"
        WelcomeText.clipsToBounds = true
        WelcomeText.layer.cornerRadius = 15.0
        WelcomeText.layer.borderWidth = 3.0
        WelcomeText.layer.borderColor = UIColor.black.cgColor
        WelcomeText.font = UIFont(name: "Times New Roman", size: 20)
        SignupButton.setTitle("Signup", for: .normal)
        SignupButton.layer.borderWidth = 2.0
        SignupButton.setTitleColor(UIColor.black, for: .normal)
        SignupButton.titleLabel?.font = UIFont(name: "Times New Roman", size: 15)
        SignupButton.clipsToBounds = true
        SignupButton.layer.cornerRadius = 15.0
        LoginButton.setTitle("Login", for: .normal)
        LoginButton.layer.borderWidth = 2.0
        LoginButton.setTitleColor(UIColor.black, for: .normal)
        LoginButton.titleLabel?.font = UIFont(name: "Times New Roman", size: 15)
        LoginButton.clipsToBounds = true
        LoginButton.layer.cornerRadius = 15.0
        
        
    }


}


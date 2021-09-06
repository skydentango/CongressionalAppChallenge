//
//  LoginViewController.swift
//  CongressionalAppChallenge2
//
//  Created by Skyden Tang on 7/22/21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var LoginLabel: UILabel!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var SubmitButton: UIButton!
    @IBOutlet weak var ForgotPassword: UIButton!
    @IBOutlet weak var BackButton: UIButton!
    var passwordResetEmail = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        createElements()
        // Do any additional setup after loading the view.
    }
    func createElements(){
        
        LoginLabel.textAlignment = .center
        LoginLabel.text = "Login"
        LoginLabel.layer.borderWidth = 2.0
        LoginLabel.layer.borderColor = UIColor.black.cgColor
        LoginLabel.clipsToBounds = true
        LoginLabel.layer.cornerRadius = 15.0
        LoginLabel.font = UIFont(name: "Times New Roman", size: 20)
        let textFieldY = self.view.frame.height / 3
        
        LoginLabel.frame = CGRect(x: self.view.frame.width / 4, y: self.view.frame.height / 8, width: self.view.frame.width / 2 , height: 50)
        EmailTextField.frame = CGRect(x: self.view.frame.width / 6, y: self.view.frame.height / 3, width: self.view.frame.width * 4.0/6.0, height: EmailTextField.frame.height)
        PasswordTextField.frame = CGRect(x: self.view.frame.width / 6, y: textFieldY + PasswordTextField.frame.height + 10, width: self.view.frame.width * 4.0/6.0, height: PasswordTextField.frame.height)
        SubmitButton.frame = CGRect(x: self.view.frame.width * 3.0/8.0, y: PasswordTextField.frame.maxY + 10, width: self.view.frame.width * 1.0/4.0, height: SubmitButton.frame.height)
        ForgotPassword.frame = CGRect(x: self.view.frame.width * 1.0/4.0, y: SubmitButton.frame.maxY + 10, width: self.view.frame.width * 1.0/2.0, height: SubmitButton.frame.height)
        BackButton.frame = CGRect(x: self.view.frame.width * 3.0/8.0, y: self.view.frame.maxY - 50, width: self.view.frame.width * 1.0/4.0, height: SubmitButton.frame.height)
        SubmitButton.setTitleColor(UIColor.black, for: .normal)
        BackButton.setTitleColor(UIColor.black, for: .normal)
        SubmitButton.titleLabel?.font = UIFont(name: "Times New Roman", size: 20)
        BackButton.titleLabel?.font = UIFont(name: "Times New Roman", size: 20)
        SubmitButton.setTitle("Submit", for: .normal)
        BackButton.setTitle("Back", for: .normal)
        ForgotPassword.titleLabel?.font = UIFont(name: "Times New Roman", size: 20)
        ForgotPassword.setTitle("Forgot Password?", for: .normal)
        ForgotPassword.setTitleColor(UIColor.black, for: .normal)
    }
    
    
    @IBAction func OnSubmit(_ sender: Any) {
        Auth.auth().signIn(withEmail: EmailTextField.text!, password: PasswordTextField.text! ){ (user, error) in
            if error == nil{
                self.performSegue(withIdentifier: "LoginToHome", sender: nil)
            }else{
                self.alert(message: "Please enter a valid email or password", title: "Error")
            }
        }
    }
    
    @IBAction func OnForgotPassword(_ sender: Any) {
        passwordResetAlert()
        
    }
    func passwordResetAlert(){
        let alert = UIAlertController(title: "Password Reset", message: "Please enter email for password reset link:", preferredStyle: UIAlertController.Style.alert)
        let email = UIAlertAction(title: "Enter", style: .default){
            UIAlertAction in
            let textField = alert.textFields![0] as UITextField
            if let text = textField.text {
                self.passwordResetEmail = text
            }
            Auth.auth().sendPasswordReset(withEmail: self.passwordResetEmail){ error in
                if error == nil {
                    self.alert(message: "Please check \(self.passwordResetEmail) to reset your password", title: "Password Email Verification Success")
                }else{
                    self.alert(message: "Please enter a valid email", title: "Error")
                }
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        alert.addTextField{ (textField) in
            textField.placeholder = "Email:"
        }
        alert.addAction(email)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func OnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func alert(message: String, title: String){
        var myalert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        myalert.addAction(ok)
        self.present(myalert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

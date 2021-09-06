//
//  SignupViewController.swift
//  CongressionalAppChallenge2
//
//  Created by Skyden Tang on 7/22/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class SignupViewController: UIViewController {

    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var SignupButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var ConfirmPassword: UITextField!
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        createElements()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    func createElements(){
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: self.view.frame.width / 4, y: self.view.frame.height / 8, width: self.view.frame.width / 2 ,height: 50)
        titleLabel.text = "Signup"
        titleLabel.font = UIFont(name: "Times New Roman", size: 20)
        titleLabel.textAlignment = .center
        titleLabel.layer.borderWidth = 2.0
        titleLabel.clipsToBounds = true
        titleLabel.layer.cornerRadius = 15.0
        self.view.addSubview(titleLabel)
        
        var textFieldY = self.view.frame.height / 3
        NameTextField.frame = CGRect(x: self.view.frame.width / 6, y: self.view.frame.height / 3, width: self.view.frame.width * 4.0/6.0, height: NameTextField.frame.height)
        EmailTextField.frame = CGRect(x: self.view.frame.width / 6, y: textFieldY + NameTextField.frame.height + 10, width: self.view.frame.width * 4.0/6.0, height: NameTextField.frame.height)
        PasswordTextField.frame = CGRect(x: self.view.frame.width / 6, y: textFieldY + NameTextField.frame.height * 2 + 20, width: self.view.frame.width * 4.0/6.0, height: NameTextField.frame.height)
        ConfirmPassword.frame = CGRect(x: self.view.frame.width / 6, y: textFieldY + NameTextField.frame.height * 3 + 30 , width: self.view.frame.width * 4.0/6.0 , height: NameTextField.frame.height)
        SignupButton.frame = CGRect(x: self.view.frame.width * 3.0/8.0, y: ConfirmPassword.frame.maxY + 10, width: self.view.frame.width * 1.0/4.0, height: SignupButton.frame.height)
        backButton.frame = CGRect(x: self.view.frame.width * 3.0/8.0, y: self.view.frame.maxY - 50, width: self.view.frame.width * 1.0/4.0, height: SignupButton.frame.height)
        SignupButton.setTitleColor(UIColor.black, for: .normal)
        backButton.setTitleColor(UIColor.black, for: .normal)
        SignupButton.titleLabel?.font = UIFont(name: "Times New Roman", size: 20)
        backButton.titleLabel?.font = UIFont(name: "Times New Roman", size: 20)
        SignupButton.setTitle("Submit", for: .normal)
        backButton.setTitle("Back", for: .normal)


        
    }
    @IBAction func OnSignup(_ sender: Any) {
        if verification(){
            Auth.auth().createUser(withEmail: EmailTextField.text!, password: PasswordTextField.text!){ (user, error) in
                if (error == nil){
                    self.ref.child(Auth.auth().currentUser!.uid).child("Name").setValue(self.NameTextField.text!)
                    Auth.auth().currentUser!.sendEmailVerification{ (error) in
                        guard let error = error else {
                            return print("Sent verification email")
                        }
                    }
                    self.alert1(message: "Please verify email by clicking on the link that was sent to " + self.EmailTextField.text! + " and when you return to the app, use the login screen to sign in." , title: "Verification")
                    
                }else{
                    self.alert(message: "Please enter a valid email/password or enter an email that is not already taken", title: "Error")
                }
            }
        }else{
            alert(message: "Please enter valid information", title: "Error")
        }
    }
    func verification() -> Bool{
        if ConfirmPassword.text! != PasswordTextField.text!{
            return(false)
        }else if ConfirmPassword.text?.count == 0 || PasswordTextField.text?.count == 0 || EmailTextField.text?.count == 0 || NameTextField.text?.count == 0 {
            return(false)
        }
        return(true)
    }
    func alert(message: String, title: String){
        var myalert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        myalert.addAction(ok)
        self.present(myalert, animated: true, completion: nil)
    }
    func alert1(message: String, title: String){
        var myalert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.dismiss(animated: true, completion: nil)
        }
        myalert.addAction(ok)
        self.present(myalert, animated: true, completion: nil)
    }
    @IBAction func OnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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

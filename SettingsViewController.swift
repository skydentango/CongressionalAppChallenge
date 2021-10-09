//
//  SettingsViewController.swift
//  CongressionalAppChallenge2
//
//  Created by Skyden Tang on 9/25/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class SettingsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    var ref: DatabaseReference?
    
    var settings = ["Clear Cache"]
        var logOut = ["Log out"]
        override func viewDidLoad() {
            super.viewDidLoad()
            ref = Database.database().reference()
            setConstraints()
            TableView.delegate = self
            TableView.dataSource = self
            TableView.reloadData()
        }
        func setConstraints() {
            TitleLabel.frame = CGRect(x: 0, y: self.view.frame.height/3.0, width: self.view.frame.width, height: 75)
            TableView.frame = CGRect(x: self.view.frame.width/4.0, y: TitleLabel.frame.maxY + 15.0, width: self.view.frame.width/2.0, height: 87)
            TitleLabel.textAlignment = .center
            TitleLabel.text = "Settings"
            backButton.frame = CGRect(x: self.view.frame.width/4.0, y: TableView.frame.maxY + 10, width: self.view.frame.width/2.0, height: backButton.frame.height)
           
            backButton.setTitle("Back", for: .normal)
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.section == 0 {
             
                alert(message: "Are you sure you want to clear your Prescription history?")
                    
                
        
                
            }
            else {
                do {
                    try Auth.auth().signOut()
                } catch let signOutError as NSError{
                    
                }
                self.performSegue(withIdentifier: "SettingstoInitial", sender: nil)
                
                
            }
            
                
        }
        func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if(section == 0){
                return settings.count
            }
            else {
                return logOut.count
            }
        
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell = TableView.dequeueReusableCell(withIdentifier: "Settings", for: indexPath)
            if indexPath.section == 0 {
                cell.textLabel?.textColor = UIColor.blue
                
                cell.textLabel?.text = settings[indexPath.row]
                
            }
            else {
                cell.textLabel?.textColor = UIColor.red
                cell.textLabel?.text = logOut[indexPath.row]
            }
            return cell
            
        }
    func alert(message: String){
        var myAlert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        var ok = UIAlertAction(title: "Ok", style: .default){ UIAlertAction in
            self.ref?.child(Auth.auth().currentUser!.uid).child("Prescriptions").setValue(nil)
            self.performSegue(withIdentifier: "SettingsToHome", sender: nil)
        }
        var cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        myAlert.addAction(ok)
        myAlert.addAction(cancel)
        self.present(myAlert, animated: true)
        
        
    }
    @IBAction func OnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

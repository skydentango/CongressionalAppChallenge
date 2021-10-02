//
//  ViewController.swift
//  TestApp
//
//  Created by Sheela Ravindran on 10/2/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var TitleLabel: UILabel!
    var settings = ["View Profile","Forgot Password"]
    var logOut = ["Log out"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        TableView.delegate = self
        TableView.dataSource = self
        TableView.reloadData()
    }
    @IBAction func OnButton(_ sender: Any) {
        performSegue(withIdentifier: "Transition", sender: nil)
    }
    func setConstraints() {
        TitleLabel.frame = CGRect(x: 0, y: self.view.frame.height/3.0, width: self.view.frame.width, height: 75)
        TableView.frame = CGRect(x: self.view.frame.width/4.0, y: TitleLabel.frame.maxY + 15.0, width: self.view.frame.width/2.0, height: self.view.frame.height/3.0)
        TitleLabel.textAlignment = .center
        TitleLabel.text = "Settings"
       
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                //perform Segue to ViewProfile View controller
            }
            else {
                //alert to reset password
            }
            
        }
        else {
           //log out of firebase and go to homepage
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
        var cell = TableView.dequeueReusableCell(withIdentifier: "SettingsInfo", for: indexPath)
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
}


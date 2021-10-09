//
//  ProfileViewController.swift
//  CongressionalAppChallenge2
//
//  Created by Skyden Tang on 10/6/21.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
class ProfileViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var Prescription = ""
    var ref: DatabaseReference?
    var Categories = ["AM/PM", "Frequency", "Prescription Amount", "Starting Time"]
    var values: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        ref?.child(Auth.auth().currentUser!.uid).child("Prescriptions").child(Prescription).observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as? NSDictionary
            self.values.append(value?["AM_PM"] as? String ?? "")
            self.values.append(value?["Frequency"] as? String ?? "")
            self.values.append("\(value?["Prescription Amount"] as? Int ?? 0)")
            self.values.append(value?["Starting_Time"] as? String ?? "")
        })
        
        
        setConstraints()
        
        print(Prescription)
        // Do any additional setup after loading the view.
    }
    func setConstraints(){
        titleLabel.frame = CGRect(x: self.view.frame.width/4.0, y: self.view.frame.minY + 50, width: self.view.frame.width/2.0, height: titleLabel.frame.height)
        tableView.frame = CGRect(x: self.view.frame.width/4.0, y: titleLabel.frame.maxY + 50, width: self.view.frame.width/2.0, height: self.view.frame.height/2.0)
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

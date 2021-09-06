//
//  HomeViewController.swift
//  CongressionalAppChallenge2
//
//  Created by Skyden Tang on 8/2/21.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var EnterPrescription: UIButton!
    @IBOutlet weak var ViewPrescription: UIButton!
    @IBOutlet weak var Settings: UIButton!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var HelpButton: UIButton!
    @IBOutlet weak var PrescriptionTableView: UITableView!
    var prescriptions: [String] = []
    var tabelViewHidden = true
    var remove = false
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConstraints()
        setAttributes()
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(prescriptions.count)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Prescriptions", for: indexPath)
        let removeButton = cell.viewWithTag(1) as! UIButton
        if remove{
            removeButton.isHidden = false
        }else{
            removeButton.isHidden = true
        }
        return cell
    }
    func setConstraints(){
        TitleLabel.frame = CGRect(x: self.view.frame.width / 4, y: self.view.frame.height / 8, width: self.view.frame.width / 2 , height: 50)
        EnterPrescription.frame = CGRect(x: self.view.frame.width * 2.0/8.0, y: TitleLabel.frame.maxY + 100, width: self.view.frame.width * 1.0/2.0, height: EnterPrescription.frame.height)
        ViewPrescription.frame = CGRect(x: self.view.frame.width * 2.0/8.0, y: EnterPrescription.frame.maxY + 10, width: self.view.frame.width * 1.0/2.0, height: EnterPrescription.frame.height)
        Settings.frame = CGRect(x: self.view.frame.width * 3.0/8.0, y: self.view.frame.maxY - 50, width: self.view.frame.width * 1.0/4.0, height: Settings.frame.height)
        HelpButton.frame = CGRect(x: self.view.frame.maxX - (self.view.frame.width * 1.0/4.0) - 20, y: self.view.frame.maxY - 50, width: self.view.frame.width * 1.0/4.0, height: Settings.frame.height)
    }
    func setAttributes(){
        TitleLabel.textAlignment = .center
        TitleLabel.layer.borderWidth = 2.0
        TitleLabel.clipsToBounds = true
        TitleLabel.layer.cornerRadius = 15.0
        TitleLabel.font = UIFont(name: "Times New Roman", size: 20.0)
        TitleLabel.text = "Prescriptions"
        EnterPrescription.setTitle("Edit Prescription", for: .normal)
        ViewPrescription.setTitle("View Prescription", for: .normal)
        Settings.setTitle("Settings", for: .normal)
        HelpButton.setTitle("?", for: .normal)
        
    }
    @IBAction func OnEnterPrescription(_ sender: Any) {
        alert(message: "Add/Remove a prescription", title: "Edit Options")
    }
    
    @IBAction func OnViewPrescription(_ sender: Any) {
        if tabelViewHidden{
            PrescriptionTableView.isHidden = false
            tabelViewHidden = false
        }else{
            PrescriptionTableView.isHidden = true
            tabelViewHidden = true
        }
    }
    
    @IBAction func OnSettings(_ sender: Any) {
    }
    @IBAction func OnHelp(_ sender: Any) {
    }
    
    func alert(message: String, title: String){
        var myalert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let add = UIAlertAction(title: "Add Prescription", style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.performSegue(withIdentifier: "HomeToPrescription", sender: nil)
        }
        let remove = UIAlertAction(title: "Remove Prescription", style: UIAlertAction.Style.destructive) {
            UIAlertAction in
            self.remove = true
            self.PrescriptionTableView.delegate = self
            self.PrescriptionTableView.dataSource = self
            self.PrescriptionTableView.reloadData()
        }
        
        myalert.addAction(add)
        myalert.addAction(remove)
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


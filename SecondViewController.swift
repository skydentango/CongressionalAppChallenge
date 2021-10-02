//
//  SecondViewController.swift
//  TestApp
//
//  Created by Sheela Ravindran on 10/2/21.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var HelpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func OnHelp(_ sender: Any) {
        alert(message: "Help")
        
    }
    func alert(message: String){
        var myAlert = UIAlertController(title: "Help", message: message, preferredStyle: UIAlertController.Style.alert)
        var okay = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okay)
        self.present(myAlert, animated: true)
        
        
        
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

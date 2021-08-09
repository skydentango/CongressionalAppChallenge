//
//  HomeViewController.swift
//  CongressionalAppChallenge2
//
//  Created by Skyden Tang on 8/2/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var EnterPrescription: UIButton!
    @IBOutlet weak var ViewPrescription: UIButton!
    @IBOutlet weak var Settings: UIButton!
    @IBOutlet weak var TitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()

        // Do any additional setup after loading the view.
    }
    func setConstraints(){
        TitleLabel.frame = CGRect(x: self.view.frame.width / 4, y: self.view.frame.height / 8, width: self.view.frame.width / 2 , height: 50)
        EnterPrescription.frame = CGRect(x: self.view.frame.width * 2.0/8.0, y: TitleLabel.frame.maxY + 100, width: self.view.frame.width * 1.0/2.0, height: EnterPrescription.frame.height)
        ViewPrescription.frame = CGRect(x: self.view.frame.width * 2.0/8.0, y: EnterPrescription.frame.maxY + 10, width: self.view.frame.width * 1.0/2.0, height: EnterPrescription.frame.height)
        Settings.frame = CGRect(x: self.view.frame.width * 3.0/8.0, y: self.view.frame.maxY - 50, width: self.view.frame.width * 1.0/4.0, height: Settings.frame.height)
    }
    @IBAction func OnEnterPrescription(_ sender: Any) {
    }
    
    @IBAction func OnViewPrescription(_ sender: Any) {
    }
    
    @IBAction func OnSettings(_ sender: Any) {
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

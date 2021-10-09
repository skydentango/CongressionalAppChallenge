//
//  HelpViewController.swift
//  CongressionalAppChallenge2
//
//  Created by Skyden Tang on 10/2/21.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var HelpLabel: UILabel!
    @IBOutlet weak var HelpTextView: UITextView!
    @IBOutlet weak var BackButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()

        // Do any additional setup after loading the view.
    }
    func setConstraints(){
        HelpLabel.frame = CGRect(x: self.view.frame.width/4.0, y: 50, width: self.view.frame.width/2.0, height: 50)
        HelpTextView.frame = CGRect(x: 25, y: HelpLabel.frame.maxY + 50, width: self.view.frame.width - 50, height: self.view.frame.height - (HelpLabel.frame.maxY + 50)-100)
        BackButton.frame = CGRect(x: self.view.frame.width/4.0, y: HelpTextView.frame.maxY + 25, width: self.view.frame.width/2.0, height: 50)
        HelpLabel.textAlignment = .center
        HelpLabel.text = "Help"
        BackButton.setTitle("Back", for: .normal)
        
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

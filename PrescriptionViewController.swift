//
//  PrescriptionViewController.swift
//  CongressionalAppChallenge2
//
//  Created by Skyden Tang on 8/9/21.
//

import UIKit

class PrescriptionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var presName: UITextField!
    @IBOutlet weak var presAmnt: UITextField!
    @IBOutlet weak var presDuration: UIPickerView!
    @IBOutlet weak var presNotes: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var timesTextField: UITextField!
    @IBOutlet weak var timesLabel: UILabel!
    @IBOutlet weak var freqPickerView: UIPickerView!
    @IBOutlet weak var freqLabel: UILabel!
    var prescriptionDuration = ["Hourly", "Daily", "Weekly", "Custom"]
    var times = ["12:00", "12:30", "1:00", "1:30", "2:00", "2:30", "3:00", "3:30", "4:00", "4:30", "5:00", "5:30", "6:00", "6:30", "7:00", "7:30", "8:00", "8:30", "9:00", "9:30", "10:00", "10:30", "11:00", "11:30"]
    var AmPm = ["AM","PM"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        presDuration.delegate = self
        presDuration.dataSource = self
        presDuration.reloadAllComponents()
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 2000)
    }
    @IBAction func onSubmit(_ sender: Any) {
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return(3)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            if row == 3 {
                addCustomData(visibility: true)
            }else{
                addCustomData(visibility: false)
            }
        }
    }
    func addCustomData(visibility: Bool) {
        if visibility{
            freqLabel.isHidden = false
            freqPickerView.isHidden = false
            timesLabel.isHidden = false
            timesTextField.isHidden = false
            leftButton.isHidden = false
            rightButton.isHidden = false
            presNotes.frame = CGRect(x: self.view.frame.width * 1.0/8.0, y: rightButton.frame.maxY + 10, width: self.view.frame.width * 6.0/8.0, height: presName.frame.height)
            submitButton.frame = CGRect(x: self.view.frame.width * 1.0/4.0, y: presNotes.frame.maxY + 20, width: self.view.frame.width * 1.0/2.0, height: submitButton.frame.height)
        }else{
            freqLabel.isHidden = true
            freqPickerView.isHidden = true
            timesLabel.isHidden = true
            timesTextField.isHidden = true
            leftButton.isHidden = true
            rightButton.isHidden = true
            presNotes.frame = CGRect(x: self.view.frame.width * 1.0/8.0, y: presDuration.frame.maxY + 10, width: self.view.frame.width * 6.0/8.0, height: presName.frame.height)
            submitButton.frame = CGRect(x: self.view.frame.width * 1.0/4.0, y: presNotes.frame.maxY + 20, width: self.view.frame.width * 1.0/2.0, height: submitButton.frame.height)
        }
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return prescriptionDuration.count
        }else if component == 1 {
            return(times.count)
        }else{
            return AmPm.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return prescriptionDuration[row]
        }else if component == 1 {
            return(times[row])
        }else{
            return AmPm[row]
        }
    }
    func setConstraints(){
        presName.frame = CGRect(x: self.view.frame.width * 1.0/8.0, y: self.view.frame.height * 1.0/8.0, width: self.view.frame.width * 6.0/8.0, height: presName.frame.height)
        presAmnt.frame = CGRect(x: self.view.frame.width * 1.0/8.0, y: presName.frame.maxY + 10, width: self.view.frame.width * 6.0/8.0, height: presName.frame.height)
        durationLabel.frame = CGRect(x: 0, y: presAmnt.frame.maxY + 5 , width: self.view.frame.width, height: 40)
        presDuration.frame = CGRect(x: self.view.frame.width * 1.0/8.0, y: presAmnt.frame.maxY + 50, width: self.view.frame.width * 6.0/8.0, height: presDuration.frame.width * 1.0/2.0)
        freqLabel.frame = CGRect(x: 0, y: presDuration.frame.maxY + 5 , width: self.view.frame.width, height: 40)
        freqPickerView.frame = CGRect(x: self.view.frame.width * 1.0/8.0, y: freqLabel.frame.maxY + 5, width: self.view.frame.width * 6.0/8.0, height: presDuration.frame.width * 1.0/2.0)
        timesLabel.frame = CGRect(x: 0, y: freqPickerView.frame.maxY + 10, width: self.view.frame.width, height: 40)
        timesTextField.frame = CGRect(x: self.view.frame.width * 1.0/8.0, y: timesLabel.frame.maxY + 10, width: self.view.frame.width * 6.0/8.0, height: presName.frame.height)
        leftButton.frame = CGRect(x: self.view.frame.width * 1.0/10.0, y: timesTextField.frame.maxY + 10, width: self.view.frame.width * 4.0 / 5.0, height: leftButton.frame.height)
        rightButton.frame = CGRect(x: self.view.frame.width * 1.0/10.0, y: leftButton.frame.maxY + 10, width: self.view.frame.width * 4.0 / 5.0, height: rightButton.frame.height)
        presNotes.frame = CGRect(x: self.view.frame.width * 1.0/8.0, y: presDuration.frame.maxY + 10, width: self.view.frame.width * 6.0/8.0, height: presName.frame.height)
        submitButton.frame = CGRect(x: self.view.frame.width * 1.0/4.0, y: presNotes.frame.maxY + 20, width: self.view.frame.width * 1.0/2.0, height: submitButton.frame.height)
        cancelButton.frame = CGRect(x: self.view.frame.width * 1.0/4.0, y: self.view.frame.maxY - cancelButton.frame.height - 60, width: self.view.frame.width * 1.0/2.0, height: cancelButton.frame.height)
        durationLabel.textAlignment = .center
        durationLabel.text = "Duration"
        durationLabel.font = UIFont(name: "Times New Roman", size: 20)
        freqLabel.textAlignment = .center
        timesLabel.textAlignment = .center
        freqLabel.isHidden = true
        freqPickerView.isHidden = true
        timesLabel.isHidden = true
        timesTextField.isHidden = true
        leftButton.isHidden = true
        rightButton.isHidden = true
        
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

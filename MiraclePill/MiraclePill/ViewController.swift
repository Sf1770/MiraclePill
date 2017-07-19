//
//  ViewController.swift
//  MiraclePill
//
//  Created by Sabrina Fletcher on 7/18/17.
//  Copyright © 2017 Sabrina Fletcher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    
    @IBOutlet weak var buyNow: UIButton!
    
    @IBOutlet weak var countryPickerBtn: UIButton!
    @IBOutlet weak var countryPicker: UIPickerView!
    
    let states = ["Alaska", "Arkansas", "Alabama", "California", "Colorado", "Delaware", "Nevada", "New York", "New Jersey", "Nebraska", " Michigan", "Mississippi", "Missouri", "Pennsylvania", "Georgia", "North Carolina", "South Carolina", "Florida", "Montana", "Washington", "Oregon", "New Mexico", "Texas"]
    let country  = ["United States", "Canada", "Afghanistan", "Argentina", "Australia", "Brazil", "Denmark", "Italy","Chile", "Colombia", "Guyana", "Jamaica", "Trinidad & Tobago", "Barbados", "Antigua","United Kingdom", "Spain", "France", "Ireland", "Switzerland", "Austria", "Germany"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        statePicker.tag = 1
        
        countryPicker.dataSource = self
        countryPicker.delegate = self
        countryPicker.tag = 2
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stateBtnPressed(_ sender: Any) {
        statePicker.isHidden = false
        countryPicker.isHidden = true
        
    }
    
    @IBAction func countryBtnPressed(_ sender: Any) {
        countryPicker.isHidden = false
        statePicker.isHidden = true
    }
    @IBAction func buyNow(_ sender: Any) {
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView.tag == statePicker.tag){
            return states.count
        }else if(pickerView.tag == countryPicker.tag){
            return country.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView.tag == statePicker.tag){
            return states[row]
        } else if(pickerView.tag == countryPicker.tag){
            return country[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView.tag == statePicker.tag){
            statePickerBtn.setTitle(states[row], for: UIControlState.normal)
            statePicker.isHidden = true
        } else if(pickerView.tag == countryPicker.tag){
            countryPickerBtn.setTitle(country[row], for: UIControlState.normal)
            countryPicker.isHidden = true
        }
    }
}


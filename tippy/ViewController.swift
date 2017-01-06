//
//  ViewController.swift
//  tippy
//
//  Created by Ryan Dens on 1/4/17.
//  Copyright © 2017 Ryan Dens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var tipPercentages = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set tip percentages for array depending on defaults
        //make labels reflect the tip percentages
        tipPercentages[0] = UserDefaults.standard.value(forKey: "lowTipPctg") as! Double? ?? 0.18
        var label = String(format: "%.1f", tipPercentages[0] * 100)
        tipControl.setTitle(label, forSegmentAt: 0)
        
        tipPercentages[1] = UserDefaults.standard.value(forKey: "midTipPctg") as! Double? ?? 0.20
        label = String(format: "%.1f", tipPercentages[1] * 100)
        tipControl.setTitle(label, forSegmentAt: 1)
        
        tipPercentages[2] = UserDefaults.standard.value(forKey: "highTipPctg") as! Double? ?? 0.25
        label = String(format: "%.1f", tipPercentages[2] * 100)
        tipControl.setTitle(label, forSegmentAt: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "settingsSegue") {
            let dest = segue.destination as! SettingsViewController
            dest.parentView = self
        }
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        
        
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}



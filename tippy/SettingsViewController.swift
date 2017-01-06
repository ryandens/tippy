//
//  SettingsViewController.swift
//  tippy
//
//  Created by Ryan Dens on 1/5/17.
//  Copyright © 2017 Ryan Dens. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var lowTipPctg: UITextField!
    @IBOutlet weak var midTipPctg: UITextField!
    @IBOutlet weak var highTipPctg: UITextField!
    var parentView: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lowTipPctg.text = String(format: "%.1f", parentView.tipPercentages[0] * 100)
        
        midTipPctg.text = String(format: "%.1f", parentView.tipPercentages[1] * 100)
        
        highTipPctg.text = String(format: "%.1f", parentView.tipPercentages[2] * 100)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func lowTipChanged(_ sender: Any) {
        let lowTipP = (Double(lowTipPctg.text!) ?? 0.0)/100
        parentView.tipPercentages[0] = lowTipP
        
        UserDefaults.standard.setValue(lowTipP, forKey: "lowTipPctg")
        parentView.loadView()
        parentView.viewDidLoad()
    }
    @IBAction func midTipChanged(_ sender: Any) {
        let midTipP = (Double(midTipPctg.text!) ?? 0.0)/100
        parentView.tipPercentages[0] = midTipP
        
        UserDefaults.standard.setValue(midTipP, forKey: "midTipPctg")
        parentView.loadView()
        parentView.viewDidLoad()
    }

    @IBAction func highTipChanged(_ sender: Any) {
        let highTipP = (Double(highTipPctg.text!) ?? 0.0)/100
        parentView.tipPercentages[0] = highTipP
        
        UserDefaults.standard.setValue(highTipP, forKey: "highTipPctg")
        parentView.loadView()
        parentView.viewDidLoad()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

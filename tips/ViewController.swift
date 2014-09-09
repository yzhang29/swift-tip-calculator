//
//  ViewController.swift
//  tips
//
//  Created by Yuan Zhang on 9/4/14.
//  Copyright (c) 2014 Yuan Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    var defaultTip = 0
    var tipPercentage = 1.0
    var tipPercentages = [0.18, 0.20, 0.22]
    var billAmount = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image1 = UIImage(named: "background")
        let imageview = UIImageView(image: image1)
        imageview.frame = self.view.bounds
        imageview.contentMode = UIViewContentMode.ScaleAspectFill
        self.view.addSubview(imageview)
        self.view.sendSubviewToBack(imageview)
            
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billField.becomeFirstResponder()
        getDefaultTipPercentage()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        getDefaultTipPercentage()
        calculate(billAmount, tipPercentage: tipPercentage)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        println("On Edit Change")
        billAmount = NSString(string: billField.text).doubleValue
        calculate(billAmount, tipPercentage: tipPercentage)
        
    }
    @IBAction func onSelectChanged(sender: AnyObject) {
        tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        calculate(billAmount, tipPercentage: tipPercentage)
    }
    
    func calculate(billAmount:Double, tipPercentage:Double){
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip);
        totalLabel.text = String(format: "$%.2f", total)
        tipPercentageLabel.text=String(format: "%d%%", Int(tipPercentage*100));
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func getDefaultTipPercentage(){
        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey("tip_percentage")
        if(intValue<=0){
            intValue = 18
        }
        tipPercentageLabel.text=String(format: "%d%%", intValue);
        tipPercentage = Double(intValue) * 0.01
        println(NSString(format:"%.2f", tipPercentage))
    }

}

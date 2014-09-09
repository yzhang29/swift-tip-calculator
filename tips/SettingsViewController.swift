//
//  SettingsViewController.swift
//  tips
//
//  Created by Yuan Zhang on 9/8/14.
//  Copyright (c) 2014 Yuan Zhang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tipField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        saveTipPercentage()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func saveTipPercentage(){
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(NSString(string: tipField.text).integerValue, forKey: "tip_percentage")
        defaults.synchronize()
    }
}

//
//  ViewController.swift
//  TipCalc
//
//  Created by Shaan Appel on 2/13/16.
//  Copyright © 2016 Shaan Appel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tenPercentLabel: UILabel!
    @IBOutlet weak var fifteenPercentLabel: UILabel!
    @IBOutlet weak var twentyPercentLabel: UILabel!
    
    @IBOutlet weak var maintextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func calcPressed(sender: AnyObject) {
        let amount:Double  = Double(maintextField.text!)!
        let tenPercentOfAmount = amount * 0.1
        let fifteenPercentOfAmount = amount * 0.15
        let twentyPercentOfAmount = amount * 0.2
        
        tenPercentLabel.text = String(tenPercentOfAmount)
        fifteenPercentLabel.text = String(fifteenPercentOfAmount)
        twentyPercentLabel.text = String(twentyPercentOfAmount)
        
        maintextField.resignFirstResponder()
    }
}


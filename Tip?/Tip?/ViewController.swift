//
//  ViewController.swift
//  Tip?
//
//  Created by Boubacar Diallo on 1/9/18.
//  Copyright © 2018 Boubacar Diallo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var currencylabel: UILabel!
    @IBOutlet weak var percentControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    let locale = Locale.autoupdatingCurrent
    var currency = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        currency = locale.currencySymbol!
        currencylabel.text = currency
        tipLabel.text = currency + "0.00"
        totalLabel.text = currency + "0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        percentControl.selectedSegmentIndex = defaults.integer(forKey: "tippercent")
        print(currency)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }

    
    @IBAction func calculate(_ sender: AnyObject) {
        let percentages = [0.15, 0.18, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * percentages[percentControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = currency + String(format:"%.2f", tip)
        totalLabel.text = currency + String(format:"%.2f", total)
        print(currency)
    }
}


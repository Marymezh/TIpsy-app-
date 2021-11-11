//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Maria Mezhova on 09.11.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalAmount: String?
    var numberOfPersons = 2
    var tipPercentage = 10

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = totalAmount
        
        settingsLabel.text = "Split between \(numberOfPersons) people with \(tipPercentage)% tip "
       
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}

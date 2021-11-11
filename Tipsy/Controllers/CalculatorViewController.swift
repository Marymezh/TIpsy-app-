//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var numberOfPersons = 2
    var tip = 0.1
    var calculation = 0.0
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true

    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        numberOfPersons = Int(sender.value)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        if zeroPctButton.isSelected == true {
            tip = 0.0
        } else if tenPctButton.isSelected == true {
            tip = 0.1
        } else if twentyPctButton.isSelected == true {
            tip = 0.2
        }
   
        guard let bill = Double(billTextField.text ?? "1") else {return}
        calculation = (bill + (bill * tip)) / Double(numberOfPersons)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)


    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalAmount = String(format: "%.2f", calculation)
            destinationVC.numberOfPersons = numberOfPersons
            destinationVC.tipPercentage = Int(tip*100)
        }
    }
}


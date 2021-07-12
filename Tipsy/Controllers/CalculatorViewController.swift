//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var billBrain = BillBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    func unselectTips(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        unselectTips()
        sender.isSelected = true;
        billBrain.tipText = sender.currentTitle!;
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.f", sender.value)
        billBrain.updatePeopleCount(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        if billTextField.text != Optional("") {
            let billValue = Double(billTextField.text!)
            if billValue != nil {
                billBrain.billValue = billValue!
                self.performSegue(withIdentifier: "goToResults", sender: self)
            } else {
                print("price is not good")
            }
            
        }else{
            print("text is empty")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.billValue = billBrain.calculateTotal();
            destinationVC.peopleCount = billBrain.getPeople();
            destinationVC.tip = billBrain.tipText;
        }
    }
    
}


//
//  ViewController.swift
//  Tipsy
//
//  Created by Adnaan on 19/10/23.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.0
    var numberOfPeople = 2
    var totalAmt : Double = 0.0
    var total : String?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = sender == zeroPctButton
        tenPctButton.isSelected = sender == tenPctButton
        twentyPctButton.isSelected = sender == twentyPctButton
        let num = Double(sender.titleLabel!.text!.dropLast())!
        tip = (num/100.0)
        billTextField.endEditing(true)
        totalAmt = Double(billTextField.text!) ?? 0.0
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        if(sender.value >= 12){
            sender.value = 1
        }
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(tip)
        print(numberOfPeople)
        print(totalAmt)
        
        let totalBillAfterTip = totalAmt + totalAmt*tip
        let perHead = String(format: "%.2f", totalBillAfterTip/Double(numberOfPeople))
        total = perHead
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.noOfPeople = numberOfPeople
            destinationVC.tip = tip
            destinationVC.total = total
            
        }
    }
    
}


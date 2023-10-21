//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Adnaan on 19/10/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total : String?
    var noOfPeople : Int!
    var tip : Double!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total
        settingsLabel.text = "Split between \(String(noOfPeople)) with \(String(tip*100))% tip"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

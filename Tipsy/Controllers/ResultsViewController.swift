//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Катя Катигариди on 12.07.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var billValue: Double?;
    var peopleCount: Int?;
    var tip: String?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.1f", billValue!);
        settingsLabel.text = "Split between \(peopleCount!) people, with \(tip!) tip."
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}

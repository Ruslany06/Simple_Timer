//
//  ViewController.swift
//  Timer
//
//  Created by Ruslan Yelguldinov on 29.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textfield.layer.borderWidth = 0.5
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondVC" {
            if let secondVC = segue.destination as? SecondViewController {
                secondVC.time = Int(textfield.text!) ?? 0
            }
        }
            
    }
    
    
    
}


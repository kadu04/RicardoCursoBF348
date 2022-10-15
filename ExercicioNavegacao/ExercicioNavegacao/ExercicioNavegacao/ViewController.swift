//
//  ViewController.swift
//  ExercicioNavegacao
//
//  Created by Ricardo Massaki on 14/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func tappedGoScreen02Button(_ sender: UIButton) {
        performSegue(withIdentifier: "GoScreen02", sender: nil)
    }
    
    
}


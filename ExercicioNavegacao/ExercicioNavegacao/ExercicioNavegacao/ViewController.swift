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
    
    
    @IBAction func tappedButton(_ sender: UIButton) {
        performSegue(withIdentifier: "GoScreen01", sender: nil)
    }
    
}


//
//  ViewController.swift
//  NavegacaoCursoBF348
//
//  Created by Ricardo Massaki on 13/10/22.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func tappedGoScreen02Buttobn(_ sender: UIButton) {
        performSegue(withIdentifier: "GoScreen02", sender: nil)
    }
    
    @IBAction func tappedGoScreen03Button(_ sender: UIButton) {
        performSegue(withIdentifier: "GoScreen03", sender: nil)
    }
    
    
    
}


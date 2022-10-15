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
    @IBAction func tappedModalButton(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Tela02", bundle: nil).instantiateViewController(withIdentifier: "Tela02") as? Tela02
        present(vc ?? UIViewController(), animated: true)
    }
        

    @IBAction func tappedPushButton(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Tela02", bundle: nil).instantiateViewController(withIdentifier: "Tela02") as? Tela02
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    
}


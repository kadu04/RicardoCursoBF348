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
//        //Exibindo MODAL de maneira programática.
//        let vc: Tela02? = UIStoryboard(name: "Tela02", bundle: nil).instantiateViewController(withIdentifier: "Tela02") as? Tela02
//        // O present exibe a MODAL
//        present(vc ?? UIViewController(), animated: true)
//
        //Exibindo NAVIGATION de maneira programática.
        let vc: Tela02? = UIStoryboard(name: "Tela02", bundle: nil).instantiateViewController(withIdentifier: "Tela02") as? Tela02
        // O pushViewController ele exibe a tela da controladora.
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedGoScreen03Button(_ sender: UIButton) {
        
        
        
    }
    
    
    
}


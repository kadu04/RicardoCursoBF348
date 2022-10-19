//
//  ViewController.swift
//  Life Cycle
//
//  Created by Ricardo Massaki on 16/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(#function)
    }
    
    
    @IBAction func tappedGoScreen02Button(_ sender: UIButton) {
        
        
        //     // exibindo modal de maneira programatica
        //        let vc = UIStoryboard(name: "Tela02", bundle: nil).instantiateViewController(withIdentifier: "Tela02")
        //        as? Tela02
        //        // o present ele exibe a MODAL
        //        present(vc ?? UIViewController(), animated: true)
        
        // exibindo NAVIGATION de maneira programatica
        let vc = UIStoryboard(name: "Tela02", bundle: nil).instantiateViewController(withIdentifier: "Tela02") as? Tela02
        vc?.name = "\(nameTextField.text ?? "") \(lastNameTextField.text ?? "")"
        
        // o pushViewController ele exibe a tela da controladora
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    
    @IBAction func tappedGoScreen03Button(_ sender: UIButton) {
    }
    
}

    



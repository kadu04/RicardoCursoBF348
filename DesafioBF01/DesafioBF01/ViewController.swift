//
//  ViewController.swift
//  DesafioBF01
//
//  Created by Ricardo Massaki on 19/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var profissionTextField: UITextField!
    
    @IBOutlet weak var goScreen02Button: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func tappedGoScreen02Button(_ sender: UIButton) {
    
    let vc = UIStoryboard(name: "Tela02", bundle: nil).instantiateViewController(withIdentifier: "Tela02") as? Tela02
    
    let ricardo = Pessoa(nome: nameTextField.text ?? "" , sobrenome: lastNameTextField.text ?? "" , idade: ageTextField.text ?? "" , profissao: profissionTextField.text ?? "")
    
    vc?.ricardo = ricardo
    
    navigationController?.pushViewController(vc ?? UIViewController(), animated: true)

    }

}

struct Pessoa {
    var nome: String
    var sobrenome: String
    var idade: String
    var profissao: String
}


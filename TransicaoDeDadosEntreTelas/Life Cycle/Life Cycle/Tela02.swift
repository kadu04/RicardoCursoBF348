//
//  Tela02.swift
//  Life Cycle
//
//  Created by Ricardo Massaki on 16/10/22.
//

import UIKit

class Tela02: UIViewController {
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var person: Pessoa?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        nameLabel.text = "Nome: \(person?.nome ?? "") \n Sobrenome: \(person?.sobrenome ?? "") \n Idade: \(person?.idade ?? "") \n Profissão: \(person?.profissao ?? "")"
}
    
<<<<<<< HEAD
    
    
    let vc = UIStoryboard(name: "Tela03", bundle: nil).instantiateViewController(withIdentifier: "Tela03") as? Tela03
    
    vc?.fullName = nameLabel.text ?? ""
    
    navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    
   
    }
    

=======
    @IBAction func tappedGoScreen03Button(_ sender: UIButton) {
        
//        let vc = UIStoryboard(name: "Tela03", bundle: nil).instantiateViewController(withIdentifier: "Tela03") as? Tela03
        //vc?.name = "\(nameTextField.text ?? "") \(lastNameTextField.text ?? "")
//        vc?.name = name
//        vc?.lastName = lastName
        
        
        // o pushViewController ele exibe a tela da controladora
        //navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
<<<<<<< HEAD
    
    
>>>>>>> TransicaoDeDadosEntreTelas
=======
>>>>>>> TransicaoDeDadosEntreTelas


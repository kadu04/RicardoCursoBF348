//
//  Tela02.swift
//  DesafioBF01
//
//  Created by Ricardo Massaki on 19/10/22.
//

import UIKit

class Tela02: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var lastLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var profissionLabel: UILabel!
    
    var ricardo: Pessoa?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameLabel.text = ricardo?.nome
        lastLabel.text = ricardo?.sobrenome
        ageLabel.text = ricardo?.idade
        profissionLabel.text = ricardo?.profissao
        

       
    }
    

  

}

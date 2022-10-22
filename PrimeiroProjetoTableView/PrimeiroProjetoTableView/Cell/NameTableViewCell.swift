//
//  NameTableViewCell.swift
//  PrimeiroProjetoTableView
//
//  Created by Ricardo Massaki on 20/10/22.
//

import UIKit

//Criar a celula
//Criar identifier
//Add identifier na xib. Copiar o identifier, ir na xib, presionar no arquivo e colar no espaço identifier.
//Criar metodo na Nib
//Criar os elementos e fazer as suas ligacoes
//Configurar Elementos
//Criar metodo de Setup!!!!!

class NameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    // o nome do identifier, do arquivo e da class, são SEMPRE o mesmo nome
    static let identifier: String = "NameTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    //Ciclo de vida da celula -> como se fosse um viewDidLoad
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(name: String) {
        nameLabel.text = name
        
    }
    
}


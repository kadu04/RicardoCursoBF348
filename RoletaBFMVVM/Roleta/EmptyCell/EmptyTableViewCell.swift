//
//  EmptyTableViewCell.swift
//  Roleta
//
//  Created by Ricardo Massaki on 25/11/22.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {
    
    //7- Ligação dos Botões
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    //6- Criar o "Static identifier" e depois colocar o nome da classe na célula na xib
    static let identifier: String = "EmptyTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        //8- Tirar a cor cinza da célula.
        selectionStyle = .none
        //8- Deixar a cor de fundo black.
        backgroundColor = .black
        //8(2)- quantidade de linhas que uma label pode ter
        titleLabel.numberOfLines = 0
        //8- Colocar a msn no titleLabel
        titleLabel.text = "Insira os participantes para iniciar uma roleta russa!"
        titleLabel.textColor = .white
        
    }

    
    
}

//
//  PersonTableViewCell.swift
//  Roleta
//
//  Created by Ricardo Massaki on 24/11/22.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    //15- Fazer layout da célula, e ligações.
    @IBOutlet weak var personImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var cardsImageView: UIImageView!
    
    //14- Criar o "Static identifier" e depois colocar o nome da classe na célula na xib
    static let identifier: String = "PersonTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        //14(1) Tirar a cor cinza da célula.
        selectionStyle = .none
        //14(2) Deixar a cor de fundo black.
        backgroundColor = .black
        //18(3)
        nameLabel.textColor = .white
        
    }
    
    //16- fazer setupCell da célula, e depois criar o Grupo Model e depois modificar o setupCell
//    func setupCell() {
//        nameLabel.text = ""
//        personImageView.image = UIImage(named: "")
//    }
    //17- setupCell modificado após criado o struct lá no Model.
    func setupCell(data: Person) {
        nameLabel.text = data.name
        personImageView.image = UIImage(named: data.image)
    }

}

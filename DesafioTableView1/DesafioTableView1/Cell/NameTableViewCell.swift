//
//  NameTableViewCell.swift
//  DesafioTableView1
//
//  Created by Ricardo Massaki on 26/10/22.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    //07
    @IBOutlet weak var carImageView: UIImageView!
    
    @IBOutlet weak var brandLabel: UILabel!
    
    //06 e dpois colocar identificador da xib "NameTableViewCell"
    static let identifier: String = "NameTableViewCell"
        
        static func nib() -> UINib{
            return UINib(nibName: identifier, bundle: nil)
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //16- retira fundo escuro da celula
        selectionStyle = .none
    }

    //10
    func setupCell(data: Car) {
        brandLabel.text = data.car
        carImageView.image = data.image
    }
    
}

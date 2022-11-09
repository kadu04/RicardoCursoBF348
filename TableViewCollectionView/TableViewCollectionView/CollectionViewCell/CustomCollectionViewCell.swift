//
//  CustomCollectionViewCell.swift
//  TableViewCollectionView
//
//  Created by Ricardo Massaki on 08/11/22.
//

import UIKit

//12- se criamos uma collection, temos que criar uma célula.
//ir na Xib e colocar uma imageView
class CustomCollectionViewCell: UICollectionViewCell {
    //13- fazer a ligação da xib
    @IBOutlet weak var carImageView: UIImageView!
    
    //14- criou o collectionviewcell, já cria o "identifier" e o "nib". e colocar o identificador da Xib
    static let identifier: String = "CustomCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        carImageView.contentMode = .scaleAspectFill
    }
    
    //15- criar o setup
    func setupCell(nameImage: String) {
        carImageView.image = UIImage(named: nameImage)
    }

}

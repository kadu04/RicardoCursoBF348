//
//  TableViewCell.swift
//  FirebaseCoreDataCursoBF348
//
//  Created by Ricardo Massaki on 29/12/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    //6- fazer ligação dos botões
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    //5- criar static e fazer layout da celula
    static let identifier: String = "CustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //7- fazer setup da célula. depois criar file ViewModel (cocoa t. class e subclass NSObject)
//    func setupCell() {
//        nameLabel.text = "Caio"
//        ageLabel.text = "50"
//    }
    public func setupCell(person: Person) {
        nameLabel.text = person.name
        ageLabel.text = String(person.age)
    }
}

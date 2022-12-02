//
//  NameTableViewCell.swift
//  tableViewAvancado
//
//  Created by Ricardo Massaki on 27/10/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    //2- Criar a célula e fazer ligação
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    //3-
    static let identifier: String = "UserTableViewCell"
        //4-
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        //5-
        selectionStyle = .none

    }
 
    //6-
    func setupCell(data: User) {
        userImageView.image = data.image
        nameLabel.text = data.name
    }
}

//
//  TableViewViewCellTableViewCell.swift
//  ProjeetoTabBar
//
//  Created by Ricardo Massaki on 13/11/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    //1- Fazer as ligações dos botões
    @IBOutlet weak var personImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    //2-
    static let identifier: String = "TableViewCell"
    //3-
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //4-
        selectionStyle = .none
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//    }
    
    //5-
    func setupCell(user: User){
        personImageView.image = user.image
        nameLabel.text = user.name
    }
    
}

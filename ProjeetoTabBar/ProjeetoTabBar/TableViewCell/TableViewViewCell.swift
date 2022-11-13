//
//  TableViewViewCellTableViewCell.swift
//  ProjeetoTabBar
//
//  Created by Ricardo Massaki on 13/11/22.
//

import UIKit

class TableViewViewCell: UITableViewCell {
    
    @IBOutlet weak var personImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier: String = "TableViewViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCell(user: User){
        personImageView.image = user.image
        nameLabel.text = user.name
    }
    
}

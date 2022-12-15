//
//  HistoryAccountList.swift
//  Roleta
//
//  Created by Ricardo Massaki on 13/12/22.
//

import UIKit

class HistoryAccountListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var historyImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    //37- code sniped. dpois criar a célula e fazer as ligações.
    static let identifier: String = "HistoryAccountListTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    //38- fazer o setup 
    public func setupCell(data: HistoryAccountList) {
        historyImageView.image = UIImage(named: data.iconImage ?? "")
        nameLabel.text = data.name ?? ""
        priceLabel.text = "R$ \(data.price ?? 0.0)"
    }

}

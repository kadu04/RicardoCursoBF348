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
    
    static let identifier: String = "HistoryAccountListTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    public func setupCell(data: HistoryAccountList) {
        historyImageView.image = UIImage(named: data.iconImage ?? "")
        nameLabel.text = data.name ?? ""
        priceLabel.text = "R$ \(data.price ?? 0.0)"
    }

}

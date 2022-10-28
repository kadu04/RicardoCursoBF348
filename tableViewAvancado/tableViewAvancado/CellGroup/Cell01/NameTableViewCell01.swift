//
//  NameTableViewCell01.swift
//  tableViewAvancado
//
//  Created by Ricardo Massaki on 27/10/22.
//

import UIKit

class NameTableViewCell01: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var professionLabel: UILabel!
    
    @IBOutlet weak var salaryLabel: UILabel!
    
    @IBOutlet weak var tappedHeartButton: UIButton!
    
    
    
    static let identifier: String = "NameTableViewCell01"
        
        static func nib() -> UINib{
            return UINib(nibName: identifier, bundle: nil)
        }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func setupCell(data: Employee) {
        self.userImageView.image = data.image
        self.nameLabel.text = "Nome: \(data.name)"
        self.ageLabel.text = "Idade: \(String(data.age))"
        self.professionLabel.text = "Profissão: \(data.profession)"
        self.salaryLabel.text = "Salário: \(data.salary)"
        
        if data.isEnableHeart{
            self.tappedHeartButton.tintColor = .red
        } else {
            self.tappedHeartButton.tintColor = .blue        }
        
    }
    
    @IBAction func tappedHeartButton(_ sender: UIButton) {
        
    }
    
}

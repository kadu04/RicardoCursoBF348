//
//  Tela02.swift
//  Life Cycle
//
//  Created by Ricardo Massaki on 16/10/22.
//

import UIKit

class Tela02: UIViewController {
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var name: String = ""
    var lastName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        nameLabel.text = "\(name) \(lastName)"
}
    
    
    
    let vc = UIStoryboard(name: "Tela03", bundle: nil).instantiateViewController(withIdentifier: "Tela03") as? Tela03
    
    vc?.fullName = nameLabel.text ?? ""
    
    navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    
   
    }
    



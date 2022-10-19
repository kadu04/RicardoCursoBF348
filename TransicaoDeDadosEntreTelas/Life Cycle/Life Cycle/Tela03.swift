//
//  Tela03.swift
//  Life Cycle
//
//  Created by Ricardo Massaki on 19/10/22.
//

import UIKit

class Tela03: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String = ""
    var lastName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "\(name) \(lastName)"


        
    }
    

   

}

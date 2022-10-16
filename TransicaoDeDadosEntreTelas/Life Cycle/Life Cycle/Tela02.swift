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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        nameLabel.text = name
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

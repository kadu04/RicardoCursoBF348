//
//  AlertController.swift
//  Roleta
//
//  Created by Ricardo Massaki on 30/11/22.
//

import UIKit

//29- primeiro excluir o ":" e o "NSObject". class AlertController: NSObject {
class AlertController {
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(ok)
        controller.present(alertController, animated: true)
    }

}



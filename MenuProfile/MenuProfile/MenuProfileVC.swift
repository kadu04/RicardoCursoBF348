//
//  ViewController.swift
//  MenuProfile
//
//  Created by Ricardo Massaki on 07/12/22.
//

import UIKit

class MenuProfileVC: UIViewController {
    
    //chamar a MenuProfileViewModel aqui
    let viewModel: MenuProfileViewModel = MenuProfileViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        viewModel.fetch(.mock)
    }


}


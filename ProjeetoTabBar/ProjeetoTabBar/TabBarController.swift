//
//  TabBarController.swift
//  ProjeetoTabBar
//
//  Created by Ricardo Massaki on 11/11/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBar()

        
    }
    
    func configItems() {
        guard let items = tabBar.items else { return }
        items[0].title = "Tela 01"
        items[0].image = UIImage(systemName: "apple.logo")
        
    }
    
    func configTabBar() {
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.backgroundColor = .white
    }
    

    

}

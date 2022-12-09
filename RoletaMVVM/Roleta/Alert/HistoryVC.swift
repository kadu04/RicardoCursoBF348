//
//  HistoryVC.swift
//  Roleta
//
//  Created by Ricardo Massaki on 07/12/22.
//

import UIKit

class HistoryVC: UIViewController {
    
    let viewModel: HistoryViewModel = HistoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchHistory()
    }

}

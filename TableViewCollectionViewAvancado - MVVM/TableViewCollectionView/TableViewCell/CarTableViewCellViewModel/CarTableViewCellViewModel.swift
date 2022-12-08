//
//  ViewModel1.swift
//  TableViewCollectionView
//
//  Created by Ricardo Massaki on 02/12/22.
//

import UIKit

class CarTableViewCellViewModel {
    
    var data: [String] = []
    
    func setListNameImage(data: [String]) {
        self.data = data
    }
    
    var numberOfItemsInSection: Int {
        return data.count
    }
    
    func loadCurrentNameImage(indexPath: IndexPath) -> String {
        return data[indexPath.row]
    }
    
}

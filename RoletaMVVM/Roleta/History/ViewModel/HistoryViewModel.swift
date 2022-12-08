//
//  HistoryViewModel.swift
//  Roleta
//
//  Created by Ricardo Massaki on 07/12/22.
//

import UIKit

class HistoryViewModel {
    
    private let service: HistoryService = HistoryService()
    
    func fetchHistory() {
        service.getHistoryFromJson { result, failure in
            if let result = result {
                print(result)
            } else {
                print("Deu ruim!")
            }
        }
        
    }

}

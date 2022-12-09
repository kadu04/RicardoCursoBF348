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
        service.getHistoryURLSession { result, failure in
            if let result = result {
                print(result)
            } else {
                print("Deu ruim!")
            }
        }
        
    }

}

//MMVM padrao de arquitetura de desenvolvimento, e tem 3 camadas
//Model refere-se a camada de dados
//View é a camada que possui toda estrutura de UI
//ViewModel sendo responsável pela parte lógica da camada view


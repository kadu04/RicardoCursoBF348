//
//  HistoryViewModel.swift
//  Roleta
//
//  Created by Ricardo Massaki on 07/12/22.
//

import UIKit

protocol HistoryViewModelProtocol: AnyObject {
    func success()
    func error(detail: String)
}

class HistoryViewModel {
    
    //25- criar o "private let service: HistoryService = HistoryService()"
    private let service: HistoryService = HistoryService()
    private var history: History?
    weak private var delegate: HistoryViewModelProtocol?
    
    public func delegate(delegate: HistoryViewModelProtocol?) {
        self.delegate = delegate
    }
    
    //20- criar a func fetchHistory para chamar o método de REQUEST. como não temos o método, temos que criar a camada de REQUEST. Então, criar o grupo SERVICE e FILE HistoryService (cocoaTouchClass - NSObject)
    func fetchHistory() {
        //25(1)-primeiro criar assim, e dpois que tiver o alamofire mudar para o debaixo.
//        service.getHistoryFromJson { result, failure in
//            if let result = result {
//                print(result)
//            } else {
//              print("deu ruim")
//  25(2)- dpois ir lá na HistoryVC para chamar a fetchHistory //26-
        service.getHistoryAlamofire { result, failure in
            if let result = result {
                print(result)
                self.history = result
                self.delegate?.success()
            } else {
              print("deu ruim")
                self.delegate?.error(detail: failure?.localizedDescription ?? "")
            }
        }
    }
    
    var numberOfRowsInSection: Int {
        return history?.historyAccountList?.count ?? 0
    }
    
    func loadCurrentHistoryAccountList(indexPath: IndexPath) -> HistoryAccountList {
        return history?.historyAccountList?[indexPath.row] ?? HistoryAccountList()
    }
    
    var heightForRowAt: CGFloat {
        return 140
    }
    
    
}

//MMVM padrao de arquitetura de desenvolvimento, e tem 3 camadas
//Model refere-se a camada de dados
//View é a camada que possui toda estrutura de UI
//ViewModel sendo responsável pela parte lógica da camada view


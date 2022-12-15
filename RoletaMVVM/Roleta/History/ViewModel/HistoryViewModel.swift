//
//  HistoryViewModel.swift
//  Roleta
//
//  Created by Ricardo Massaki on 07/12/22.
//

import UIKit

//41-
protocol HistoryViewModelProtocol: AnyObject {
    func success()
    func error(detail: String)
}

class HistoryViewModel {
    
    //25- criar o "private let service: HistoryService = HistoryService()"
    private let service: HistoryService = HistoryService()
    //34- fazer o "private var history: History?"
    private var history: History?
    //42-
    weak private var delegate: HistoryViewModelProtocol?
    //43-
    public func delegate(delegate: HistoryViewModelProtocol?) {
        self.delegate = delegate
    }
    
    //20- criar a func fetchHistory para chamar o método de REQUEST. como não temos o método, temos que criar a camada de REQUEST. Então, criar o grupo SERVICE e FILE HistoryService (cocoaTouchClass - NSObject)
    func fetchHistory() {
        //25(1)-primeiro criar assim, e dpois que tiver o alamofire mudar para o abaixo.
//        service.getHistoryFromJson { result, failure in
//            if let result = result {
//                print(result)
//            } else {
//              print("deu ruim")
//  25(2)- dpois ir lá na HistoryVC para chamar a fetchHistory //26-
        service.getHistoryAlamofire { result, failure in
            if let result = result {
                print(result)
                //35- temos que popular o "private var history: History?"
                self.history = result
                //44-
                self.delegate?.success()
            } else {
              print("deu ruim")
                //45- criar e dpois ir para HistoryVC
                self.delegate?.error(detail: failure?.localizedDescription ?? "")
            }
        }
    }
    
    //33- criar o numberOfRowsInSection
    var numberOfRowsInSection: Int {
        // return history?.historyAccountList?.count, dpois mudar para o abaixo
        //tem que retornar o que a API me retornar aqui
        return history?.historyAccountList?.count ?? 0
    }
    
    //35- fazer a func com retorno de HistoryAccountList, dpois criar o grupo HistoryAccountList e o FILE (Cocoa -> UITableViewCell). dois criar as func na HistoryAccountListTableViewCell //36-
    func loadCurrentHistoryAccountList(indexPath: IndexPath) -> HistoryAccountList {
        return history?.historyAccountList?[indexPath.row] ?? HistoryAccountList()
    }
    
    //48-
    var heightForRowAt: CGFloat {
        return 140
    }
    
    
}

//MMVM padrao de arquitetura de desenvolvimento, e tem 3 camadas
//Model refere-se a camada de dados
//View é a camada que possui toda estrutura de UI
//ViewModel sendo responsável pela parte lógica da camada view


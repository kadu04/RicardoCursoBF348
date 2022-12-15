//
//  History.swift
//  Roleta
//
//  Created by Ricardo Massaki on 07/12/22.
//

import Foundation

//struct History {
//    var totalValue: Double
//    var historyAccountList: [HistoryAccountList]
//
//}
//
//struct HistoryAccountList {
//    var historyID: String
//    var date: String
//    var name: String
//    var iconList: String
//    var price: String
//
//}

//MARK: - Decodable
// Decodifica, ou seja, transforma um tipo de json em um objeto SWIFT.

//MARK: - Encodable
// Codifica, ou seja, transforma um tipo de dado no Swift em json.

//MARK: - Codable
// Codifica e decodifica.


//20-Transformar os arquivos json em swift

// MARK: - History
struct History: Codable {
    var totalValue: Double?
    var historyAccountList: [HistoryAccountList]?
}

// MARK: //20- Fazer a struct do HistoryAccountList
//"historyID": "9a157e36-7279-41d0-9d30-5310e9afd6321",
//"date": "2022-11-24T00:00:00.000",
//"name": "Bar da Mooca",
//"price": 250.10,
//"iconImage": "url-image-mooca"

struct HistoryAccountList: Codable {
    var historyID, date, name: String?
    var price: Double?
    var iconImage: String?
}

//20(01)- a Struct acima foi criada na mão, mas se quiser pode jogar os arquivos json no site "QUICKTYPE" para ele fazer para vc. dpois ir para o arquivo History, criar o FILE "HistoryViewModel"(subclass é NSObject)

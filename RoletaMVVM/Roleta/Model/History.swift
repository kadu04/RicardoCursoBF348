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




// MARK: - History
struct History: Codable {
    var totalValue: Double?
    var historyAccountList: [HistoryAccountList]?
}

// MARK: - HistoryAccountList
struct HistoryAccountList: Codable {
    var historyID, date, name: String?
    var price: Double?
    var iconImage: String?
}

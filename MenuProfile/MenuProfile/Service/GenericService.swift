//
//  GenericService.swift
//  MenuProfile
//
//  Created by Ricardo Massaki on 07/12/22.
//

import Foundation


//Esses protocolos, só vão ser criados uma única vez. Por isso é bom criar uma "File" para armazená-los.

protocol GenericService: AnyObject{
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

enum Error: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
}

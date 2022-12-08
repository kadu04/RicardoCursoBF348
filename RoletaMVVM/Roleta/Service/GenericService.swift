//
//  GenericService.swift
//  Roleta
//
//  Created by Ricardo Massaki on 07/12/22.
//

import Foundation


protocol GenericService: AnyObject {
        typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
    }
    


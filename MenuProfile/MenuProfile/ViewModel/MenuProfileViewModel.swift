//
//  MenuProfileViewModel.swift
//  MenuProfile
//
//  Created by Ricardo Massaki on 07/12/22.
//

import UIKit

enum TypeFech {
    case mock
    case request
}

class MenuProfileViewModel {

    //primeiro criar o "File" MenuProfileService e fazer as tratativas.
    private let service: MenuProfileService = MenuProfileService()
    
    public func fetch(_ typeFech: TypeFech) {
        switch typeFech {
        case .mock:
            self.service.getMenuFromJson { success, error in
                print(success)
            }
        case .request:
            break
        }
    }
}

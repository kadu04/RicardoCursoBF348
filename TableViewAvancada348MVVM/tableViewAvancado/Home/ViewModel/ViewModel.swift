//
//  ViewModel.swift
//  tableViewAvancado
//
//  Created by Ricardo Massaki on 02/12/22.
//

import UIKit

class ViewModel {
    
    
    let employeeList: [Employee] = [
        Employee(name: "Caio", age: 30, profession: "Developer IOS", salary: "1.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: true),
        Employee(name: "Fabricio", age: 30, profession: "Developer IOS", salary: "1.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false),
        Employee(name: "Alencar", age: 30, profession: "Developer IOS", salary: "1.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false),
        Employee(name: "Jorge", age: 30, profession: "Developer IOS", salary: "1.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false)
    ]
    
    
    var numberOfRowsInSection: Int {
        return employeeList.count + CellSpec.userTableViewCell.rawValue
    }
    
    func loadCurrentUser() -> User {
        return User(name: TypeString.caio.rawValue, image: UIImage(systemName: TypeString.star.rawValue) ?? UIImage())
    }
    
    
    func loadCurrentEmployee(indexPath: IndexPath) -> Employee {
        return employeeList[indexPath.row - 1]
    }
    
    
    
    func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 131
        } else {
            return 164
        }
    }

}


    
    
    




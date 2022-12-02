//
//  ViewController.swift
//  tableViewAvancado
//
//  Created by Ricardo Massaki on 27/10/22.
//

import UIKit

//17- enum se cria fora da classe. pode colocar qualquer nome, neste caso CellSpec.
enum CellSpec: Int {
    case userTableViewCell = 1
}

enum TypeString: String {
    case caio = "Caio Fabrini"
    case star = "star"
}

class ViewController: UIViewController {
    //1-
    @IBOutlet weak var tableView: UITableView!
    
    //5-
    let viewModel: ViewModel = ViewModel()
//
//    let employeeList: [Employee] = [
//        Employee(name: "Caio", age: 30, profession: "Developer IOS", salary: "1.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: true),
//        Employee(name: "Fabricio", age: 30, profession: "Developer IOS", salary: "1.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false),
//        Employee(name: "Alencar", age: 30, profession: "Developer IOS", salary: "1.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false),
//        Employee(name: "Jorge", age: 30, profession: "Developer IOS", salary: "1.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false)
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserTableViewCell.nib(), forCellReuseIdentifier: UserTableViewCell.identifier)
        tableView.register(EmployeeTableViewCell.nib(), forCellReuseIdentifier: EmployeeTableViewCell.identifier)
    }
    
}
    
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return employeeList.count + CellSpec.userTableViewCell.rawValue
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell
            //
            cell?.setupCell(data: viewModel.loadCurrentUser())
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as? EmployeeTableViewCell
            //
            cell?.setupCell(data: viewModel.loadCurrentEmployee(indexPath: indexPath))
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            return 131
//        } else {
//            return 164
//        }
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
}


extension ViewController: UITableViewDelegate {
    
    
}

    





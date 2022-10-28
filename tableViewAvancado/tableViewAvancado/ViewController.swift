//
//  ViewController.swift
//  tableViewAvancado
//
//  Created by Ricardo Massaki on 27/10/22.
//

import UIKit

enum CellSpec: Int {
    case nameTableViewCell = 1
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let data: [Employee] = [
        Employee(name: "Ricardo", age: 26, profession: "Developer IOS", salary: "1.000,00", image: UIImage(named: "boy") ?? UIImage(), isEnableHeart: true),
        Employee(name: "Mauricio", age: 25, profession: "Developer IOS", salary: "1.000,00", image: UIImage(named: "boy") ?? UIImage(), isEnableHeart: false),
        Employee(name: "Klaus", age: 21, profession: "Developer IOS", salary: "1.000,00", image: UIImage(named: "boy") ?? UIImage(), isEnableHeart: false),
        Employee(name: "Fábio", age: 22, profession: "Developer IOS", salary: "1.000,00", image: UIImage(named: "boy") ?? UIImage(), isEnableHeart: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
       
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NameTableViewCell.nib(), forCellReuseIdentifier: NameTableViewCell.identifier)
        tableView.register(NameTableViewCell01.nib(), forCellReuseIdentifier: NameTableViewCell01.identifier)

    }
}

        extension ViewController: UITableViewDataSource {
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return data.count + CellSpec.nameTableViewCell.rawValue
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                if indexPath.row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: NameTableViewCell.identifier, for: indexPath) as? NameTableViewCell
                    cell?.setupCell(data: User(name: "Ricardo", image: UIImage(systemName: "figure.archery") ?? UIImage()))
                    return cell ?? UITableViewCell()
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: NameTableViewCell01.identifier, for: indexPath) as? NameTableViewCell01
                    cell?.setupCell(data: data[indexPath.row - 1])
                    return cell ?? UITableViewCell() 
                }
            }
            
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                if indexPath.row == 0 {
                    return 131
                } else {
                    return 178
                }
            }
            
        }


            extension ViewController: UITableViewDelegate {
                
//                func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//                    print(data[indexPath.row].name)
//                }
                
            }
            
        
    





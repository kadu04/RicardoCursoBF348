//
//  ViewController.swift
//  tableViewAvancado
//
//  Created by Ricardo Massaki on 27/10/22.
//

import UIKit

//17- enum se cria fora da classe. pode colocar qualquer nome, neste caso CellSpec.
enum CellSpec: Int {
    case nameTableViewCell = 1
}

class ViewController: UIViewController {
    //1-
    @IBOutlet weak var tableView: UITableView!
    
    //15=
    let data: [Employee] = [
        Employee(name: "Ricardo", age: 26, profession: "Developer IOS", salary: "1.000,00", image: UIImage(named: "boy") ?? UIImage(), isEnableHeart: true),
        Employee(name: "Mauricio", age: 25, profession: "Developer IOS", salary: "1.000,00", image: UIImage(named: "boy") ?? UIImage(), isEnableHeart: false),
        Employee(name: "Klaus", age: 21, profession: "Developer IOS", salary: "1.000,00", image: UIImage(named: "boy") ?? UIImage(), isEnableHeart: false),
        Employee(name: "Fábio", age: 22, profession: "Developer IOS", salary: "1.000,00", image: UIImage(named: "boy") ?? UIImage(), isEnableHeart: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //14=
        configTableView()
       
    }
    //10=
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NameTableViewCell.nib(), forCellReuseIdentifier: NameTableViewCell.identifier)
        tableView.register(NameTableViewCell01.nib(), forCellReuseIdentifier: NameTableViewCell01.identifier)

    }
}
    //12=
        extension ViewController: UITableViewDataSource {
            //13=
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                //13= colocar o return e deixar como "0", depois mudar
                //15= dpois que criar a lista, mudar o return, neste caso "return data.count
                //16= depois mudar o return para "return data.count + 1
                //17= dpois que criar o enum CellSpec, modificar para "CellSpec.nameTableViewCell.rawValue
                return data.count + CellSpec.nameTableViewCell.rawValue
            }
            //13=
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                //13= colocar o "return UITableViewCell()"e depois mudar
                
                //16=
                if indexPath.row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: NameTableViewCell.identifier, for: indexPath) as? NameTableViewCell
                    cell?.setupCell(data: User(name: "Ricardo", image: UIImage(systemName: "figure.archery") ?? UIImage()))
                    return cell ?? UITableViewCell()
                    
                    //se existisse outra célula...
//                } else if indexPath.row == 1{
//                    let cell = tableView.dequeueReusableCell(withIdentifier: NameTableViewCell.identifier, for: indexPath) as? NameTableViewCell
//                    cell?.setupCell(data: User(name: "Ricardo", image: UIImage(systemName: "figure.archery") ?? UIImage()))
//                    return cell ?? UITableViewCell()
//
                } else {
                    //15=
                    let cell = tableView.dequeueReusableCell(withIdentifier: NameTableViewCell01.identifier, for: indexPath) as? NameTableViewCell01
                    //17= neste caso, colocar o -1
                    cell?.setupCell(data: data[indexPath.row - 1])
                    return cell ?? UITableViewCell() 
                }
            }
            //13=
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                //13= colocar o return e deixar como "0.0", depois mudar
                //15= colocar no return o tamanho da célula
                if indexPath.row == 0 {
                    return 131
                } else {
                    return 178
                }
            }
            
        }

            //11=
            extension ViewController: UITableViewDelegate {
                
//                func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//                    print(data[indexPath.row].name)
//                }
                
            }
            
        
    





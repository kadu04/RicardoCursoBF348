//
//  ViewController.swift
//  TableViewCollectionView
//
//  Created by Ricardo Massaki on 07/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    //1- criar a tableview e fazer a ligação
    @IBOutlet weak var tableView: UITableView!
    
    //28- criar o array, a lista de imagens
    var listImage: [String] = ["car1", "car2", "car3", "car4", "car5", "car6"]
    var listImage2: [String] = ["moto1", "moto2", "moto3", "moto4", "moto5", "moto6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //3- se criou um método, tem que chamá-lo. é o primeiro ciclo de vida a ser chamado.
        configTableView()
    }
    
    //2- assinar os protocolos delegate e datasource
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        //24-
        //tableView.separatorStyle = .none
        //25- registrar
        tableView.register(CarTableViewCell.nib(), forCellReuseIdentifier: CarTableViewCell.identifier)
        
        }
        
    }
//4-
extension ViewController: UITableViewDelegate {
    
}
//4-
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //26-
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //27
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier, for: indexPath) as? CarTableViewCell
            cell?.setupCell(name: listImage, title: "Carro")
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier, for: indexPath) as? CarTableViewCell
            cell?.setupCell(name: listImage2, title: "Motocicleta")
            return cell ?? UITableViewCell()
        }
    }
        
        //29-
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 364
    }
    
}


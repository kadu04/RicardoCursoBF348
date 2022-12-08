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
    
    
    private var viewModel: ViewModel = ViewModel()
    
    //28- criar o array, a lista de imagens
//    var vehicleList: [Vehicle] = [
//        Vehicle(title: "Carro", list: ["car1","car2","car3","car4","car5","car6"]),
//        Vehicle(title: "Motocicleta", list: ["moto1","moto2","moto3","moto4","moto5","moto6"]),
//        Vehicle(title: "Avião", list: ["avião1","avião2","avião3","avião4","avião5","avião6"]),
//        Vehicle(title: "Caça", list: ["caça1","caça2","caça3","caça4","caça5","caça6"]),
//        Vehicle(title: "Trem", list: ["trem1","trem2","trem3","trem4","trem5","trem6"]),
//    ]
                                  
        override func viewDidLoad() {
        super.viewDidLoad()
        //3- se criou um método, tem que chamá-lo. é o primeiro ciclo de vida a ser chamado.
        configTableView()
    }
    
    //2- assinar os protocolos delegate e datasource
        func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
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
        //return vehicleList.count
        return viewModel.numberOfRowsInSection
    }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier, for: indexPath) as? CarTableViewCell
//        cell?.setupCell(data: vehicleList[indexPath.row])
            cell?.setupCell(data: viewModel.loadCurrentVehicle(indexPath: indexPath))
        return cell ?? UITableViewCell()
            }
            
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return 364
            return viewModel.heightForRowAt
            
    }
            
}

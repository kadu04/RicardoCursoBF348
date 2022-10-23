//
//  ViewController.swift
//  PrimeiroProjetoTableView
//
//  Created by Ricardo Massaki on 20/10/22.
//

import UIKit

// Passo a Passo
// Criar a TableView
// Fazer a ligação
// Configurar a TableView
// Criar a celula
// Configurar celula
// Registrar a celula
// Configurar exibição da celula



class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [String] = ["Caio", "Felipe", "Jean", "Lucas", "Andressa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NameTableViewCell.nib(), forCellReuseIdentifier: NameTableViewCell.identifier)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    // Indicar a quantidade de linhas por sessão
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    //Popular a celula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NameTableViewCell.identifier, for: indexPath) as? NameTableViewCell
        print(indexPath.row)
        cell?.setupCell(name: data[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
}

extension ViewController: UITableViewDelegate {
    
}



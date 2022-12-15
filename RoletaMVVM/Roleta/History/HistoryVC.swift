//
//  HistoryVC.swift
//  Roleta
//
//  Created by Ricardo Massaki on 07/12/22.
//

import UIKit

class HistoryVC: UIViewController {
    
    //19- colocar a TableView na Tela02, mudar o nome do botão de "Item02" para "History".
    //Depois criar o grupo "Jason", e o file -> cocoa touch class -> empty -> e opção "Other" -> no "Save as" colocar -> history.jason -> dpois criar ou colocar os arquivos lá.
    //depois criar o "File" "Swift File", nome "Histoy" na pasta MODEL, para "transformar" os arquivos json para SWIFT. -> //20-
    //fazer a ligação da TableView.
    
    @IBOutlet weak var tableView: UITableView!
    
    //26- chamar a fetchHistory
    let viewModel: HistoryViewModel = HistoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        //26(1)
        viewModel.fetchHistory()
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HistoryAccountListTableViewCell.nib(), forCellReuseIdentifier: HistoryAccountListTableViewCell.identifier)
        tableView.separatorStyle = .none
    }
    
}

extension HistoryVC: UITableViewDelegate {
    
}

extension HistoryVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryAccountListTableViewCell.identifier, for: indexPath) as? HistoryAccountListTableViewCell
        cell?.setupCell(data: viewModel.loadCurrentHistoryAccountList(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
}

extension HistoryVC: HistoryViewModelProtocol {
    func success() {
        configTableView()
    }
    
    func error(detail: String) {
        print(detail)
    }
}


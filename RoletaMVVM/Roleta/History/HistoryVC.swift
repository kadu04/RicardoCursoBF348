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
    
    //30- Popular uma TableView (Aula 37) Criar a tableView e fazer a ligação dela.
    @IBOutlet weak var tableView: UITableView!
    
    //26- chamar a fetchHistory
    let viewModel: HistoryViewModel = HistoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //46-
        viewModel.delegate(delegate: self)
        //26(1)
        viewModel.fetchHistory()
    }
    
    //31- Criar o método da TableView
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        //39- fazer o register da HistoryAccountListTableViewCell
        tableView.register(HistoryAccountListTableViewCell.nib(), forCellReuseIdentifier: HistoryAccountListTableViewCell.identifier)
        tableView.separatorStyle = .none
    }
    
}

//32- fazer a extension da TableView, dpois ir na HistoryViewModel e criar 
extension HistoryVC: UITableViewDelegate {
    
}

extension HistoryVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 0 -> depois mudar
        //34- mudar para o abaixo
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //40- dpois de registrar, criar a função
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryAccountListTableViewCell.identifier, for: indexPath) as? HistoryAccountListTableViewCell
        cell?.setupCell(data: viewModel.loadCurrentHistoryAccountList(indexPath: indexPath))
        // return UITableViewCell() -> depois mudar
        //40(1)- mudar para o abaixo
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
}

//47- dpois ir para HistoryViewModel
extension HistoryVC: HistoryViewModelProtocol {
    func success() {
        configTableView()
    }
    
    func error(detail: String) {
        print(detail)
    }
}


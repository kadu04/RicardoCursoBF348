//
//  ViewController.swift
//  ProjeetoTabBar
//
//  Created by Ricardo Massaki on 11/11/22.
//

import UIKit

class Tela01ViewController: UIViewController {
    
    
    //1- Fazer as ligações dos botões
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var editPhotoButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //11-
    var data: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemYellow
        self.view.addSubview(self.userImageView)
        //10
        configTableView()
    }
    
    //6-
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)

    }
    
    //1-
    @IBAction func tappedAddButton(_ sender: UIButton) {
        data.append(nameTextField.text ?? "")
        nameTextField.text = ""
        tableView.reloadData()
        nameTextField.resignFirstResponder()
    }
    
}

//7-
extension Tela01ViewController: UITableViewDelegate {
        
    }
//7-
extension Tela01ViewController: UITableViewDataSource {
    //8-
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //9- colocar o return e deixar como "0", depois mudar, neste caso "return data.count
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //8-
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell
        cell?.setupCell(user: User(name: data[indexPath.row], image: UIImage(named: "trem4" ) ?? UIImage()))
                                                                   
        //9- return UITableViewCell()"e depois mudar
        return cell ?? UITableViewCell()
    }
    
    //9-
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 173
    }
}
        
    

    





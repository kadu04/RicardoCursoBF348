//
//  ViewController.swift
//  ProjeetoTabBar
//
//  Created by Ricardo Massaki on 11/11/22.
//

import UIKit

class Tela01ViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var editPhotoButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var data: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemYellow
        self.view.addSubview(self.userImageView)
        configTableView()
    }
    
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewViewCell.nib(), forCellReuseIdentifier: TableViewViewCell.identifier)

    }
    
    @IBAction func tappedAddButton(_ sender: UIButton) {
        data.append(nameTextField.text ?? "")
        nameTextField.text = ""
        tableView.reloadData()
        nameTextField.resignFirstResponder()
    }
    
}

    extension Tela01ViewController: UITableViewDelegate {
        
    }
    
extension Tela01ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewViewCell.identifier, for: indexPath) as? TableViewViewCell
        cell?.setupCell(user: User(name: data[indexPath.row], image: UIImage(named: "trem4"
                                                                            ) ?? UIImage()))
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 173
    }
}
        
    

    





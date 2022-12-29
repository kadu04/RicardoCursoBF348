//
//  ViewController.swift
//  FirebaseCoreDataCursoBF348
//
//  Created by Ricardo Massaki on 28/12/22.
//
// Criar cadastro no Firebase
// No Firebase, fazer download de GoogleService-info.plist e jogar no projeto.(ver screenshot)

import UIKit
//01-fazer o import do FirebaseAuth
import FirebaseAuth

class ViewController: UIViewController {
    
    //4- Fazer a ligação dos botões.
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var removeButton: UIButton!
    
    //11-
    let viewModel: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //10-
        configTableView()
        //21-
        loadData()
        
        //2- Realizar cadastro do usuário, dentro do viewDidLoad. Auth é responsável pela autenticação (cadastro, login, saber se o usuário está logado, se deixou de logar, falar para ele deslogar do ap, etc)
        
        //        Auth.auth().createUser(withEmail: "ricardotest@gmail.com", password: "123456") { authResult, error in
        //                    if error == nil {
        //                        print("Sucesso cadastro!")
        //                    } else {
        //                        print("Opss, falha em realizar o cadastro, segue o error: \(error?.localizedDescription ?? "")")
        //                    }
        //                }
        
        // 2- Realizar login usuário
        
        //                Auth.auth().signIn(withEmail: "ricardoTest@gmail.com", password: "123456") { authResult, error in
        //                    if error == nil {
        //                        print("Sucesso login")
        //                    } else {
        //                        print("Opss, falha em realizar o login, segue o error: \(error?.localizedDescription ?? "")")
        //                    }
        //                }
        
        // 3- Criar layout na Main
    }
    
    //22-
    func loadData() {
        viewModel.loadData {
            tableView.reloadData()
        }
    }
    
    //5- assinar delegate e dataSource, e registrar a célula.
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    //4- Fazer a ligação dos botões, e depois criar  o GRUPO CELL e FILE (cocoa touch class), e criar static lá.
    @IBAction func tappedRemoveButton(_ sender: UIButton) {
        //28-
        viewModel.removePerson(name: nameTextField.text ?? "", age: Int(ageTextField.text ?? "") ?? 0) { success in
            if success {
                loadData()
            } else {
                print("deu ruim delete...")
            }
        }
    }

//4- Fazer a ligação dos botões.
    @IBAction func tappedAddButton(_ sender: UIButton) {
        //14-
        viewModel.addPerson(name: nameTextField.text ?? "", age: Int(ageTextField.text ?? "") ?? 0) { success in
            //15- tableView.reloadData() - dpois trocar pelo o abaixo -//23(3)- colocar "complition e dar enter"
            if success {
                loadData()
            } else {
                print("deu ruim...")
            }
        }
    }
}

//6- fazer a extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //8- MMVC - levar o numberOfRowsInSection para a viewModel
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //12(01)- depois ir para viewModel
        //return 0 (depois mudar para o abaixo)
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        //16- cell?.setupCell() - dpois trocar pelo o abaixo
        //24(01)-
        cell?.setupCell(person: viewModel.loadCurrentPerson(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    //7- MMVC - levar o heightForRowAt para a viewModel
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //12-
        //return 78 (depois mudar para o abaixo)
        return viewModel.heightForRowAt
    }
    
}

//17- ir no arquivo FirebaseCoreData, clicar no "Add Empty".
// Alterar o nome do arquivo de "Empty" para "Person"
// ver as alterações a serem feitas, no Screen Shot "26"
// Depois ir para a ViewModel










//
//  ViewController.swift
//  Roleta
//
//  Created by Ricardo Massaki on 24/11/22.

//1-Layout botao. Type = Custom e Style = Default

import UIKit

class ViewController: UIViewController {
    
    //2- ligação dos Botões
    @IBOutlet weak var logoAppImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var drawNumberButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    //19- Criar o array, depois alterar lá no return
    var listPerson: [Person] = []
    //20- Criar a lista de imagem Person para ser aleatória
    var listImage: [String] = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //5- se criou um método, tem que chamá-lo. é o primeiro ciclo de vida a ser chamado. Depois criar o grupo Cell.
        configTableView()
        //11(1)- se criou um método, tem que chamá-lo.
        configTextEndColors()
        
        
        
    }
    
    //11- Criar função para colocar text dentro do Placeholder
    func configTextEndColors() {
        nameTextField.placeholder = "Digite um nome"
        //12- Fazer o teclado baixar depois que clicar no retorno do teclado
        nameTextField.delegate = self
        //10- Mudar o fundo da tableView
        tableView.backgroundColor = .black
    }
    
    //3- assinar os protocolos delegate e datasource
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        //11(1) Remover a linha separador da tableView
        tableView.separatorStyle = .none
        //9- Registrar a célula EmptyTableViewCell
        tableView.register(EmptyTableViewCell.nib(), forCellReuseIdentifier: EmptyTableViewCell.identifier)
        //18- Registrar a célula PersonTableViewCell
        tableView.register(PersonTableViewCell.nib(), forCellReuseIdentifier: PersonTableViewCell.identifier)
    }
    
    //2- ligação dos Botões
    
    @IBAction func tappedDrawNumberButton(_ sender: UIButton) {
    }
}


//4- Fazer a extension.
extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //23- fazer uma validação para caso o count == 0, eu quero que ele retorne uma célula,p/ exibir a célula de EmptyTableViewCell
        if listPerson.count == 0 {
            return 1
        } else {
            return listPerson.count
        }
        
        //10(1)Mudar return de "0" para (1) p/testar.
        //19(1) Depois que criar o array //19-, mudar o return, e depois fazer a validação //23-
//        return listPerson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //22-fazer validação para ver se a célula é a empty ou a outra
        if listPerson.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier) as? EmptyTableViewCell
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell
            cell?.setupCell(data: listPerson[indexPath.row])
            return cell ?? UITableViewCell()
        }
        
        
        //10- criar o dequeueReusableCell do EmptyTableViewCell. depois colocar no //22-
        //let cell = tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier) as? EmptyTableViewCell
        
        //18- comentar o EmptyTableViewCell acima e criar o do PersonTableViewCell
        // depois comentar ela e colocar no //22-
//        let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell
        
        //18(1)
        //cell?.setupCell(data: Person(name: "Ricardo", image: "Image-4"))
        
        //21(2)- Depois que criar o array listPerson, modificar !!!
//        cell?.setupCell(data: listPerson[indexPath.row]) -depois colocar na //22-
//        return cell ?? UITableViewCell() -depois colocar na //22-
    }
    //18(2) Tamanho da célula PersonTableViewCell. depois ir no grupo Person e alterar cor do nameLabel
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //24-
        if listPerson.count == 0 {
            return 248
        } else {
            return 92
        }
    }
}

//13- Criar a extension do nameTextField. Depois criar o grupo Person.
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //21- para adicionar o participante, toda vez que apertar no Return do teclado
        listPerson.append(Person(name: textField.text ?? "", image: listImage.randomElement() ?? ""))
        //21(1)- recarregar a tableView
        tableView.reloadData()
        return true
    }
}

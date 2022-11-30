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
    //28(3) - criar a variável person
    var person: Person?
    //30-
    var alert: AlertController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //31- fazer a instância do AlertController
        alert = AlertController(controller: self)
        //5- se criou um método, tem que chamá-lo. é o primeiro ciclo de vida a ser chamado. Depois criar o grupo Cell.
        configTableView()
        //11(1)- se criou um método, tem que chamá-lo.
        configTextEndColors()
        //37- criou um método, tem que chamar! para desabilitar o botão somente se tiver alguém na tela
        blockedDrawNumberButton()
        
        
        
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
    
    //36- função para o botão sortear, sorteie somente se tiver alguém lá na tela
    func blockedDrawNumberButton() {
        if listPerson.isEmpty {
            drawNumberButton.isEnabled = false
            drawNumberButton.alpha = 0.5
        } else {
            drawNumberButton.isEnabled = true
            drawNumberButton.alpha = 1
        }
    }
    
    //2- ligação dos Botões
    @IBAction func tappedDrawNumberButton(_ sender: UIButton) {
        //28(2)- fazer a lógica do sorteio. primeiro colocar "var person", dpois de fazer o //28(2)trocar por "self.person"
        self.person = listPerson.randomElement()
        //28(3) para printar, dpois trocar para dump(person)
        //print(person)
        dump(person)
    }
    
//    func textFieldIsNotEmpty() -> Bool {
//        if nameTextField.text?.isEmpty ?? true || nameTextField.text?.hasPrefix(" ") ?? true {
//            //NÃO adicione o novo elemento
//            return false
//        } else {
//            //Adicione o novo elemento
//            return true
//        }
//    }
}

//4- Fazer a extension.
extension ViewController: UITableViewDelegate {
    //27- qdo for disparado, dizer quem foi selecionado. didSelectRowAt é o método que intercepta as ações qdo precionamos em uma célula.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //27- depois que fizer o //28- pode apagar!!
//        print(listPerson[indexPath.row])
        //28(3)- para printar, dpois trocar para  dump(self.listPerson[indexPath.row])
        // print(self.listPerson[indexPath.row])
        //35- depois que criar o //34- e rodar o ap, deletar  dump(self.listPerson[indexPath.row])
        //dump(self.listPerson[indexPath.row])
        //28(1)- lógica para saber a pessoa que foi precionada foi sorteada ou não! depois trocar pelo //28(1). trocar de struct para class no Model
        if self.listPerson[indexPath.row] === self.person {
            print("parabens você foi sorteado, então pague a conta")
            //32-
            alert?.showAlert(title: "Muito bom", message: "Agora é sua vez, pague a conta ;)")
            //34 - remover todo mundo
            listPerson.removeAll()
        } else{
            print("uffa, você escapou")
            //33- deletar o usuário
            listPerson.remove(at: indexPath.row)
        }
        //37(1)- criou um método, tem que chamar! para desabilitar o botão somente se tiver alguém na tela
        blockedDrawNumberButton()
        //33(1)
        tableView.reloadData()
    }
}

//29- criar o Alert, primeiro criar grupo Alert


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
        //25- lógica para qdo apertarmos o retorno não passe um person vazio, sem o nome
        if !(textField.text?.isEmpty ?? false) {
            listPerson.append(Person(name: textField.text ?? "", image: listImage.randomElement() ?? ""))
            tableView.reloadData()
            //37(2)- criou um método, tem que chamar! para desabilitar o botão somente se tiver alguém na tela
            blockedDrawNumberButton()
        }
        //21- para adicionar o participante, toda vez que apertar no Return do teclado
        //listPerson.append(Person(name: textField.text ?? "", image: listImage.randomElement() ?? ""))
        //21(1)- recarregar a tableView
//        tableView.reloadData()
        //24- //Para sumir o nome da pessoa na textField qdo ela digitar
        nameTextField.text = ""
        return true
    }
}

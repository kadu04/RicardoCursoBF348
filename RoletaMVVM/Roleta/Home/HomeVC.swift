//
//  ViewController.swift
//  Roleta
//
//  Created by Ricardo Massaki on 24/11/22.

//1- Trocar o nome da viewController por HomeVC
//1- Criar grupo Home, e arrastar a HomeVC.
//2- criar dentro do grupo Home, outro grupo chamado viewModel e criar tambem o file HomeViewModel (class NSObject)



import UIKit

class HomeVC: UIViewController {
    
    //AULA 32 -> Fazer as ligações dos botões.
    @IBOutlet weak var logoAppImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var drawNumberButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //7- criar a HomeViewModel
    var viewModel: HomeViewModel = HomeViewModel()
    
    
    //5- LEVAR AS VARIAVEIS listPerson, listImage E person PARA A VIEWMODEL
    // DICA: REMOVER TODOS OS OBJETOS A HOMEVC POIS DEVEM PERMANECER PRIVATE NA VIEWMODEL.
//    var listPerson: [Person] = []
//    var listImage: [String] = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5"]
//    var person: Person?
    var alert: AlertController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert = AlertController(controller: self)
        configTableView()
        configTextEndColors()
        blockedDrawNumberButton()
    }
    
    
    func configTextEndColors() {
        nameTextField.placeholder = "Digite um nome"
        nameTextField.delegate = self
        tableView.backgroundColor = .black
    }
    
    //7(1) se vai ter uma TableView, tem que fazer a configuração dela, e dpois chamar no viewDidLoad
    func configTableView() {
        //7(2)- assinar os protocolos da TableView
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        //7(3)- registrar as células da TableView
        tableView.register(EmptyTableViewCell.nib(), forCellReuseIdentifier: EmptyTableViewCell.identifier)
        tableView.register(PersonTableViewCell.nib(), forCellReuseIdentifier: PersonTableViewCell.identifier)
    }
    
    //8(1) Tudo que tiver LÓGICA, transferir para a HomeViewModel
    func blockedDrawNumberButton() {
        //9- Criou a var na HomeViewModel,agora tem que chamar! "if listPerson.isEmpty" mudar para "if viewModel.isListPersonEmpty
        if viewModel.isListPersonEmpty {
            drawNumberButton.isEnabled = false
            drawNumberButton.alpha = 0.5
        } else {
            drawNumberButton.isEnabled = true
            drawNumberButton.alpha = 1
        }
    }
    
    
    @IBAction func tappedDrawNumberButton(_ sender: UIButton) {
        //12- depois que mandar essa lógica pra lá, excluir as 2 linhas e substituir por: viewModel.drawNumber()
//        self.person = listPerson.randomElement()
//        dump(person)
        viewModel.drawNumber()
    }
}

extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //13(1)- depois que mandar essa lógica pra lá, excluir a linha e substituir por:
        //if self.listPerson[indexPath.row] === self.person {
        if viewModel.checkPersonPayer(indexPath: indexPath) {
            //print("parabens você foi sorteado, então pague a conta")
            alert?.showAlert(title: "Muitoo bom", message: "Agora é sua vez, pague a conta ;)")
            //14(1)- depois que mandar essa lógica pra lá, excluir a linha e substituir por:
            viewModel.removeAll()
            //listPerson.removeAll()
        } else{
            print("uffa, você escapou")
            //15(1)- depois que mandar essa lógica pra lá, excluir a linha e substituir por:
            viewModel.removePerson(indexPath: indexPath)
            //listPerson.remove(at: indexPath.row)
        }
        
        blockedDrawNumberButton()
        tableView.reloadData()
    }
}

//7(4)- fazer os métodos da TableView
extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //10- fazer a mesma lógica. alterar de "if listPerson.count == 0" para "if viewModel.isListPersonEmpty
        //16(1)- depois que mandar essa lógica pra lá, excluir TUDO e substituir por pelo return
//        if viewModel.isListPersonEmpty {
//            return 1
//        } else {
//            return listPerson.count
//        }
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //10(1)- fazer a mesma lógica. alterar de "if listPerson.count == 0" para "if viewModel.isListPersonEmpty"
        if viewModel.isListPersonEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier) as? EmptyTableViewCell
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell
            //17(1)- depois que mandar essa lógica pra lá, substituir por:
            cell?.setupCell(data: viewModel.loadCurrentPerson(indexPath: indexPath))
            //cell?.setupCell(data: listPerson[indexPath.row])
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //10(2)- fazer a mesma lógica. alterar de "if listPerson.count == 0" para "if viewModel.isListPersonEmpty"
        //18(1)- depois que mandar essa lógica pra lá, excluir TUDO e substituir por pelo return. depois criar o grupo History e file HistoryVC //19-
//        if viewModel.isListPersonEmpty {
//            return 248
//        } else {
//            return 92
//        }
        return viewModel.heightForRowAt
    }
}


extension HomeVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if !(textField.text?.isEmpty ?? false) {
            viewModel.appendPerson(name: textField.text ?? "")
            //listPerson.append(Person(name: textField.text ?? "", image: listImage.randomElement() ?? ""))
            tableView.reloadData()
            blockedDrawNumberButton()
        }
        nameTextField.text = ""
        return true
    }
}

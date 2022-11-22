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
    
    @IBOutlet weak var photoEditButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //11-
    var data: [User] = []
    //17-
    let imagePicker: UIImagePickerController = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.view.backgroundColor = .systemYellow
        //        self.view.addSubview(self.userImageView)
        //10- Não esquecer de chamar as funções.
        configTableView()
        configTextEndColors()
        //20-
        configImagePicker()
    }
    
    //18- configurar o imagePicker
    func configImagePicker() {
        imagePicker.delegate = self
    }
    
    //13-Criar uma função, para não repovoar muito o viewDidLoad, mas não tem problema em colocar tudo dentro do mesmo.
    func configTextEndColors() {
        nameTextField.placeholder = "Digite seu nome:"
        //13-colocar o nome das label e botões
        nameLabel.text = "Nome"
        addButton.setTitle("Adicionar", for: .normal)
        photoEditButton.setTitle("Ediar", for: .normal)
        //colocar imagem no userImageView
        userImageView.image = UIImage(systemName: "person.circle.fill")
        //14- trocar com da imagem
        userImageView.tintColor = .black
        //16(1)- fazer o protocolo do nameTextField
        nameTextField.delegate = self
    }
    
    //6-
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        
    }
    //1-
    @IBAction func tappedPhotoEditButton(_ sender: UIButton) {
        //21(1)- fazer validação para acessar a galeria de fotos
        imagePicker.allowsEditing = false
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            imagePicker.sourceType = .camera
//        } else {
//            imagePicker.sourceType = .photoLibrary
//        }
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
            
    }
    
    //21(2)- Ir no "Info". Dentro do "Information property LIst", selecionar o "Privacy - Photo Library Usage Description" e escrever no "Valor", "O app deseja ter acesso a sua biblioteca"
    //Também selecionar o "Privacy - Camera Usage Description" e escrever no "Valor", "O app deseja ter acesso a sua Camera"
    
    @IBAction func tappedAddButton(_ sender: UIButton) {
        //15-
        if textFieldIsNotEmpty() {
            //12-
            data.append(User(name: nameTextField.text ?? "", image: userImageView.image ?? UIImage()))
            //reloadData faz a tableView se carregar
            tableView.reloadData()
            //Para sumir o nme da pessoa na textField qdo ela digitar
            nameTextField.text = ""
            //22- criar um "Alert" se necessário.
        } else {
            let alertController = UIAlertController(title: "Atenção!!", message: "Informe o nome corretamente", preferredStyle: .alert)
            //23- criação do botão para o Alert
            let ok = UIAlertAction(title: "Ok", style: .cancel)
            //24-Adicionar o botão
            alertController.addAction(ok)
            //25-Chamar um "present" para poder apresentar o "Alert na frente.
            present(alertController, animated: true)
        }
    }
    
    //15- função para dizer se o textefield tem valor ou não, se está vazia ou não.
    func textFieldIsNotEmpty() -> Bool {
        if nameTextField.text?.isEmpty ?? true || nameTextField.text?.hasPrefix(" ") ?? true {
            //NÃO adicione o novo elemento
            return false
        } else {
            //Adicione o novo elemento
            return true
        }
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
        cell?.setupCell(user: data[indexPath.row])
        //9- return UITableViewCell()"e depois mudar
        return cell ?? UITableViewCell()
    }
    
    //9-
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 147
        
    }
}

//16(2)
extension Tela01ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
        
//19- criar extension do imagePicker
extension Tela01ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //didFinishPickingMediaWithInfo pega a imagem que vc selecionou e troca a imagem de perfil.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.userImageView.image = image
        }
        picker.dismiss(animated: true)
    }
}
    

    





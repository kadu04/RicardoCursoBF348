//
//  SelectionViewController.swift
//  NotificationCenterProtocol
//
//  Created by Ricardo Massaki on 23/11/22.
//

import UIKit

//11- Criando um protocolo, para a tela SelectionViewController voltar para a tela ViewController, através de "Protocol".
protocol SelectionViewControllerProtocol: AnyObject {
    func tappedMacbook()
    func tappedImac()
}



class SelectionViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var macbookButton: UIButton!
    
    @IBOutlet weak var imacButton: UIButton!
    
    //12- Criar um "weak" que é uma referencia FRACA. Toda vez que criamos um "weak" ele é algo "OPCIONAL (?)"
    weak var delegate: SelectionViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tappedMacbookButton(_ sender: UIButton) {
        //7 e //8- Fazer o botão avisar, "GRITAR"       "macbook" não é uma boa prática trabalhar com String mágicas
        //13- Comenta o NotificationCenter pq ao invés dele, vai ser usado o "Protocol"
        //NotificationCenter.default.post(name: .macbook, object: nil)
        //5- qdo estamos trabalhando com "Modal" temos que colocar o "dismiss".na segunda tela, clicando em qlq botão, ele volta para a primeira tela.
        //14- Chamar o método tappedMacbook através do "delegate (contrato, o protocolo)"
        delegate?.tappedMacbook()
        dismiss(animated: true)
    }
    
    @IBAction func tappedImacButton(_ sender: UIButton) {
        //7-
        //8- dpois que criar o grupo Extension, trocar o "NSNotification.Name("imac")", pelo static let que foi criado, neste caso .imac
        //13- Comenta o NotificationCenter pq ao invés dele, vai ser usado o "Protocol"
        //NotificationCenter.default.post(name: .imac, object: nil)
        //14- Chamar o método tappedImac através do "delegate (contrato, o protocolo)"
        delegate?.tappedImac()
        //5-
        dismiss(animated: true)
    }
}


//Obs: Se estiver trabalhando com NavigationController, tem que colocar no lugar do "dismiss":
// navigationController?.popViewController(nimad: true)

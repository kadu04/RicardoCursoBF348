//
//  ViewController.swift
//  NotificationCenterProtocol
//
//  Created by Ricardo Massaki on 22/11/22.
//1-Fazer o layout das telas.
//2-Fazer ligações dos botões.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var chooseButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configColorEndText()
        //11-
        configObserver()
    }
    
    //NotificationCenter, qdo temos que trocar um devido valor, fazer a manipulação de um dado, utilizamos o NotificationCenter. Ele avisa para todas as classes do aplicativo. E como ele avisa, tem classes que ouvem e obtem(fazem) uma devida ação.
    //NotificationCenter não é para ser usado frequentemente. O pouco uso dele é qdo usamos TableBarController
    
    //9- Como o botão avisou (GRITOU) lá na SelectionViewController, agora temos que fazer uma função para alguém "ESCUTAR", neste caso a ViewController.
    func configObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateImac), name: .imac, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateMacbook), name: .macbook, object: nil)
    }
    
    //10-
    @objc func updateImac() {
        logoImageView.image = UIImage(named: "imac_pro")
        nameLabel.text = "Imac das galáxias"
        view.backgroundColor = .cyan
        
    }
    //10-
    @objc func updateMacbook() {
        logoImageView.image = UIImage(named: "macbook_pro")
        nameLabel.text = "MacBook Pro"
        view.backgroundColor = .red
        
    }
    
    //6- Trocar o fundo da tela de "verde" para "Preta."
    func configColorEndText() {
        view.backgroundColor = .black
        nameLabel.text = ""
    }
    
    @IBAction func tappedChooseButton(_ sender: UIButton) {
        //3- "String(describing: SelectionViewController.self" está transformando o nome da classe em uma String
        //15(1)- Depois colocar o " as? SelectionViewController" para acessar o delegate lá da SelectionViewController
        let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: SelectionViewController.self)) as? SelectionViewController
        //4- Para a segunda tela cobrir toda a tela.
        vc?.modalPresentationStyle = .fullScreen
        //15(2)-
        vc?.delegate = self
        //3-criar o "present"
        present(vc ?? UIViewController(), animated: true)
    }
    
}

//16- Criar a "extension da classe ViewController" e apertar o "Fix"
extension ViewController: SelectionViewControllerProtocol {
    func tappedMacbook() {
        // Copiar do @objc func updateMacbook()
        logoImageView.image = UIImage(named: "macbook_pro")
        nameLabel.text = "MacBook Pro"
        view.backgroundColor = .red
    }
    
    func tappedImac() {
        // Copiar do @objc func updateImac()
        logoImageView.image = UIImage(named: "imac_pro")
        nameLabel.text = "Imac das galáxias"
        view.backgroundColor = .cyan
    }
}


// criamos uma extension para poder deixar o nosso codigo mais organizada

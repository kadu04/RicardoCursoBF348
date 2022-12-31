//
//  ViewController.swift
//  PrimeiroProjetoViewCodeCursoBF348
//
//  Created by Ricardo Massaki on 28/12/22.
//
// ViewCode é uma maneira de construir o LAYOUT dos nossos aplicativos, criar nos elementos, nossas navegações.
//ViewCode se trabalha de maneira programática.
//01- acessar projeto, dpois "Build Settings". escrever "main" (direita acima), e deletar a referencia "main".
//02- ir no arquivo "Info", precionar command F, escrever "main" e apagar a referencia "main"
//03- acessar SceneDelegate.


import UIKit

class LoginVC: UIViewController {
    
    //11-
    var screen: LoginScreen?
    
    //10-
    override func loadView() {
        //12-
        screen = LoginScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //levar o backgroundColor lá para a LoginScreen
//        view.backgroundColor = .red
    }
    
    


}


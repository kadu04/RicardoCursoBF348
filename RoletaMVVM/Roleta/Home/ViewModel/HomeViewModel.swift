//
//  HomeViewModel.swift
//  Roleta
//
//  Created by Ricardo Massaki on 30/11/22.
//

import UIKit

// Passar arquitetura MVC para o MVVM
//4- excluir p NSObject
class HomeViewModel {
    
    //6- FORA TRAZIDOS DA HomeVC E ACRESCENTAR PRIVATE 
    private var listPerson: [Person] = []
    private var listImage: [String] = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5"]
    private var person: Person?

    //8- criar a validação
    //primeira abordagem -> variável computada (melhor opção)
    var isListPersonEmpty: Bool {
        return listPerson.isEmpty
    }
    
    //segunda abordagem -> função com retorno
//    func isListPersonEmpty() -> Bool {
//        return listPerson.isEmpty
//    }
    
    //11- criar a func do botão "tappedDrawNumberButton"para trazer ela pra cá!
    //essa função faz o sorteio dos participantes!
    func drawNumber() {
        self.person = listPerson.randomElement()
    }
    
    //13- criar a func do "self.listPerson[indexPath.row] === self.person" para trazer ela pra cá!
    //essa função é para saber se quem eu selecionei, foi sorteado.
    //vai dar erro, mas precisa passar o parâmetro, neste caso ->  indexPath: IndexPath
    func checkPersonPayer(indexPath: IndexPath) -> Bool {
        return self.listPerson[indexPath.row] === self.person
    }
    
    //14- criar a func do "listPerson.removeAll()" para trazer ela pra cá!
    func removeAll() {
        listPerson.removeAll()
    }
    
    
    //15- criar a func do "listPerson.remove(at: indexPath.row)" para trazer ela pra cá!
    //vai dar erro, mas precisa passar o parâmetro, neste caso ->  indexPath: IndexPath
    func removePerson(indexPath: IndexPath) {
        listPerson.remove(at: indexPath.row)
    }
    
    
    //16- criar uma variavel computada do "isListPersonEmpty" para trazer ela pra cá!
    //excluir o "viewModel"da variável.
    var numberOfRowsInSection: Int {
        if isListPersonEmpty {
            return 1
        } else {
            return listPerson.count
        }
    }
    
    
    //17- criar a func do setupCell para trazer ela pra cá!
    // se coloca o -> (return), pq ele espera um retorno
    func loadCurrentPerson(indexPath: IndexPath) -> Person {
        return listPerson[indexPath.row]
    }
    
    
    //18- criar uma variavel computada do heightForRowAt para trazer ela pra cá!
    //excluir o "viewModel"da variável.
    var heightForRowAt: CGFloat {
        if isListPersonEmpty {
            return 248
        } else {
            return 92
        }
    }
    
    
    var textField = UITextField()
    //var textField: UITextField
    func appendPerson() {
        listPerson.append(Person(name: textField.text ?? "", image: listImage.randomElement() ?? ""))
    }

}

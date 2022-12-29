//
//  ViewModel.swift
//  FirebaseCoreDataCursoBF348
//
//  Created by Ricardo Massaki on 29/12/22.
//

import UIKit
import CoreData

class ViewModel {
    
    //20- criar o array
    var listPerson: [Person] = []
    
    //18- Criar o persistenContainer que diz o conteudo que ele contem
    lazy var persistenContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FirebaseCoreData")
        container.loadPersistentStores { storeDescription, error in
            //if se for diferente de nil
            if error != nil {
                fatalError("\(error?.localizedDescription ?? "")")
            }
        }
        return container
    }()
    
    //19- criar o loadData, que faz uma varruada no banco de dados, p/ver se já foi adicionado alguém
    public func loadData(completion: () -> Void) {
        let context = persistenContainer.viewContext
        let request = NSFetchRequest<Person>(entityName: "Person")
        let result = try? context.fetch(request)
        //20(1)- está retornarndo uma lista de Person. depois ir para ViewController.
        listPerson = result ?? []
        //19-
        completion()
    }
    //25-
    private func updatePerson(name: String, age: Int) -> Bool {
        let context = persistenContainer.viewContext
        let request = NSFetchRequest<Person>(entityName: "Person")
        
        //filtro com um elemento
        request.predicate = NSPredicate(format: "name == %@", name)
        
        let result = try? context.fetch(request)
        if (result ?? []).isEmpty {
            // não existe alguem com esse nome, pode cadastrar!
            return false
        } else {
            // eita, existe alguem com esse nome
            result?.first?.age = Int64(age)
            do {
                try context.save()
            } catch {
                return true
            }
            return true
        }
    }
    
    //13- fazer a função - public func addPerson(name: String, age: Int){} - (dpois ir p/ViewController)
    //23- colocar o completion - "completion: (_ success: Bool) -> Void) {
    public func addPerson(name: String, age: Int, completion: (_ success: Bool) -> Void) {
        //26-
        if updatePerson(name: name, age: age) {
            completion(true)
        } else {
            //23- atualizar
            let context = persistenContainer.viewContext
            let person = Person(context: context)
            person.name = name
            person.age = Int64(age)
            
            do {
                try context.save()
                //23(1)-
                completion(true)
            } catch {
                // deu ruim
                //23(2)-
                completion(false)
            }
        }
    }
    
    //27- Toda vez que cria um completion, tem que colocar o VOID
    public func removePerson(name: String, age: Int, completion: (_ success: Bool) -> Void) {
        
        let context = self.persistenContainer.viewContext
        let request = NSFetchRequest<Person>(entityName: "Person")
        
        // filtro com um elemento
        request.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let result = try context.fetch(request)
            for value in result {
                context.delete(value)
            }
        } catch  {
            print("deu ruim ao deletar")
            completion(false)
        }
        
        do {
            try context.save()
            completion(true)
        } catch  {
            print("deu ruim salvar")
            completion(false)
        }
    }
    
    //9- fazer o loadCurrentPerson (dpois ir p/ViewController)
    //24- mudar de "func loadCurrentPerson(indexPath: IndexPath)" para o ABAIXO
    func loadCurrentPerson(indexPath: IndexPath) -> Person {
        return listPerson[indexPath.row]
    }
    //8(01)- MMVC - trazer o numberOfRowsInSection da viewController
    public var numberOfRowsInSection: Int {
        //22-  mudar return de "return 2" para "return listPerson.count"
        return listPerson.count
    }
    //7(01)- MMVC - trazer o heightForRowAt da viewController
    public var heightForRowAt: CGFloat {
        return 78
    }
    
}

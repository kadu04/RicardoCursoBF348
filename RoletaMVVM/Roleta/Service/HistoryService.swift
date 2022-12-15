//
//  HistoryService.swift
//  Roleta
//
//  Created by Ricardo Massaki on 07/12/22.
//

//21- dpois de criar o File HistoryService, criar o File GenericService (Swift File)

import UIKit
//30- colocar o import para poder acessar a biblioteca ou modulo
import Alamofire

//23- criar o protocol HistoryServiceProtocol. e colocar GenericService que é o protocol de onde ele herdou
protocol HistoryServiceProtocol: GenericService {
    //23(1)- a func (completion: @escaping completion<History?>) sempre vai ser padrão, e o @escaping usamos para dizer para a função que ela vai ser disparada, mas para ela não desaparecer e sim ficar de standby, enquanto o "completion" não disparar.
    func getHistoryFromJson(completion: @escaping completion<History?>)
    //27- //URLsession - é uma classe nativa que através dela conseguimos realizar requisições de uma maneira nativa. dpois que colocar a func, vai dar erro na "class HistoryService: HistoryServiceProtocol"aí apertar o FIX.
    func getHistoryURLSession(completion: @escaping completion<History?>)
    //29- dpois que instalar o Alamofire no projeto, fazer a func getHistoryAlamofire, vai dar erro na "class HistoryService: HistoryServiceProtocol"aí apertar o FIX.
    func getHistoryAlamofire(completion: @escaping completion<History?>)
}

//24- a classe HistoryService vai herdar o protocolo que foi criado, neste caso o HistoryServiceProtocol. vai dar o erro, e clicar no FIX.
class HistoryService: HistoryServiceProtocol {
    
    
    func getHistoryAlamofire(completion: @escaping completion<History?>) {
        let urlString: String = "https://run.mocky.io/v3/0f0dd53e-f301-43e4-b902-f90762dd0492"
        AF.request(urlString, method: .get).responseDecodable(of: History.self) { response in
            debugPrint(response)
            switch response.result {
            case .success(let success):
                completion(success,nil)
            case .failure(let error):
                completion(nil,error)
            }
        }
    }
    //27(1)- criar a func,
    func getHistoryURLSession(completion: @escaping completion<History?>) {
        //27(2)- pegar o MOCK, colar no site https://designer.mocky.io/design para pegar a URL
        let URLString: String = "https://run.mocky.io/v3/0f0dd53e-f301-43e4-b902-f90762dd0492"
        guard let url: URL = URL(string: URLString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let dataResult = data else { return }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                do {
                    let history: History = try JSONDecoder().decode(History.self, from: dataResult)
                    print("SUCCESS -> \(#function)")
                    completion(history,nil)
                } catch {
                    print("ERROR -> \(#function)")
                    completion(nil, error)
                }
            } else {
                print("ERROR -> \"(#function)")
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    //24(1) - Fazer a lógica que vai ser PADRÃO!!
    func getHistoryFromJson(completion: @escaping completion<History?>) {
        if let url = Bundle.main.url(forResource: "History", withExtension: "json") {
            //24(2)- COLOCAR O "docatch". o "do" vai tentar fazer, senão conseguir vai cair no "catch" dpois ir para HistoryViewModel criar o PRIVATE
            do {
               let data = try Data(contentsOf: url)
                let history: History = try JSONDecoder().decode(History.self, from: data)
                completion(history,nil)
            } catch {
                completion(nil,error)
            }
        }
    }
}


//28-Alamofire, instalação na aula 36
//28- alamofire é um framework

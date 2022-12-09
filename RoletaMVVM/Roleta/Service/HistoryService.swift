//
//  HistoryService.swift
//  Roleta
//
//  Created by Ricardo Massaki on 07/12/22.
//

import UIKit
import Alamofire

protocol HistoryServiceProtocol: GenericService {
    func getHistoryFromJson(completion: @escaping completion<History?>)
    func getHistoryURLSession(completion: @escaping completion<History?>)
    func getHistoryAlamofire(completion: @escaping completion<History?>)
}

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
    
    func getHistoryURLSession(completion: @escaping completion<History?>) {
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
    
    func getHistoryFromJson(completion: @escaping completion<History?>) {
        if let url = Bundle.main.url(forResource: "History", withExtension: "json") {
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



//
//  GenericService.swift
//  Roleta
//
//  Created by Ricardo Massaki on 07/12/22.
//

import Foundation

//22- criar o protocol GenericService. no lugar do "completion" poderia ser qlq nome. Neste caso vamos passar um parametro genérico (que pode ser, nil, N, Nobject, string, float, qlq coisa) que é representado pelo <T>. e no completion precisa trabalhar com retorno VOID.
//VOID é um retorno VAZIO.
//o protocol GenericService só vai ser criado uma única vez para o aplicativo inteiro. dpois ir para o HistoryService //23-
protocol GenericService: AnyObject {
        typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
    }
    


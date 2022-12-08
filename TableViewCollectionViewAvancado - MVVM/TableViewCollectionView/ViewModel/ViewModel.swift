//
//  ViewModel.swift
//  TableViewCollectionView
//
//  Created by Ricardo Massaki on 02/12/22.
//

import UIKit

class ViewModel {
    
    var vehicleList: [Vehicle] = [
        Vehicle(title: "Carro", list: ["car1","car2","car3","car4","car5","car6"]),
        Vehicle(title: "Motocicleta", list: ["moto1","moto2","moto3","moto4","moto5","moto6"]),
        Vehicle(title: "Avião", list: ["avião1","avião2","avião3","avião4","avião5","avião6"]),
        Vehicle(title: "Caça", list: ["caça1","caça2","caça3","caça4","caça5","caça6"]),
        Vehicle(title: "Trem", list: ["trem1","trem2","trem3","trem4","trem5","trem6"]),
    ]

    var numberOfRowsInSection: Int {
        return vehicleList.count
    }
    
    func loadCurrentVehicle(indexPath: IndexPath) -> Vehicle {
        return vehicleList[indexPath.row]
    }
    
    var heightForRowAt: CGFloat {
        return 364
    }
    
    
    
    
    
    
    
    
}

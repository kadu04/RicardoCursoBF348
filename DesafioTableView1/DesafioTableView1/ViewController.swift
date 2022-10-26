//
//  ViewController.swift
//  DesafioTableView1
//
//  Created by Ricardo Massaki on 26/10/22.
//

import UIKit

class ViewController: UIViewController {
    //01
    @IBOutlet weak var tableView: UITableView!
    
    //11
    var data:[Car] = [
        Car(car: "HONDA", image: UIImage(named: "honda") ?? UIImage()),
        Car(car: "TOYOTA", image: UIImage(named: "toyota") ?? UIImage()),
        Car(car: "NISSAN", image: UIImage(named: "nissan") ?? UIImage()),
        Car(car: "DAYHATSU", image: UIImage(named: "dayhatsu") ?? UIImage()),
        Car(car: "MAZDA", image: UIImage(named: "mazda") ?? UIImage())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //03
        configTableView()
    }
    //02
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        //13
        tableView.register(NameTableViewCell.nib(), forCellReuseIdentifier: NameTableViewCell.identifier)
    }
    
}
    
    //05
extension ViewController: UITableViewDataSource {
    // numberOfRowsInSection - Indicar a quantidade de linhas por sessão
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // cellForRowAt - Popular a celula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //12
        let cell = tableView.dequeueReusableCell(withIdentifier: NameTableViewCell.identifier, for: indexPath) as? NameTableViewCell
        cell?.setupCell(data: data[indexPath.row])
        return cell ?? UITableViewCell()
    }
    //15
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    //17 - canEditRowAt - para editar a tela
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 18 - para remover um item (celula por exemplo)
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
        
       // data.remove(at: indexPath.row)
        //Tomar muito cuidado ao usar "reloadData
        tableView.reloadData()
    }
}
    
    //04
    extension ViewController: UITableViewDelegate {
        //14
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(data[indexPath.row].car)
        }
        
    }
    
    




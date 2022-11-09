//
//  CarTableViewCell.swift
//  TableViewCollectionView
//
//  Created by Ricardo Massaki on 08/11/22.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    //7- fazer a ligacão da label e collectionview
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //5- criou o tableviewcell, já cria o "identifier" e o "nib"
    static let identifier: String = "CarTableViewCell"
    //5-
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    var data: [String] = []
    
    
    //6- colocar o nome no identifier na Xib
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        //10-
        configCollectionView()
    }
    
    //8-
    func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .zero
        collectionView.collectionViewLayout = layout
        //16- qdo criamos uma célula, temos que registra-la
        collectionView.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        //11-
        
    }
    
    //17-18- criar o setup
    func setupCell(data: Vehicle) {
        self.data = data.list
        self.titleLabel.text = data.title
    }
    
}

//9-

extension CarTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 300)
    }
    
}

extension CarTableViewCell:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 0
        //20-
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //21-
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        cell?.setupCell(nameImage: data[indexPath.row])
        //22-
        return cell ?? UICollectionViewCell()
    }
    
}



        
    

    
    
    

    
    


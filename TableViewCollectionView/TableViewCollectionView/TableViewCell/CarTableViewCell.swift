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
    
    //6- colocar o nome no identifier na Xib
    
    
    //18-
    var listImage:[String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //10-
        configCollectionView()
    }
    
    //8-
    private func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        //16- qdo criamos uma célula, temos que registra-la
        collectionView.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        //11-
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }
    }
    
    //17- criar o setup
    public func setupCell(title: String,listImage:[String]) {
        self.titleLabel.text = title
        //19-
        self.listImage = listImage
        
    }
    
}

//9-
extension CarTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 0
        //20-
        return self.listImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //21-
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        cell?.setupCell(nameImage: self.listImage[indexPath.row])
        //return UICollectionViewCell()
        //22-
        return cell ?? UICollectionViewCell()
    }
    
    //23-
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.contentView.frame.width, height: collectionView.frame.height)
    }
    
}
        
    

    
    
    

    
    


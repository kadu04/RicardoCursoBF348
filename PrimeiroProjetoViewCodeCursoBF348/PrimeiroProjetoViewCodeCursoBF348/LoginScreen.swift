//
//  LoginScreen.swift
//  PrimeiroProjetoViewCodeCursoBF348
//
//  Created by Ricardo Massaki on 30/12/22.
//
//05- Criar o new file LoginScreen (cocoa e class UIView)
import UIKit

class LoginScreen: UIView {
    
    //07-
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        return label
    }()
    
    //06- criar o override init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
    
        ])
    }
    
}

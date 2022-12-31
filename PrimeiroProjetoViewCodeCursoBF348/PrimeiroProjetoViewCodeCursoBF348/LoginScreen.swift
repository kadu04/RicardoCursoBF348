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
    
    //14- criar textField
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Email: user@outlook.com"
        return tf
    }()
    
    //17-
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Digite sua senha"
        tf.isSecureTextEntry = true
        return tf
    }()
    
    //06- criar o override init
    override init(frame: CGRect) {
        super.init(frame: frame)
        //13- trazer o backgroundColor lá da LoginVC
        backgroundColor = .blue
        //08(1)-
        addViews()
        //09(1)-
        configConstraints()
        
    }
    //08-
    private func addViews() {
        addSubview(loginLabel)
        //15-
        addSubview(emailTextField)
        //17(1)
        addSubview(passwordTextField)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //09- dpois ir p/LoginVC
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            //16-
            emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            //17-
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
    
        ])
    }
    
}

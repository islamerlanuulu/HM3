//
//  RegisterViewController.swift
//  homeWork3.5
//
//  Created by Islam Erlan Uulu on 7/7/23.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    private let loginImg:  UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "vhod")
        return view
    }()
    
    private let  nameTF: UITextField = {
        let view = UITextField()
        view.placeholder = " Ведите свое имя"
        view.borderStyle = .roundedRect
        view.tintColor = #colorLiteral(red: 0.7202358842, green: 0.9184760451, blue: 0.9367150664, alpha: 1)
        view.textColor = .black
        view.font = .systemFont(ofSize: 20)
        return view
    }()
    
    private let  emailTF: UITextField = {
        let view = UITextField()
        view.placeholder = "Электронная почта"
        view.borderStyle = .roundedRect
        view.tintColor = #colorLiteral(red: 0.7202358842, green: 0.9184760451, blue: 0.9367150664, alpha: 1)
        view.autocapitalizationType = .none
        view.textColor = .black
        view.font = .systemFont(ofSize: 20)
        return view
    }()
    
    private let passwordTF: UITextField = {
        let view = UITextField()
        view.placeholder = "  Придумайте Пароль "
        view.borderStyle = .roundedRect
        view.tintColor = #colorLiteral(red: 0.7202358842, green: 0.9184760451, blue: 0.9367150664, alpha: 1)
        view.textColor = .black
        view.font = .systemFont(ofSize: 20)
        
        return view
    }()
    
    private let nextBtn: UIButton = {
        let view = UIButton()
        view.setTitle("  Продолжить", for: .normal)
        view.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        view.layer.borderColor = UIColor.black.cgColor
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        view.layer.cornerRadius = 20
        view.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        settingsView()
        addConstraints()
//
//        passwordTF.delegate = self

        
    }
    private func settingsView(){
        view.backgroundColor = #colorLiteral(red: 0.9105255008, green: 0.9704654813, blue: 0.9459301829, alpha: 1)
        view.addSubview(loginImg)
        view.addSubview(nameTF)
        view.addSubview(emailTF)
        view.addSubview(passwordTF)
        view.addSubview(nextBtn)
    }
    private func  addConstraints(){
        loginImg.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-165)
            make.leading.equalTo(20)
        }
        nameTF.snp.makeConstraints { make in
            make.top.equalTo(loginImg.snp.bottom).offset(-200)
            make.height.equalTo(45)
            make.leading.equalTo(45)
            make.trailing.equalTo(-45)
        }
        emailTF.snp.makeConstraints { make in
            make.top.equalTo(nameTF.snp.bottom).offset(20)
            make.height.equalTo(45)
            make.leading.equalTo(45)
            make.trailing.equalTo(-45)
        }
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(emailTF.snp.bottom).offset(20)
            make.height.equalTo(45)
            make.leading.equalTo(45)
            make.trailing.equalTo(-45)
        }
        
        nextBtn.snp.makeConstraints { make in
            make.top.equalTo(passwordTF.snp.bottom).offset(50)
            make.height.equalTo(45)
            make.leading.equalTo(45)
            make.trailing.equalTo(-45)
        }
        
    }
    
    @objc func nextButtonTapped() {
        guard let email = emailTF.text, !email.isEmpty,
              let name = nameTF.text, !name.isEmpty,
              let password = passwordTF.text, !password.isEmpty else {
                  emailTF.text = ""
                  passwordTF.text = ""
                  nameTF.text = ""
                  passwordTF.attributedPlaceholder = NSAttributedString(string: "Придумайте Ведите пароль!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
                  passwordTF.layer.borderWidth = 1.0
                  passwordTF.layer.borderColor = UIColor.red.cgColor
                  emailTF.attributedPlaceholder = NSAttributedString(string: "Введите вашу почту!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
                  emailTF.layer.borderWidth = 1.0
                  emailTF.layer.borderColor = UIColor.red.cgColor
                  nameTF.attributedPlaceholder = NSAttributedString(string: "Вы не написали свое имя!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
                  nameTF.layer.borderWidth = 1.0
                  nameTF.layer.borderColor = UIColor.red.cgColor
                  return
              }
        emailTF.layer.borderWidth   = 0
        passwordTF.layer.borderWidth = 0
        nameTF.layer.borderWidth = 0
        print("Выполняется вход...")
        FirebaseAuth.Auth.auth().createUser(withEmail: email , password: password) { [weak self ] result, error in
            guard let strongSelf = self else {
                return
            }
            guard error == nil else{
                print("error")
                return
            }
            
            print("login")
            let alert = UIAlertController(title: "Ваш аккаунт успешно создан",
                                          message: "",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction( title: "OK",
                                           style: .default,
                                           handler: { _ in
                let vc = EntranceViewController()
                vc.navigationItem.hidesBackButton = true
                self?.navigationController?.pushViewController(vc, animated: true)

                
            }))
            self?.present(alert, animated: true)

        }
        
//        let authViewController = AuthViewController()
//        authViewController.navigationItem.hidesBackButton = true
//        self.navigationController?.pushViewController(authViewController, animated: true)

        
        
        
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//           let currentText = passwordTF.text ?? ""
//
//
//           let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)

//           
//        if updatedText.count >= 6 {
//               return true
//           } else {
//               
//               let alert = UIAlertController(title: "Ошибка",
//                                             message: "Пароль должен состоять минимум из 6 ",
//                                             preferredStyle: .alert)
//               alert.addAction(UIAlertAction( title: "Понял",
//                                              style: .default,
//                                              handler: { _ in
//               }))
//               present(alert, animated: true)
//
//               return false
//           }
    
        
    
}

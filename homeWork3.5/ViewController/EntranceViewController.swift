//
//  EntranceViewController.swift
//  homeWork3.5
//
//  Created by Islam Erlan Uulu on 4/7/23.
//

import UIKit
import SnapKit
import FirebaseAuth

class EntranceViewController: UIViewController {
    
    private let loginImg:  UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "vhod")
        return view
    }()
    
    private let numberTF: UITextField = {
        let view = UITextField()
        view.placeholder = "  @example.com"
        view.borderStyle = .roundedRect
        view.tintColor = #colorLiteral(red: 0.7202358842, green: 0.9184760451, blue: 0.9367150664, alpha: 1)
        view.textColor = .black
        view.autocapitalizationType = .none
        view.font = .systemFont(ofSize: 20)
        return view
    }()
    private let passwordTF: UITextField = {
        let view = UITextField()
        view.placeholder = "  Пароль"
        view.borderStyle = .roundedRect
        view.tintColor = #colorLiteral(red: 0.7202358842, green: 0.9184760451, blue: 0.9367150664, alpha: 1)
        view.textColor = .black
        view.autocapitalizationType = .none
        view.isSecureTextEntry = true
        view.font = .systemFont(ofSize: 20)
        
        return view
    }()
    
    private let enterBtn: UIButton = {
        let view = UIButton()
        view.setTitle("  Продолжить", for: .normal)
        view.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        view.layer.borderColor = UIColor.black.cgColor
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        view.layer.cornerRadius = 20
        view.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return view
    }()
 
    private let registerBtn: UIButton = {
        let view = UIButton()
        view.setTitle("Зарегистрироваться", for: .normal)
        view.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        view.layer.borderColor = UIColor.black.cgColor
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        view.addTarget(self, action: #selector(signUPTupped), for: .touchUpInside)
        view.layer.cornerRadius = 20
        return view
    }()
    //    private let googleBtn: UIButton = {
    //        let view = UIButton()
    //        view.setTitle("Войти через Google", for: .normal)
    //        view.setTitleColor(.black, for: .normal)
    //        view.layer.borderWidth = 1.0
    //        view.backgroundColor = .white
    //        view.layer.cornerRadius = 20
    //        view.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    //
    //        return view
    //    }()
    private let imagegoogle:  UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Google")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsView()
        addConstraints()
        
//        if FirebaseAuth.Auth.auth().currentUser != nil {
//            numberTF.isHidden = true
//            passwordTF.isHidden = true
//            enterBtn.isHidden = true
//
//            view.addSubview(signoutBtn)
//            view.addSubview(loginBtn)
//
//            signoutBtn.snp.makeConstraints { make in
//                make.top.equalTo(loginImg.snp.bottom).offset(-200)
//                make.height.equalTo(45)
//                make.leading.equalTo(45)
//                make.trailing.equalTo(-45)
//            }
//
//            loginBtn.snp.makeConstraints { make in
//                make.top.equalTo(signoutBtn.snp.bottom).offset(30)
//                make.height.equalTo(45)
//                make.leading.equalTo(45)
//                make.trailing.equalTo(-45)
//            }
//
////            signoutBtn.addTarget(self, action: #selector(signoutBtnTupped), for: .touchUpInside)
////            loginBtn.addTarget(self, action: #selector(login2BtnTupped), for: .touchUpInside)
//        }
//
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        if FirebaseAuth.Auth.auth().currentUser == nil {
//            numberTF.becomeFirstResponder()
//        }
    }
    
    
    
    private func settingsView(){
        view.backgroundColor = #colorLiteral(red: 0.9105255008, green: 0.9704654813, blue: 0.9459301829, alpha: 1)
        view.addSubview(loginImg)
        view.addSubview(numberTF)
        view.addSubview(passwordTF)
        view.addSubview(enterBtn)
        view.addSubview(registerBtn)
    }
    private func  addConstraints(){
        loginImg.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-165)
            make.leading.equalTo(20)
        }
        numberTF.snp.makeConstraints { make in
            make.top.equalTo(loginImg.snp.bottom).offset(-200)
            make.height.equalTo(45)
            make.leading.equalTo(45)
            make.trailing.equalTo(-45)
        }
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(numberTF.snp.bottom).offset(20)
            make.height.equalTo(45)
            make.leading.equalTo(45)
            make.trailing.equalTo(-45)
        }
        enterBtn.snp.makeConstraints { make in
            make.top.equalTo(passwordTF.snp.bottom).offset(50)
            make.height.equalTo(45)
            make.leading.equalTo(45)
            make.trailing.equalTo(-45)
        }
        
        registerBtn.snp.makeConstraints { make in
            make.top.equalTo(enterBtn.snp.bottom).offset(150)
            make.height.equalTo(45)
            make.leading.equalTo(45)
            make.trailing.equalTo(-45)
        }
        
    }
    
    @objc func signUPTupped() {
        navigationController?.pushViewController(RegisterViewController(), animated: false)
        
    }
    
    @objc func loginButtonTapped() {
        guard let email = numberTF.text, !email.isEmpty,
              let password = passwordTF.text, !password.isEmpty else {
                  numberTF.text = ""
                  passwordTF.text = ""
                  passwordTF.attributedPlaceholder = NSAttributedString(string: " Ведите пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
                  passwordTF.layer.borderWidth = 1.0
                  passwordTF.layer.borderColor = UIColor.red.cgColor
                  numberTF.attributedPlaceholder = NSAttributedString(string: "Введите имя пользователя", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
                  numberTF.layer.borderWidth = 1.0
                  numberTF.layer.borderColor = UIColor.red.cgColor
                  return
              }
        numberTF.layer.borderWidth   = 0
        passwordTF.layer.borderWidth = 0
        print("Выполняется вход...")
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password , completion: { [weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            guard error == nil else{
                strongSelf.showRegister()
                return
            }
          
            print("login")
                    let authViewController = StartViewController()
                    authViewController.navigationItem.hidesBackButton = true
                    self?.navigationController?.pushViewController(authViewController, animated: true)

            strongSelf.numberTF.isHidden = true
            strongSelf.passwordTF.isHidden = true
            strongSelf.enterBtn.isHidden = true
        })
    }
    
    func showRegister() {
        let alert = UIAlertController(title: "Такой  аккаунт не Существует",
                                      message: "Хотели вы бы создать учетную запись?",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction( title: "Создать",
                                       style: .default,
                                       handler: { _ in
            
           let vc = RegisterViewController()
            self.navigationController?.pushViewController(RegisterViewController(), animated: true)
            
        }))
        alert.addAction(UIAlertAction( title: "Отмена",
                                       style: .default,
                                       handler: { _ in
        }))
        present(alert, animated: true)
    }
    
    
    
//
//    func showCreateAccount(email: String, password: String) {
//        let alert = UIAlertController(title: "Создать аккаунт",
//                                      message: "Хотели вы бы создать учетную запись?",
//                                      preferredStyle: .alert)
//        alert.addAction(UIAlertAction( title: "Продолжить",
//                                       style: .default,
//                                       handler: { _ in
//            FirebaseAuth.Auth.auth().createUser(withEmail: email , password: password) { [weak self ] result, error in
//                guard let strongSelf = self else {
//                    return
//                }
//                guard error == nil else{
//                    print("error")
//                    return
//                }
//
//                print("login")
//                strongSelf.navigationController?.pushViewController(StartViewController(), animated: true)
//                strongSelf.numberTF.isHidden = true
//                strongSelf.passwordTF.isHidden = true
//                strongSelf.enterBtn.isHidden = true
//
//            }
//
//        }))
//        alert.addAction(UIAlertAction( title: "Отмена",
//                                       style: .default,
//                                       handler: { _ in
//        }))
//        present(alert, animated: true)
    }
//    @objc func signoutBtnTupped() {
//        do {
//            try FirebaseAuth.Auth.auth().signOut()
//
//            numberTF.isHidden = false
//            passwordTF.isHidden = false
//            enterBtn.isHidden = false
//
//            signoutBtn.removeFromSuperview()
//            loginBtn.removeFromSuperview()
//
//
//        }
//        catch{
//            print("произошла ошибка")
//        }
//    }
//    @objc func login2BtnTupped(){
//        navigationController?.pushViewController(StartViewController(), animated: false)
//    }


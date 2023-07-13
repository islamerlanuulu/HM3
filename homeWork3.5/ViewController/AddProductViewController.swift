//
//  AddProductViewController.swift
//  homeWork3.5
//
//  Created by Islam Erlan Uulu on 11/7/23.
//

import UIKit

class AddProductViewController: UIViewController {
    

    private let  nameTF: UITextField = {
        let view = UITextField()
        view.placeholder = "Имя Персонажа"
        view.borderStyle = .roundedRect
        view.tintColor = #colorLiteral(red: 0.7202358842, green: 0.9184760451, blue: 0.9367150664, alpha: 1)
        view.textColor = .black
        view.font = .systemFont(ofSize: 20)
        return view
    }()
    
    private let  imageTF: UITextField = {
        let view = UITextField()
        view.placeholder = "Ссылка Картинки"
        view.borderStyle = .roundedRect
        view.tintColor = #colorLiteral(red: 0.7202358842, green: 0.9184760451, blue: 0.9367150664, alpha: 1)
        view.autocapitalizationType = .none
        view.textColor = .black
        view.font = .systemFont(ofSize: 20)
        return view
    }()
    
 
    
    private let nextBtn: UIButton = {
        let view = UIButton()
        view.setTitle("Сохранить", for: .normal)
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

        
    }
    private func settingsView(){
        view.backgroundColor = #colorLiteral(red: 0.9105255008, green: 0.9704654813, blue: 0.9459301829, alpha: 1)
        view.addSubview(nameTF)
        view.addSubview(imageTF)
        view.addSubview(nextBtn)
      
    }
    private func  addConstraints(){
        nameTF.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(45)
            make.leading.equalTo(45)
            make.trailing.equalTo(-45)
        }
        imageTF.snp.makeConstraints { make in
            make.top.equalTo(nameTF.snp.bottom).offset(20)
            make.height.equalTo(45)
            make.leading.equalTo(45)
            make.trailing.equalTo(-45)
        }
        nextBtn.snp.makeConstraints { make in
            make.top.equalTo(imageTF.snp.bottom).offset(50)
            make.height.equalTo(45)
            make.leading.equalTo(45)
            make.trailing.equalTo(-45)
        }
        
    }
    
    @objc func nextButtonTapped() {
        guard let name = nameTF.text, !name.isEmpty,
              let image = imageTF.text, !image.isEmpty else {
                  nameTF.text = ""
                  imageTF.text = ""
                  nameTF.attributedPlaceholder = NSAttributedString(string: "Введите вашу почту!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
                  nameTF.layer.borderWidth = 1.0
                  nameTF.layer.borderColor = UIColor.red.cgColor
                  imageTF.attributedPlaceholder = NSAttributedString(string: "Вы не написали свое имя!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
                  imageTF.layer.borderWidth = 1.0
                  imageTF.layer.borderColor = UIColor.red.cgColor
                  return
              }
        imageTF.layer.borderWidth   = 0
        nameTF.layer.borderWidth = 0
        print("Персонаж добавлен...")
//        FirebaseAuth.Auth.auth().createUser(withEmail: email , password: password) { [weak self ] result, error in
//            guard let strongSelf = self else {
//                return
//            }
//            guard error == nil else{
//                print("error")
//                return
//            }
//
//            print("login")
//            let alert = UIAlertController(title: "Ваш аккаунт успешно создан",
//                                          message: "",
//                                          preferredStyle: .alert)
//            alert.addAction(UIAlertAction( title: "OK",
//                                           style: .default,
//                                           handler: { _ in
//                let vc = EntranceViewController()
//                vc.navigationItem.hidesBackButton = true
//                self?.navigationController?.pushViewController(vc, animated: true)
//
//
//            }))
//            self?.present(alert, animated: true)

        }
        
//        let authViewController = AuthViewController()
//        authViewController.navigationItem.hidesBackButton = true
//        self.navigationController?.pushViewController(authViewController, animated: true)

        
        
        
    }
    

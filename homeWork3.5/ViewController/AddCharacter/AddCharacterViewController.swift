//
//  AddCharacterViewController.swift
//  homeWork3.5
//
//  Created by Islam Erlan Uulu on 13/7/23.
//

import UIKit

class AddCharacterViewController: CustomViewController<AddCharacterView> {
    
    let rickAndMortyViewModel = StartViewController()
    
    override func loadView() {
        super.loadView()
        view = homeWork3_5.AddCharacterView()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.delegate = self
    }
    
    private func showAlert() {
        let alert = UIAlertController(
            title: customView.nameTextfield.text,
            message: "Персонаж добавлен",
            preferredStyle: .alert
        )
        let action = UIAlertAction(
            title: "Ок",
            style: .default
        ) { action in
            self.customView.clearTFiels()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}

extension AddCharacterViewController: AddCharacterViewDelegate {

    func AddCharacterView(
        checkTF result: Bool,
        _ character: Character
    ) {
        if result {
            showAlert()
            rickAndMortyViewModel.addNewCharachter(character: character)
        }
    }
}

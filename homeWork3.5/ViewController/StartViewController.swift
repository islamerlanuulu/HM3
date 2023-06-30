//
//  ViewController.swift
//  homeWork3.5
//
//  Created by Islam Erlan Uulu on 27/6/23.
//

import UIKit

class StartViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: view.frame.width, height: 90)
        layout.minimumLineSpacing = 20
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        view.dataSource = self
        view.delegate = self
        view.register(
            CharacterCollectionViewCell.self,
            forCellWithReuseIdentifier: CharacterCollectionViewCell.reuseID
        )
        return view
    }()
    private let viewModel = CharactersViewModel()
    private var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchCharacters()
        managerKeyChain()
        
        UserDefaultService.shared.save("White", forKey: .color)
        
        print(UserDefaultService.shared.string(forKey: .color))
        
         func  managerKeyChain() {
            
            let service = "com.example.app"
            let account = "myAccount"
            let value = "myPassword"
            
            
            let saveSuccess = KeychainManager.shared.saveValue(service: service, account: account, value: value)
            print("Save to Keychain: \(saveSuccess)")
            
            
            if let loadedValue = KeychainManager.shared.loadValue(service: service, account: account) {
                print("Loaded from Keychain: \(loadedValue)")
            } else {
                print("Value not found in Keychain")
            }
            
            let removeSuccess = KeychainManager.shared.removeValue(service: service, account: account)
            print("Remove from Keychain: \(removeSuccess)")
            
            
        }
    }
    private func setup() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func fetchCharacters() {
        Task {
            do {
                characters = try await viewModel.fetchCharacters()
                print(characters)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {
                print(error)
            }
        }
    }
}

extension StartViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return characters.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharacterCollectionViewCell.reuseID,
            for: indexPath
        ) as! CharacterCollectionViewCell
        let model = characters[indexPath.item]
        cell.display(item: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc =  SecondViewController()
        vc.ff5 = characters[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}


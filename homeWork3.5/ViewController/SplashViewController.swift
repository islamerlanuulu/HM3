//
//  SplashViewController.swift
//  homeWork3.5
//
//  Created by Islam Erlan Uulu on 13/7/23.
//

import UIKit

class SplashViewController: UIViewController {
    
    private let keyChain = KeychainStorage.shared
    private let encoder = JSONDecoder()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        if
            let data = keyChain.get(
                service: Constants.Authorization.service,
                account: Constants.Authorization.account
            ),
            let date = try? decoder.decode(Date.self, from: data),
                date > Date() {
            print(date)
            print(Date())
            let vc = MainTabBarViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
        } else {
            let vc = EntranceViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: false)
        }
    }
}

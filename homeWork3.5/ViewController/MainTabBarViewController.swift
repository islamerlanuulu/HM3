//
//  MainTabBarViewController.swift
//  homeWork3.5
//
//  Created by Islam Erlan Uulu on 13/7/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstTabVC = UINavigationController(rootViewController: StartViewController())
        let secondTabVC = UINavigationController(rootViewController: AddCharacterViewController())
        
        firstTabVC.tabBarItem.image = UIImage(systemName: "person")
        secondTabVC.tabBarItem.image = UIImage(systemName: "person.crop.rectangle.badge.plus")
        
        firstTabVC.title = "character"
        secondTabVC.title = "Add Product"
        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .white
        
        setViewControllers([firstTabVC,secondTabVC], animated: true)
    }
}

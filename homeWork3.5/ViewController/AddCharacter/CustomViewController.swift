//
//  CustomViewController.swift
//  homeWork3.5
//
//  Created by Islam Erlan Uulu on 13/7/23.
//

import UIKit

class CustomViewController<V: CustomView>: UIViewController {
    
    override func loadView() {
        view = V()
    }
    
    var customView: V {
        view as! V
    }
}

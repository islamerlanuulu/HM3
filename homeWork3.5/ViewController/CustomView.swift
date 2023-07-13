//
//  CustomView.swift
//  homeWork3.5
//
//  Created by Islam Erlan Uulu on 13/7/23.
//

import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        layoutViews()
    }
    
    func setupViews() {
        backgroundColor = UIColor.systemBackground
    }
    
    func layoutViews() {
        
    }
}

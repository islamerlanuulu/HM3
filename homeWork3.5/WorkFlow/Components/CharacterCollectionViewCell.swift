//
//  CharacterCollectionViewCell.swift
//  homeWork3.5
//
//  Created by Islam Erlan Uulu on 27/6/23.
//

import UIKit
import SnapKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = String(describing: CharacterCollectionViewCell.self)
    
    private lazy var nameLabel = UILabel()
    private lazy var genederLabel = UILabel()
    private lazy var characterImageView: UIImageView = {
        let view = UIImageView()
        view.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }
        view.image = UIImage(systemName: "person.fill")
        view.backgroundColor = .black
//        view.layer.cornerRadius = 15
        
        return view
    }()
    
    private lazy var hStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(characterImageView)
        view.addArrangedSubview(vStackView)
        view.distribution = .fillProportionally
        view.axis = .horizontal
        return view
    }()
    
    private lazy var vStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(nameLabel)
        view.addArrangedSubview(genederLabel)
        view.distribution = .fillEqually
        view.axis = .vertical
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(hStackView)
        hStackView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(item: Character) {
        nameLabel.text = item.name
        genederLabel.text = item.gender
        ImageDownloader.downloadImage(with: item.image) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.characterImageView.image = image
            }
        }
    }
}


//
//  FilterCollectionViewCell.swift
//  Corn$ell
//
//  Created by Jackwin Hui on 12/1/19.
//  Copyright © 2019 Jackwin Hui. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    var filterLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        filterLabel = UILabel()
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        filterLabel.contentMode = .scaleAspectFill
        filterLabel.layer.masksToBounds = true
        contentView.addSubview(filterLabel)
        
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            filterLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            filterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            filterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            filterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(for filter: String) {
        filterLabel.text = filter
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

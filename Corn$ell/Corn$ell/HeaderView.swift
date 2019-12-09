//
//  HeaderView.swift
//  Corn$ell
//
//  Created by Jackwin Hui on 12/1/19.
//  Copyright © 2019 Jackwin Hui. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    var label: UILabel!
    var types: [String] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "FILTERS"
        label.textAlignment = .center
        addSubview(label)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}

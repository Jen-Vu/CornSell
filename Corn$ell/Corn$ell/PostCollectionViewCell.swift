//
//  PostCollectionViewCell.swift
//  Corn$ell
//
//  Created by Jackwin Hui on 12/1/19.
//  Copyright © 2019 Jackwin Hui. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    var photoImageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        photoImageView = UIImageView()
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.layer.masksToBounds = true
        contentView.addSubview(photoImageView)
        
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(for post: Post) {
        photoImageView.image = UIImage(named: post.postImageName)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  ViewController.swift
//  Corn$ell
//
//  Created by Jackwin Hui on 12/1/19.
//  Copyright © 2019 Jackwin Hui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var headerCollectionView: UICollectionView!
    var postCollectionView: UICollectionView!
        
    var posts: [Post] = []
    var canadaGoose: Post!
    var macBook: Post!
    var nintendoSwitch: Post!
    var oneBedroom: Post!
    var iClicker: Post!
    var chem2090Textbook: Post!
    var tesla: Post!

    let postCellReuseIdentifier = "personCellReuseIdentifier"
    let headerReuseIdentifier = "headerReuseIdentifier"
    let padding: CGFloat = 15
    let headerHeight: CGFloat = 30

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Corn$ell Posts"
        view.backgroundColor = .white
        
        // Create Post objects
        canadaGoose = Post(title: "Canada Goose", price: 900.00, description: "Canada Goose Parka. Lightly worn. Price is non-negotiable", type: .clothing, userID: 1, imageName: "clothing")
        macBook = Post(title: "MacBook Pro 2014", price: 600.00, description: "15.4\" MacBook Pro - 500GB SSD - 16 GB RAM" , type: .electronics, userID: 2, imageName: "electronics")
        nintendoSwitch = Post(title: "Nintendo Switch", price: 250.00, description: "Brand new Nintendo Switch with carrying case and headset. Price is non-negotiable", type: .entertainment, userID: 3, imageName: "entertainment")
        oneBedroom = Post(title: "One Bedroom Apartment Subletting in Collegetown", price: 600.00, description: "Fully furnished apartment. 5 minute walk from Engineering Quad. Available January 1-May 31, 2020. Utilities included", type: .housing, userID: 4, imageName: "housing")
        iClicker = Post(title: "iClicker2 with Batteries", price: 25.00, description: "Almost new iClicker remote", type: .school, userID: 5, imageName: "school")
        chem2090Textbook = Post(title: "Gen Chem 2070 Textbook", price: 50.00, description: "Gen Chem 2070 Textbook. Lightly Used. Price negotiable.", type: .textbooks, userID: 6, imageName: "textbooks")
        tesla = Post(title: "2013 Tesla Model S", price: 40000.00, description: "2013 Tesla Model S. 29,000 miles. Automatic transmission. No accidents. Price negotiable.", type: .vehicles, userID: 7, imageName: "vehicles")
        posts = [canadaGoose, macBook, nintendoSwitch, oneBedroom, iClicker, chem2090Textbook, tesla]

        // TODO: Setup collectionView
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
            
        postCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        postCollectionView.translatesAutoresizingMaskIntoConstraints = false
        postCollectionView.backgroundColor = .white
        postCollectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: postCellReuseIdentifier)
        postCollectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        postCollectionView.dataSource = self
        postCollectionView.delegate = self
            
        view.addSubview(postCollectionView)
            
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([postCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            postCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            postCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            postCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: postCellReuseIdentifier, for: indexPath) as! PostCollectionViewCell
        cell.configure(for: posts[indexPath.row])
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! HeaderView
        return headerView
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // We want: | padding CELL padding CELL padding |
        let size = (collectionView.frame.width - padding)
        return CGSize(width: size, height: size/2)
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: headerHeight)
    }
}


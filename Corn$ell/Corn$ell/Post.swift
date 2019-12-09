//
//  Post.swift
//  Corn$ell
//
//  Created by Jackwin Hui on 12/1/19.
//  Copyright © 2019 Jackwin Hui. All rights reserved.
//

import Foundation

enum postCategory {
    case clothing
    case electronics
    case entertainment
    case housing
    case school
    case textbooks
    case vehicles
}

class Post {
    
    var title: String
    var price: Double
    var description: String
    var type: postCategory
    var userID: Double
    var postImageName: String


    init(title: String, price: Double, description: String, type: postCategory, userID: Double, imageName: String) {
        self.title = title
        self.price = price
        self.description = description
        self.type = type
        self.userID = userID
        postImageName = imageName
    }

    
    func getTypeString() -> String {
        switch type {
        case .clothing:
            return "Clothing"
        case .electronics:
            return "Electronics"
        case .entertainment:
            return "Entertainment"
        case .housing:
            return "Housing"
        case .school:
            return "School"
        case .textbooks:
            return "Textbooks"
        case .vehicles:
            return "Vehicles"
        }
    }

}


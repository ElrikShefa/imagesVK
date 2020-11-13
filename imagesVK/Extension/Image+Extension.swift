//
//  Image+Extension.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 07.11.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//


import UIKit

enum SystemIcon: String {
    
    case personFill = "person.fill"
    case arrowshapeTurnUpRight = "arrowshape.turn.up.right"
    case bubbleRight = "bubble.right"
    case heart = "heart"
    case eye = "eye"
}

extension UIImage {
    
    convenience init(systemIcon: SystemIcon) {
        self.init(systemName: systemIcon.rawValue)!
    }
}

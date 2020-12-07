//
//  ImageViewTableCellProtocol.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 12.11.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import Foundation

protocol ImageViewTableCellProtocol {
    
    var iconURLString: String { get }
    var name: String { get }
    var date: String { get }
    var text: String? { get }
    var likes: String? { get }
    var comments: String? { get }
    var shares: String? { get }
    var views: String? { get }
    var photoAttachement: ImageAttachementTableCellProtocol? { get }
}

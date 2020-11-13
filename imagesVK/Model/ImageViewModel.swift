//
//  ImageViewModel.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 12.11.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import Foundation

struct ImageViewModel {
    
    let cells: [CellModel]
    
    struct CellModel: ImageViewTableCellProtocol {
        var iconURLString: String
        var name: String
        var date: String
        var text: String?
        var likes: String?
        var comments: String?
        var shares: String?
        var views: String?
    }
}

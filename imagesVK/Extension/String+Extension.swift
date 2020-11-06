//
//  String+Extension.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 06.11.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import Foundation

extension String {
    
    var url: URL? {
        return URL(string: self)
    }

}

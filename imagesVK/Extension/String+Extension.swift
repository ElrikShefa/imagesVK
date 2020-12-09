//
//  String+Extension.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 06.11.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import UIKit

extension String {
    
    var url: URL? {
        return URL(string: self)
    }
    
}

extension String {
    
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let size = self.boundingRect(
            with: CGSize(width: width, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font : font],
            context: nil
        )
        
        return ceil(size.height)
    }
}

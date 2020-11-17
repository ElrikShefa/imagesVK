//
//  ProfileRepresentableProtocol.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 17.11.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import Foundation

protocol ProfileRepresentableProtocol {
    
    var id: Int { get }
    var name: String { get }
    var photo: String { get }
}

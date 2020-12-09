//
//  FeedCellSizes.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 07.12.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import UIKit

protocol FeedCellSizes {
    var postLabelFrame: CGRect { get }
    var attachementFrame: CGRect { get }
    var bottomView: CGRect { get }
    var totalHeght: CGFloat { get }
}

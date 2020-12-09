//
//  LayoutCalculator.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 07.12.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import UIKit

protocol LayoutCalculatorProtocol {
    func sizes(postText: String?, photoAttachment: ImageAttachementTableCellProtocol?) -> FeedCellSizes
}

struct Sizes: FeedCellSizes {
    var postLabelFrame: CGRect
    var attachementFrame: CGRect
    var bottomView: CGRect
    var totalHeght: CGFloat
}

final class LayoutCalculator {
    
    private let screenWidth: CGFloat
    
    init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidth = screenWidth
    }
    
}


extension LayoutCalculator: LayoutCalculatorProtocol {
    func sizes(postText: String?, photoAttachment: ImageAttachementTableCellProtocol?) -> FeedCellSizes {
        
        let cardViewWidth = screenWidth - Constants.cardInsets.left - Constants.cardInsets.right
        
        // MARK: - Work with postLabelFrame
        
        var postLabelFrame = CGRect(
            origin: CGPoint(x: Constants.postLabelInsets.left, y: Constants.postLabelInsets.top),
            size: CGSize.zero
        )
        
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constants.postLabelInsets.left - Constants.postLabelInsets.right
            let height = text.height(width: width, font: Constants.postLabelFont)
            
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
        // MARK: - Work with attachmentFrame
        
        let attachmentTop = postLabelFrame.size == CGSize.zero ? Constants.postLabelInsets.top : postLabelFrame.maxY + Constants.postLabelInsets.bottom
        
        var attachmentFrame = CGRect(
            origin: CGPoint(x: 0, y: attachmentTop),
            size: CGSize.zero
        )
        
        if let attachment = photoAttachment {
            let ratio =  CGFloat(Float(attachment.height) / Float(attachment.width))
            attachmentFrame.size = CGSize(width: cardViewWidth, height: cardViewWidth * ratio)

        }
        
        // MARK: - Work with attachmentFrame
        
        let bottomViewTop = max(postLabelFrame.maxY, attachmentFrame.maxY)
        
        let bottomViewFrame = CGRect(
            origin: CGPoint(x: 0, y: bottomViewTop),
            size: CGSize(width: cardViewWidth, height: Constants.bottomViewHeight)
        )
        
        let totalHeight = bottomViewFrame.maxY + Constants.cardInsets.bottom
        
        return Sizes(postLabelFrame: CGRect.zero, attachementFrame: attachmentFrame, bottomView: bottomViewFrame, totalHeght: totalHeight)
    }
}

//
//  SupportingViewCell.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 11.11.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import UIKit

final class SupportingViewCell: UIView {
    
    private lazy var supportingImageView = UIImageView()
    private lazy var supportingLabel = UILabel()
    
    convenience init(image: UIImage, text: String?) {
        self.init()
        self.supportingImageView.image = image
        self.supportingLabel.text = text

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
}

private extension SupportingViewCell {
    
    func setupLayout() {
        supportingLabel.textColor = .tintGray()
        supportingImageView.tintColor = .tintGray()
        
        for object in [supportingLabel, supportingImageView] {
            self.addSubview(object)
            object.translatesAutoresizingMaskIntoConstraints = false
        }
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(contentsOf: supportingImageView.setImageCellConstraints(to: self))
        constraints.append(contentsOf: supportingLabel.edgeLabelConstraints(supportingImageView, self))
        constraints.append(contentsOf: [
            supportingImageView.widthAnchor.constraint(equalToConstant: 24),
            supportingImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
        NSLayoutConstraint.activate(constraints)
    }
    
}

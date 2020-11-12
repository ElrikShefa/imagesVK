//
//  ImageViewTableCell.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 06.11.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import UIKit

final class ImageViewTableCell: UITableViewCell {
    
    private let headViewContainer = UIView()
    private let iconImageView = UIImageView()
    private let headStackView = UIStackView()
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()
    
    private let postLabel = UILabel()
    private let bottomViewContainer = UIView()
    
    private let likeView = SupportingViewCell(image: UIImage(systemIcon: .heart), text: "1234")
    private let commentView = SupportingViewCell(image: UIImage(systemIcon: .bubbleRight), text: "1234")
    private let shareView = SupportingViewCell(image: UIImage(systemIcon: .arrowshapeTurnUpRight), text: "1234")
    private let viewedView = SupportingViewCell(image:UIImage(systemIcon: .eye), text: "12K")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupInitials()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        setupInitials()
    }
    
}

private extension ImageViewTableCell {
    
    private func setupLayout() {
        setupInitials()
        self.selectionStyle = .none
        
        headStackView.axis = .vertical
        headStackView.spacing = 2
        
        nameLabel.font = .systemFont(ofSize: 14, weight: .medium)
        nameLabel.textColor = .darkGray
        
        dateLabel.font = .systemFont(ofSize: 12, weight: .regular)
        dateLabel.textColor = .tintGray()
        
        postLabel.font = .systemFont(ofSize: 15, weight: .regular)
        postLabel.numberOfLines = 0
        
        addViews([headViewContainer, postLabel, bottomViewContainer], to: self)
        addViews([iconImageView, headStackView], to: headViewContainer)
        addViews([likeView, commentView, shareView, viewedView], to: bottomViewContainer)
        
        for object in [nameLabel, dateLabel] {
            headStackView.addArrangedSubview(object)
        }
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(contentsOf: [
            headViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            headViewContainer.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            headViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 36),
            iconImageView.widthAnchor.constraint(equalToConstant: 36),
            iconImageView.leadingAnchor.constraint(equalTo: headViewContainer.leadingAnchor),
            iconImageView.topAnchor.constraint(equalTo: headViewContainer.topAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: headViewContainer.bottomAnchor),
            
            headStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            headStackView.trailingAnchor.constraint(equalTo: headViewContainer.trailingAnchor, constant: -8),
            headStackView.topAnchor.constraint(equalTo: headViewContainer.topAnchor, constant: 1),
            headStackView.bottomAnchor.constraint(equalTo: headViewContainer.bottomAnchor, constant: -1),
            
            postLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            postLabel.topAnchor.constraint(equalTo: headViewContainer.bottomAnchor, constant: 8),
            postLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            bottomViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            bottomViewContainer.topAnchor.constraint(equalTo: postLabel.bottomAnchor, constant: 8),
            bottomViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            bottomViewContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            likeView.leadingAnchor.constraint(equalTo: bottomViewContainer.leadingAnchor),
            likeView.topAnchor.constraint(equalTo: bottomViewContainer.topAnchor),
            likeView.bottomAnchor.constraint(equalTo: bottomViewContainer.bottomAnchor),
            likeView.widthAnchor.constraint(equalToConstant: 80),
            
            commentView.leadingAnchor.constraint(equalTo: likeView.trailingAnchor),
            commentView.topAnchor.constraint(equalTo: bottomViewContainer.topAnchor),
            commentView.bottomAnchor.constraint(equalTo: bottomViewContainer.bottomAnchor),
            commentView.widthAnchor.constraint(equalToConstant: 80),
            
            shareView.leadingAnchor.constraint(equalTo: commentView.trailingAnchor),
            shareView.topAnchor.constraint(equalTo: bottomViewContainer.topAnchor),
            shareView.bottomAnchor.constraint(equalTo: bottomViewContainer.bottomAnchor),
            shareView.widthAnchor.constraint(equalToConstant: 80),
            
            viewedView.trailingAnchor.constraint(equalTo: bottomViewContainer.trailingAnchor),
            viewedView.topAnchor.constraint(equalTo: bottomViewContainer.topAnchor),
            viewedView.bottomAnchor.constraint(equalTo: bottomViewContainer.bottomAnchor),
            viewedView.widthAnchor.constraint(equalToConstant: 80),
        ])
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupInitials() {
        iconImageView.image = UIImage(systemIcon: .personFill)
        nameLabel.text = "nameLabel"
        dateLabel.text = "dateLabel"
        postLabel.text = "От имени правительства Канады я поздравляю Джо Байдена и Камалу Харрис с их избранием следующим президентом и вице-президентом Соединенных Штатов Америки. Канада и Соединенные Штаты поддерживают необычные отношения, уникальные на мировой арене."
        //        likeLabel.text = "1234"
        //        commentLabel.text = "1234"
        //        shareLabel.text = "5678"
        //        viewedLabel.text = "56K"
    }
    
    private func addViews(_ views: [UIView], to parent: UIView) {
        for object in views {
            parent.addSubview(object)
            object.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
}

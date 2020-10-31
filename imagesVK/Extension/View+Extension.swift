//
//  View+Extension.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 30.10.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import UIKit

extension UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}

extension UIView {
    
    func edgeConstraints(
        to view: UIView,
        insets: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
    ) -> [NSLayoutConstraint] {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top)
        let leftConstraint = leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left)
        let bottomConstraint = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom)
        let rightConstraint = trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.right)
        
        return [topConstraint, leftConstraint, bottomConstraint, rightConstraint]
    }
    
    func edgeConstraints(
        to layoutGuide: UILayoutGuide,
        insets: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
    ) -> [NSLayoutConstraint] {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: insets.top)
        let leftConstraint = leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: insets.left)
        let bottomConstraint = bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -insets.bottom)
        let rightConstraint = trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -insets.right)
        
        return [topConstraint, leftConstraint, bottomConstraint, rightConstraint]
    }
    
    func centerConstraints(to view: UIView) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false

        return [centerXAnchor.constraint(equalTo: view.centerXAnchor),
                centerYAnchor.constraint(equalTo: view.centerYAnchor)]
    }
}

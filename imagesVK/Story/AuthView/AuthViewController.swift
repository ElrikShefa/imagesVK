//
//  AuthViewController.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 30.10.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import UIKit

final class AuthViewController: BaseVC {
    
    private lazy var button = UIButton(type: .system)
    
    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


private extension AuthViewController {
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        authService = SceneDelegate.shared().authService
        
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        button.setTitle(StringConstants.signIn, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .tintBlue()
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.blue.cgColor
        
        button.addTarget(self, action: #selector(signIn(_:)), for: .touchUpInside)
        
        view.addSubview(button)
        
        var constraints = button.centerConstraints(to: view)
        constraints.append(contentsOf: [
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func signIn(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
}

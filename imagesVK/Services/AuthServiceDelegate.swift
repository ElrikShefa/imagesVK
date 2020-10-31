//
//  AuthServiceDelegate.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 30.10.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import UIKit

protocol AuthServiceDelegate: class {

    func authServiceShouldShow(viewController: UIViewController)
    func authServiceSignIn()
    func authServiceSignInDidFail()
}

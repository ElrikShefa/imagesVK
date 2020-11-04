//
//  ImageViewController.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 30.10.2020.
//

import UIKit

final class ImageViewController: BaseVC {
    
private let urlService = URLService()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    urlService.getFeed()
    }


}




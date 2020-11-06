//
//  NetworkError.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 04.11.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//
import Foundation

enum NetworkError: Error {
    case badURL
    
    case badImageData(_ responseData: Data)
    case nilImageURL(_ imageLink: String)
    
    case responseError(_ responseError: Error)
    case nilResponseData
    
    case jsonDecodingError(_ jsonDecodingError: Error)
}

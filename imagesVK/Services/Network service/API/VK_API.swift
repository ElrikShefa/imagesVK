//
//  VK_API.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 03.11.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import Foundation

enum VK_API {}
//
//extension VK_API {
//
//    static let breedListAllURL = URL(string: "\(baseURLLink)/breeds/list/all")!
//    static let breedsListAllTaskDescription = "breeds list all"
//
//    static func breedImagesURLLink(breed: String) -> URL? {
//        guard breed.isNotEmptyWithoutWhiteSpacesAndNewlines else { return nil }
//
//        let breedImagesURLLink = "/breed/\(breed)/images"
//
//        return URL(string: baseURLLink + breedImagesURLLink)
//    }
//
//    static let breedImagesTaskDescription = "breeds image"
//
//    static func subBreedImagesURLLink(breed: String, subbreed: String) -> URL? {
//        guard
//            breed.isNotEmptyWithoutWhiteSpacesAndNewlines,
//            subbreed.isNotEmptyWithoutWhiteSpacesAndNewlines
//            else { return nil }
//
//        let subBreedImagesURLLink = "/breed/\(breed)/\(subbreed)/images"
//
//        return URL(string: baseURLLink + subBreedImagesURLLink)
//    }
//    static let subBreedImagesTaskDescription = "sub-breeds image"
//
//    static let downloadImageTaskDescription = "download image"
//}
extension VK_API {
    
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.124"
    
    static let methodGetPhotos = "/method/newsfeed.get"
}

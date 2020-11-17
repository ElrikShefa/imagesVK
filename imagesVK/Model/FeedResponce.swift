//
//  FeedResponce.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 05.11.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import Foundation

struct FeedInfo: Decodable {
    let response: FeedResponse
}

struct FeedResponse: Decodable {
    let items: [FeedItem]
    let profiles: [Profile]
    let groups: [Group]
}

struct FeedItem: Decodable  {
    let sourceId: Int
    let postId: Int
    let text: String?
    let date: Double
    let comments: CountableItem?
    let likes: CountableItem?
    let reposts: CountableItem?
    let views: CountableItem?
}

struct  CountableItem: Decodable {
    let count: Int
}

struct Profile: Decodable, ProfileRepresentableProtocol  {
    let id: Int
    let firstName: String
    let lastName: String
    let photo100: String
    
    var name: String { return firstName + " " + lastName}
    var photo: String { return photo100}
}

struct Group: Decodable, ProfileRepresentableProtocol  {
    let id: Int
    let name: String
    let photo100: String
    
    var photo: String { return photo100}
}

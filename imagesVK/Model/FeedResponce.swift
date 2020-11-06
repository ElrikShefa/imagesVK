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

//extension FeedItem: Decodable {
//
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        self.views = try container.decode(CountableItem.self, forKey: .views)
//        self.reposts = try container.decode(CountableItem.self, forKey: .reposts)
//        self.likes = try container.decode(CountableItem.self, forKey: .likes)
//        self.comments = try container.decode(CountableItem.self, forKey: .comments)
//        self.date = try container.decode(Double.self, forKey: .date)
//        self.text = try container.decode(String.self, forKey: .text)
//        self.postId = try container.decode(Int.self, forKey: .postId)
//        self.sourceId = try container.decode(Int.self, forKey: .sourceId)
//    }
//}
//
//private extension FeedItem {
//
//    enum CodingKeys: String, CodingKey {
//        case sourceId = "source_id"
//        case postId = "post_id"
//        case text
//        case date
//        case comments
//        case likes
//        case reposts
//        case views
//    }
//}

//
//  CodableJSON.swift
//  ZRepo
//
//  Created by Мак on 24/06/2019.
//  Copyright © 2019 Мак. All rights reserved.
//

import Foundation


struct  ResponseJSON: Decodable {
    
    let count: Int
    let items: [Repositorie]
    
    enum CodingKeys: String, CodingKey {
        case count = "total_count"
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decode(Int.self, forKey: .count)
        self.items = try container.decode([Repositorie].self, forKey: .items)
    }
}

struct  Repositorie: Decodable {
    
    let name: String
    let description: String
    let language: String?
    let html: String
    let star: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "full_name"
        case description
        case language
        case html = "html_url"
        case star = "stargazers_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.language = try? container.decode(String.self, forKey: .language)
        self.html = try container.decode(String.self, forKey: .html)
        self.star = try container.decode(Int.self, forKey: .star)
    }
}

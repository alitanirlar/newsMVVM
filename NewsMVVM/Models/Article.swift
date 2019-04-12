//
//  Article.swift
//  NewsMVVM
//
//  Created by Ali Tanırlar on 12.04.2019.
//  Copyright © 2019 Ali Tanırlar. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}


struct Article: Decodable {
    
    let title: String
    let description: String
    
}

//
//  PostDatat.swift
//  H4X0R News
//
//  Created by Abdelrahman Youssef on 04/01/2025.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable ,Identifiable{
    var id: String {return objectID}
    let objectID: String
    let title: String
    let url: String?
    let points: Int
}

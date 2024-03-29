//
//  PostData.swift
//  H4X0R News
//
//  Created by Sebastian Morado on 5/7/21.
//

import Foundation

struct Results: Decodable {
    let hits : [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID : String
    let title : String
    let points : Int
    let created_at: String
    let url : String?
}

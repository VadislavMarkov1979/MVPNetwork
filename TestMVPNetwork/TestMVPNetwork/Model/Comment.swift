//
//  Comment.swift
//  TestMVPNetwork
//
//  Created by Владимир on 14.05.2022.
//

import Foundation

struct Comment: Decodable {
    
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}

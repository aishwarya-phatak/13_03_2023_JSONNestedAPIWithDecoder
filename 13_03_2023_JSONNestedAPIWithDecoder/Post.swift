//
//  Post.swift
//  13_03_2023_JSONNestedAPIWithDecoder
//
//  Created by Vishal Jagtap on 15/05/23.
//

import Foundation
struct Post : Decodable{
    var userId : Int
    var id : Int
    var title : String
    var body : String
}

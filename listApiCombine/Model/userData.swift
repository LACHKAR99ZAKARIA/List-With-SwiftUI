//
//  userData.swift
//  listApiCombine
//
//  Created by zakaria lachkar on 18/04/2023.
//

import Foundation

struct Results :  Decodable {
    var page : Int
    var total_pages : Int
    let data : [User]
}

class User: Decodable, Identifiable {
    var id : Int
    var email : String
    var first_name : String
    var last_name : String
    var avatar : String
}

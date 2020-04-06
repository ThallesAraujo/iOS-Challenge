//
//  Trailer.swift
//  iOS-Challenge
//
//  Created by Thalles Araújo on 05/04/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import ObjectMapper

infix operator <-

class Trailer: Mappable {
    
    
    var id: Int = 0
    var key: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        key <- map["key"]
    }
    
    
    
}

//
//  File.swift
//  swift-thalles-base-project
//
//  Created by Thalles Araújo on 15/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import ObjectMapper

infix operator <-

class Movie: Mappable {
    
    
    var id: Int = 0
    var title: String = ""
    var overview: String = ""
    var posterPath: String = ""
    var voteAverage: Double?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        overview <- map["overview"]
        posterPath <- map["poster_path"]
        voteAverage <- map["vote_average"]
    }
    
    
    
}

//
//  MovieDetails.swift
//  iOS-Challenge
//
//  Created by Thalles Araújo on 04/04/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import ObjectMapper

infix operator <-

class MovieDetails: Mappable {
    
    
    var id: Int = 0
    var title: String = ""
    var overview: String = ""
    var posterPath: String = ""
    var popularity: Double?
    var releaseDate: String = ""
    var revenue: Double?
    var moviePage: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        overview <- map["overview"]
        posterPath <- map["poster_path"]
        releaseDate <- map["release_date"]
        revenue <- map["revenue"]
        moviePage <- map["homepage"]
        popularity <- map["popularity"]
    }
    
    
    
}

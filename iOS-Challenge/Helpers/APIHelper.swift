//
//  APIHelper.swift
//  swift-thalles-base-project
//
//  Created by Thalles Araújo on 26/01/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
enum APIHelper: String{
    
    case MOVIES_LIST =  "discover/movie?primary_release_date.gte=%@&<<API_KEY>>>"
    
    case TRAILERS_LIST = "movie/%@/videos?<<API_KEY>>>"
    
    case MOVIE_DETAILS = "movie/%@?<<API_KEY>>>"
   
    func getURL(_ parameters: [String] = []) -> URL {
        let host = ConfigScheme.API_URL
        
        var service = self.rawValue
        if parameters.count > 0 {
            service = String(format: self.rawValue, arguments: parameters)
        }
        
        let apiKey = ConfigScheme.valueForKey("API_KEY")
        
        let urlString = "\(host)\(service)".replacingOccurrences(of: "<<API_KEY>>>", with: "api_key=\(apiKey)")
       
        return URL(string: urlString)!
    }
    
    
    
}

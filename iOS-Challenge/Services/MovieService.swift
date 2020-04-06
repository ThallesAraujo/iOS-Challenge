//
//  Based on: ExampleService.swift
//  swift-thalles-base-project
//
//  Created by Thalles Araújo on 15/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class MovieService{
    
    class func getMoviesList(success: @escaping (_ movies: [Movie]) -> Void, failure: @escaping (_ error: String) -> Void){
        
        let currentDate = Date().advanced(by: TimeInterval.init(-30*24*60*60))
        
        Network.request(url: APIHelper.MOVIES_LIST.getURL([String.init(format:"%@", currentDate.toString())]), method: .get, completion: { (response) in
            guard let statusCode = response.response?.statusCode, statusCode == 200 else {
                failure("Failure retrieving data")
                return
            }
            
            guard let result = response.result.value as? [String:Any], let list = result["results"] as? [[String:Any]] else{
                failure("Failure reading JSON")
                return
            }
            
            let movies = Mapper<Movie>().mapArray(JSONArray: list)
            success(movies)
        }, noNetworkCompletion: failure)
    }
    
    class func getTrailersList(id: Int, success: @escaping (_ trailers: [Trailer]) -> Void, failure: @escaping (_ error: String) -> Void){
           
           Network.request(url: APIHelper.TRAILERS_LIST.getURL([String.init(format:"%@", "\(id)")]), method: .get, completion: { (response) in
               guard let statusCode = response.response?.statusCode, statusCode == 200 else {
                   failure("Failure retrieving data")
                   return
               }
               
               guard let result = response.result.value as? [String:Any], let list = result["results"] as? [[String:Any]] else{
                   failure("Failure reading JSON")
                   return
               }
               
               let trailers = Mapper<Trailer>().mapArray(JSONArray: list)
               success(trailers)
           }, noNetworkCompletion: failure)
       }
    
    class func getMovieDetails(id: Int, success: @escaping (_ details: MovieDetails?) -> Void, failure: @escaping (_ error: String) -> Void){
        
        Network.request(url: APIHelper.MOVIE_DETAILS.getURL([String.init(format:"%@", "\(id)")]), method: .get, completion: { (response) in
            guard let statusCode = response.response?.statusCode, statusCode == 200 else {
                failure("Failure retrieving data")
                return
            }
            
            guard let result = response.result.value as? [String:Any] else{
                failure("Failure reading JSON")
                return
            }
            
            let details = Mapper<MovieDetails>().map(JSON: result)
            success(details)
        }, noNetworkCompletion: failure)
    }
}

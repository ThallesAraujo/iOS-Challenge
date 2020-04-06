//
//  MovieDetailsRequestHandler.swift
//  iOS-Challenge
//
//  Created by Thalles Araújo on 05/04/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import UIKit
class MovieDetailsRequestHandler : RequestHandler{
    
    func loadMovieDetails(completion: @escaping ()-> Void){
        
        if let vc = self.coordinator?.navigationController.viewControllers[1] as? VCMovieDetails {
            
            let dispatcher = DispatchGroup()
            
            dispatcher.enter()
            
            MovieService.getMovieDetails(id: vc.movieID, success: { (details) in
                vc.movieDetails = details
                dispatcher.leave()
            }) { (error) in
                vc.showErrorAlert(error: error)
                dispatcher.leave()
            }
            
            dispatcher.enter()
            MovieService.getTrailersList(id: vc.movieID, success: { (trailers) in
                vc.trailers = trailers
                dispatcher.leave()
                
            }) { (error) in
                vc.showErrorAlert(error: error)
                dispatcher.leave()
            }
            
            dispatcher.notify(queue: .main, execute: completion)
            
        }
    }
    
}

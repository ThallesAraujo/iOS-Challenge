//
//  Based In: EnterpriseRequestHandler.swift
//  swift-thalles-base-project
//
//  Created by Thalles Araújo on 16/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import UIKit

//Remove a responsabilidade do ViewController de chamar os services
//Trata erros de requisição

class MovieListRequestHandler: RequestHandler{
    
    func loadMovieList(completion: @escaping ()-> Void){
        
        if let coordinator = self.coordinator, let vc = coordinator.navigationController.viewControllers[coordinator.navigationController.viewControllers.count - 1] as? VCMoviesList {
            
            let dispatcher = DispatchGroup()
            
            dispatcher.enter()
            
            MovieService.getMoviesList(success: { (movies) in
                vc.movies = movies
                completion()
                dispatcher.leave()
            }) { (error) in
                self.handleError(error: error, retryAction: coordinator.start)
                dispatcher.leave()
            }
            
            dispatcher.notify(queue: .main, execute: {})
            
        }
    }
    
}

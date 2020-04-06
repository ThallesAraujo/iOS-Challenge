//
//  MainCoordinator.swift
//  swift-thalles-base-project
//
//  Created by Thalles Araújo on 08/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

//Default implementation for Coordinator Pattern
//IMPORTANT: All view controllers identifiers should be setted properly!

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = VCMoviesList.instantiate()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: false)
    }
    
    func goToMovieDetails(movieID: Int){
        let vc = VCMovieDetails.instantiate()
        vc.movieID = movieID
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func goToMoviePage(movieDetails: MovieDetails?){
        if let movieDetails = movieDetails{
            UIApplication.shared.open(URL(string: movieDetails.moviePage)!, options: [:]) { _ in }
        }
    }

    func goToMovieTrailer(trailer: Trailer){
        UIApplication.shared.open(URL(string: "https://www.themoviedb.org/video/play?key=\(trailer.key)")!, options: [:]) { _ in }
    }
}

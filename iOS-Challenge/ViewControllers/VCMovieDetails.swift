//
//  VCMovieDetails.swift
//  iOS-Challenge
//
//  Created by Thalles Araújo on 05/04/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import UIKit

class VCMovieDetails: UIViewController, Storyboarded {
    
    var movieID: Int = 0
    var movieDetails: MovieDetails?
    var trailers: [Trailer] = []
    private var linkTrailer: String = ""
    private var requestHandler: RequestHandler?
    var coordinator: Coordinator?
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblMovieOverview: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblPopularity: UILabel!
    @IBOutlet weak var lblRevenue: UILabel!
    
    
    @IBAction func didTapMoviePage(_ sender: Any) {
        if let coordinator = self.coordinator as? MainCoordinator{
            coordinator.goToMoviePage(movieDetails: self.movieDetails)
        }
    }
    
    
    @IBAction func didTapMovieTrailer(_ sender: Any) {
        if let coordinator = self.coordinator as? MainCoordinator{
            coordinator.goToMovieTrailer(trailer: self.trailers[0])
        }
    }
    
    
    private func setup(){
        
        if let movieDetails = self.movieDetails{
            self.lblMovieTitle.text = movieDetails.title
            self.lblRevenue.text = "Revenue: \(movieDetails.revenue!.formatCurrency)"
            self.lblMovieOverview.text = movieDetails.overview
            self.lblReleaseDate.text = "Release date: \(movieDetails.releaseDate)"
            self.lblPopularity.text = "Popularity: \(movieDetails.popularity!)"
            self.moviePoster.kf.setImage(with: URL.init(string: ImageHelper.getImage((movieDetails.posterPath)) ), placeholder: UIImage.init(named: "undraw_videographer"), options: [.forceRefresh], progressBlock: nil, completionHandler: nil)
        }
        
    }
    
    private func getMovieDetails(){
        if let requestHandler = self.requestHandler as? MovieDetailsRequestHandler{
            requestHandler.loadMovieDetails {
                self.setup()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.init(hex: "#6C63FF")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.requestHandler = MovieDetailsRequestHandler()
        self.requestHandler?.coordinator = self.coordinator
        self.getMovieDetails()
    }
    
    
}

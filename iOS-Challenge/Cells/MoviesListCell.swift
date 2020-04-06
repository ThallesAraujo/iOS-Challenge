//
//  MoviesListCell.swift
//  iOS-Challenge
//
//  Created by Thalles Araújo on 04/04/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import UIKit
import Kingfisher

class MoviesListCell: UITableViewCell {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var lbMovieTitle: UILabel!
    @IBOutlet weak var lbMovieNote: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    
    
    private var coordinator: Coordinator?
    private var movie: Movie?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.layer.cornerRadius = 10
        self.mainView.layer.shadowRadius = 4.0
        self.mainView.layer.shadowOpacity = 5.0
        self.mainView.layer.shadowOffset = CGSize(width: 3,height: 2)
        self.mainView.layer.shadowColor = UIColor(hex: "#B0ACFF").cgColor
        if #available(iOS 13, *) {
            if UITraitCollection.current.userInterfaceStyle == .dark{
                self.mainView.backgroundColor = UIColor.darkGray
            }else{
                self.mainView.backgroundColor = UIColor.white
            }
        }
        // Initialization code
    }
    
    func setup(movie: Movie?, coordinator: Coordinator?){
        
        self.coordinator = coordinator
        self.movie = movie
        
        if let movie = movie{
            self.lbMovieNote.text = "Rating average: \(movie.voteAverage!)"
            self.lbMovieTitle.text = movie.title
            self.moviePoster.kf.setImage(with: URL.init(string: ImageHelper.getImage((movie.posterPath)) ), placeholder: UIImage.init(named: "undraw_videographer"), options: [.forceRefresh], progressBlock: nil, completionHandler: nil)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected{
            if let coordinator = self.coordinator as? MainCoordinator, let movie = self.movie{
                coordinator.goToMovieDetails(movieID: movie.id)
            }
        }
    }

}

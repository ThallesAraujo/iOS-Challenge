//
//  VCMoviesList.swift
//  iOS-Challenge
//
//  Created by Thalles Araújo on 04/04/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import UIKit

class VCMoviesList: UIViewController, Storyboarded, UITableViewDelegate, UITableViewDataSource {
    
    var coordinator: Coordinator?
    
    var storyboardName = "Main"
    var movies: [Movie] = []
    @IBOutlet weak var tbvMovies: UITableView!
    
    var requestHandler: MovieListRequestHandler?
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.requestHandler = MovieListRequestHandler()
        self.loadMovies()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? self.movies.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as? MoviesListCell else{
            return MoviesListCell()
        }
        
        cell.setup(movie: self.movies[indexPath.row], coordinator: self.coordinator)
        return cell
    }
    
    
    func loadMovies(){
        self.requestHandler = MovieListRequestHandler()
        if let requestHandler = self.requestHandler{
            requestHandler.coordinator = self.coordinator
            requestHandler.loadMovieList {
                self.tbvMovies.reloadData()
            }
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

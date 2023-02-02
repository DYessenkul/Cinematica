//
//  MovieOverviewViewController.swift
//  Cinematica
//
//  Created by Дархан Есенкул on 26.12.2022.
//

import UIKit
import Kingfisher


class MovieOverviewViewController: UIViewController {

    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieRelease: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieVoteCount: UILabel!
    @IBOutlet weak var saveButton: UIButton!

    
    
    var movie = MovieTitle(original_title: "", poster_path: "", release_date: "", vote_average: 0.0, overview: "", vote_count: 0)
    
    var movieToSave = MovieTitle(original_title: "", poster_path: "", release_date: "", vote_average: 0.0, overview: "", vote_count: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.poster_path!)")
        moviePoster.kf.setImage(with: imageUrl)
        moviePoster.layer.cornerRadius = 40
        moviePoster.clipsToBounds = true
        movieTitle.text = movie.original_title
        movieRating.text = "\(round(movie.vote_average!*10)/10)/10"
        let fullDate : String = movie.release_date ?? "2002-10"
        let dateArr : [String] = fullDate.components(separatedBy: "-")
        movieRelease.text = dateArr[0]
        movieOverview.text = movie.overview
        movieVoteCount.text = "\(movie.vote_count ?? 0) votes"
        
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//        guard segue.identifier == "saveMovie" else {return}
//        let favouritesVC = FavouritesViewController()
//        favouritesVC.favouriteMovies.append(movie)
//            favouritesVC.tableView.reloadData()
//
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveMovie" else {return}
        let posterPath = movie.poster_path ?? ""
        let movieTitle = movie.original_title ?? ""
        let movieRating = movie.vote_average ?? 0.0
        let movieDate = movie.release_date ?? ""
        let movieOverview = movie.overview ?? ""
        let movieVote = movie.vote_count ?? 0
        self.movieToSave = MovieTitle(original_title: movieTitle, poster_path: posterPath, release_date: movieDate, vote_average: movieRating, overview: movieOverview, vote_count: movieVote)
    }
    
    
    


}

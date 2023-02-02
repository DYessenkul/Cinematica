//
//  RandomViewController.swift
//  Cinematica
//
//  Created by Дархан Есенкул on 29.12.2022.
//

import UIKit
import Kingfisher

class RandomViewController: UIViewController, UpcomingNetworkManagerDelegate, TopRatedNetworkManagerDelegate, TrendingTvNetworkManagerDelegate {

    

    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    var networkManager = NetworkManager()
    
    var upcomingMovie = [MovieTitle]()
    var topRatedMovie = [MovieTitle]()
    var trendingTv = [MovieTitle]()
    var allMovies = [MovieTitle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviePoster.image = UIImage(named: "avatarPoster")
        networkManager.upcomingDelegate = self
        networkManager.topRatedDelegate = self
        networkManager.trendingTvDelegate = self
        networkManager.getUpcomingMovie()
        networkManager.getTopRatedMovie()
        networkManager.getTrendingTv()
    
        
    }
    
    func didUpdateUpcomingMovies(with upcomingMovies: [MovieTitle]) {
        self.upcomingMovie = upcomingMovies
    }
    
    func didUpdateTopRatedMovies(with topRatedMovies: [MovieTitle]) {
        self.topRatedMovie = topRatedMovies
    }
    
    func didUpdateTrendingTv(with trendingTv: [MovieTitle]) {
        self.trendingTv = trendingTv
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "showMovieOverview" else {return}
        
    }
    @IBAction private func randomButtonDidTap(_ sender: UIButton){
        allMovies = upcomingMovie + topRatedMovie + trendingTv
        guard let randomMovie = allMovies.randomElement() else {return}
        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(randomMovie.poster_path! )")
        moviePoster.kf.setImage(with: imageUrl)
        movieTitle.text = randomMovie.original_title
        movieRating.text = "\(round(randomMovie.vote_average!*10)/10 )/10"
        let fullDate : String = randomMovie.release_date ?? "2002-10"
        let dateArr : [String] = fullDate.components(separatedBy: "-")
        if dateArr[1] == "01"{
            movieYear.text = "\(dateArr[2]) january \(dateArr[0])"
        }
        else if dateArr[1] == "02"{
            movieYear.text = "\(dateArr[2]) february \(dateArr[0])"
        }
        else if dateArr[1] == "03"{
            movieYear.text = "\(dateArr[2]) march \(dateArr[0])"
        }
        else if dateArr[1] == "04"{
            movieYear.text = "\(dateArr[2]) april \(dateArr[0])"
        }
        else if dateArr[1] == "05"{
            movieYear.text = "\(dateArr[2]) may \(dateArr[0])"
        }
        else if dateArr[1] == "06"{
            movieYear.text = "\(dateArr[2]) june \(dateArr[0])"
        }
        else if dateArr[1] == "07" {
            movieYear.text = "\(dateArr[2]) july \(dateArr[0])"
        }
        else if dateArr[1] == "08"{
            movieYear.text = "\(dateArr[2]) august \(dateArr[0])"
        }
        else if dateArr[1] == "09"{
            movieYear.text = "\(dateArr[2]) september \(dateArr[0])"
        }
        else if dateArr[1] == "10"{
            movieYear.text = "\(dateArr[2]) october \(dateArr[0])"
        }
        else if dateArr[1] == "11" {
            movieYear.text = "\(dateArr[2]) november \(dateArr[0])"
        }
        else if dateArr[1] == "12"{
            movieYear.text = "\(dateArr[2]) december \(dateArr[0])"
        }
       
        
    }
    


}

//
//  ResultTableViewCell.swift
//  Cinematica
//
//  Created by Дархан Есенкул on 02.01.2023.
//

import UIKit
import Kingfisher

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
   
    func updateCell(movie: MovieTitle?){
        guard let CompleteURL = URL(string: "https://image.tmdb.org/t/p/w500/\(movie?.poster_path ?? "")") else {return}
        moviePoster.kf.setImage(with: CompleteURL)
        movieTitle.text = movie?.original_title
        movieYear.text = movie?.release_date
        movieRating.text = "\(movie?.vote_average ?? 0.0)"
    }

}

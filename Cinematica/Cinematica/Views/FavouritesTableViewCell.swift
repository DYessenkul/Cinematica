//
//  FavouritesTableViewCell.swift
//  Cinematica
//
//  Created by Дархан Есенкул on 04.01.2023.
//

import UIKit
import Kingfisher

class FavouritesTableViewCell: UITableViewCell {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateCell(movie: MovieTitle?){
        guard let CompleteURL = URL(string: "https://image.tmdb.org/t/p/w500/\(movie?.poster_path ?? "")") else {return}
        moviePoster.kf.setImage(with: CompleteURL)
        movieTitle.text = movie?.original_title
        movieDate.text = movie?.release_date
        movieRating.text = "\(movie?.vote_average ?? 0.0)"
    }


}

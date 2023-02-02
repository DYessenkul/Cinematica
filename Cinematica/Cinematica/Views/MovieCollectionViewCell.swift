//
//  MovieCollectionViewCell.swift
//  Cinematica
//
//  Created by Дархан Есенкул on 23.12.2022.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var moviePoster: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!


    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func configure(with model: String){
        guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(model)")else {return}
        moviePoster.kf.setImage(with: imageUrl)
    }
}

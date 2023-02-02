//
//  MovieModel.swift
//  Cinematica
//
//  Created by Дархан Есенкул on 07.12.2022.
//

import Foundation


struct MovieModelResponse: Decodable{
    let results: [MovieTitle]

    
}

struct MovieTitle: Decodable{
    let original_title: String?
    let poster_path: String?
    let release_date: String?
    let vote_average: Float?
    let overview: String?
    let vote_count: Int?
}


//struct MoviesTable: Decodable{
//    let original_title: String?
//    let poster_path: String?
//    let release_date: String?
//    let vote_average: String?
//}



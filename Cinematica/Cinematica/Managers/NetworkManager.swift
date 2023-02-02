//
//  NetworkManager.swift
//  Cinematica
//
//  Created by Дархан Есенкул on 07.12.2022.
//

import Foundation
import Alamofire

protocol TopRatedNetworkManagerDelegate{
    func didUpdateTopRatedMovies(with topRatedMovies: [MovieTitle])
}

protocol UpcomingNetworkManagerDelegate{
    func didUpdateUpcomingMovies(with upcomingMovies: [MovieTitle])
}
protocol TrendingTvNetworkManagerDelegate{
    func didUpdateTrendingTv(with trendingTv: [MovieTitle])
}

protocol SearchResultNetworkManagerDelegate{
    func didUpdateSearchResult(with searchResult: [MovieTitle])
}

struct NetworkManager{
    var topRatedDelegate: TopRatedNetworkManagerDelegate?
    var upcomingDelegate: UpcomingNetworkManagerDelegate?
    var trendingTvDelegate: TrendingTvNetworkManagerDelegate?
    var searchResultDelegate: SearchResultNetworkManagerDelegate?
    
    func getUpcomingMovie(){
        let urlString = "https://api.themoviedb.org/3/movie/upcoming?api_key=697d439ac993538da4e3e60b54e762cd&language=en-US&page=1"
        AF.request(urlString).responseDecodable(of: MovieModelResponse.self) { response in
            switch response.result{
            case.success(let upcoming):
                upcomingDelegate?.didUpdateUpcomingMovies(with: upcoming.results)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    

    

    func getTopRatedMovie(){
        let urlString = "https://api.themoviedb.org/3/movie/top_rated?api_key=697d439ac993538da4e3e60b54e762cd&language=en-US&page=1"
        AF.request(urlString).responseDecodable(of: MovieModelResponse.self) { response in
            switch response.result{
            case.success(let topRated):
                topRatedDelegate?.didUpdateTopRatedMovies(with: topRated.results)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }


    func getTrendingTv(){
        let urlString = "https://api.themoviedb.org/3/trending/movie/day?api_key=697d439ac993538da4e3e60b54e762cd&language=en-US&page=1"
        AF.request(urlString).responseDecodable(of: MovieModelResponse.self) { response in
            switch response.result{
            case.success(let trendingTv):
                trendingTvDelegate?.didUpdateTrendingTv(with: trendingTv.results)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
//    func search(with query: String){
//        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
//               guard let urlString = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=697d439ac993538da4e3e60b54e762cd&query=\(query)") else {return}
//        let urlRequest = URLRequest(url: urlString)
//        let session = URLSession(configuration: .default)
//
//
//    }
    
    func search(with query: String){
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let urlString = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=697d439ac993538da4e3e60b54e762cd&query=\(query)") else {return}
        AF.request(urlString).responseDecodable(of: MovieModelResponse.self) { response in
            switch response.result{
            case.success(let result):
                searchResultDelegate?.didUpdateSearchResult(with: result.results)

            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    

    
//    func getPopular(){
//        let urlString =  "https://api.themoviedb.org/3/movie/popular?api_key=697d439ac993538da4e3e60b54e762cd&language=en-US&page=1"
//        AF.request(urlString).responseDecodable(of: MovieModelResponse.self) { response in
//            switch response.result{
//            case.success(let popular):
//                popularDelegate?.didUpdatePopularMovies(with: popular.results)
//            case.failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    
    

}

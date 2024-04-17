//
//  HomeViewController.swift
//  Cinematica
//
//  Created by Дархан Есенкул on 24.12.2022.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UpcomingNetworkManagerDelegate, TopRatedNetworkManagerDelegate, TrendingTvNetworkManagerDelegate {
    
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    @IBOutlet weak var topRatedCollcetionView: UICollectionView!
    @IBOutlet weak var trendingTvCollectionView: UICollectionView!
    
    
    var networkManager = NetworkManager()
    
    var upcomingMovie = [MovieTitle]()
    var topRatedMovie = [MovieTitle]()
    var trendingTv = [MovieTitle]()

    
    
   override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.upcomingDelegate = self
        networkManager.topRatedDelegate = self
        networkManager.trendingTvDelegate = self
        networkManager.getUpcomingMovie()
        networkManager.getTopRatedMovie()
        networkManager.getTrendingTv()
        view.backgroundColor = UIColor(red: 16/255.0, green: 14/255.0, blue: 42/255.0, alpha: 1)
        mainImage.image = UIImage(named: "avatar")
        mainImage.layer.opacity = 0.95

        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate = self
        upcomingCollectionView.backgroundColor = UIColor(red: 23/255.0, green: 21/255.0, blue: 56/255.0, alpha: 1)
        topRatedCollcetionView.dataSource = self
        topRatedCollcetionView.delegate = self
        topRatedCollcetionView.backgroundColor = UIColor(red: 23/255.0, green: 21/255.0, blue: 56/255.0, alpha: 1)
        trendingTvCollectionView.dataSource = self
        trendingTvCollectionView.delegate = self
        trendingTvCollectionView.backgroundColor = UIColor(red: 23/255.0, green: 21/255.0, blue: 56/255.0, alpha: 1)

      
        overrideUserInterfaceStyle = .dark
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SingleMovie") as? MovieOverviewViewController
        if collectionView == upcomingCollectionView {
            vc?.movie = upcomingMovie[indexPath.row]
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        else if collectionView == trendingTvCollectionView{
            vc?.movie = trendingTv[indexPath.row]
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        else if collectionView == topRatedCollcetionView{
            vc?.movie = topRatedMovie[indexPath.row]
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }

//        self.navigationController?.pushViewController(vc!, animated: true)

    }

    func didUpdateUpcomingMovies(with upcomingMovies: [MovieTitle]) {
        self.upcomingMovie = upcomingMovies
        DispatchQueue.main.async {
            self.upcomingCollectionView.reloadData()
        }
    }
    
    func didUpdateTopRatedMovies(with topRatedMovies: [MovieTitle]) {
        self.topRatedMovie = topRatedMovies
        DispatchQueue.main.async {
            self.topRatedCollcetionView.reloadData()
        }
    }
    
    func didUpdateTrendingTv(with trendingTv: [MovieTitle]) {
        self.trendingTv = trendingTv
        DispatchQueue.main.async {
            self.trendingTvCollectionView.reloadData()
        }
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == trendingTvCollectionView){
            return trendingTv.count
        }
        else if (collectionView == upcomingCollectionView){
            return upcomingMovie.count
        }
        else if (collectionView == topRatedCollcetionView){
            return topRatedMovie.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = trendingTvCollectionView.dequeueReusableCell(withReuseIdentifier: "trendingTvCell", for: indexPath) as? MovieCollectionViewCell else {return UICollectionViewCell()}

        
        guard let model = trendingTv[indexPath.row].poster_path else {return UICollectionViewCell()}
        cell.configure(with: model)
        cell.movieTitle.text = trendingTv[indexPath.row].original_title!

     
        if (collectionView == upcomingCollectionView){
            guard let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as? MovieCollectionViewCell else {return UICollectionViewCell()}
            guard let model = upcomingMovie[indexPath.row].poster_path else{return UICollectionViewCell()}
            cell.configure(with: model)
            cell.movieTitle.text = upcomingMovie[indexPath.row].original_title!
            return cell
        }
        
        else if (collectionView == topRatedCollcetionView){
            guard let cell = topRatedCollcetionView.dequeueReusableCell(withReuseIdentifier: "topRatedCell", for: indexPath) as? MovieCollectionViewCell else {return UICollectionViewCell()}
            guard let model = topRatedMovie[indexPath.row].poster_path else{return UICollectionViewCell()}
            cell.configure(with: model)
            cell.movieTitle.text = topRatedMovie[indexPath.row].original_title!
            return cell
        }
        
        return cell
    }
    
    

}



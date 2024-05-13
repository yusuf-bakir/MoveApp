//
//  NetworkHelper.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 19.03.2024.
//

import Foundation
enum ErrorTypes: String, Error {
    case invalidData = "Invalid data"
    case invalidURL = "Invalid url"
    case generalError = "An error happened"
}

class NetworkHelper {
    static let shared = NetworkHelper()

    private let baseURL = "https://api.themoviedb.org/3/"
    private let apiKey = "976934cfcdc4a54aa56284f162637a3e"
    private let imageBasePath = "https://image.tmdb.org/t/p/original/"
    
    func requestUrl(url: String) -> String {
        baseURL + url + "?api_key=\(apiKey)"
        
    }
    
    func getImagePath(url: String) -> String {
        imageBasePath + url
    }
}


enum MovieCategory {
    case nowPlaying
    case popular
    case trending
    case topRated
    case upcoming
}

enum HomeEndpoint: String {
    case genre = "genre/movie/list"
    case popular = "movie/popular"
    case nowPlaying = "movie/now_playing"
    case trending = "trending/movie/day"
    case topRated = "movie/top_rated"
    case upcoming = "movie/upcoming"
    var path: String {
        NetworkHelper.shared.requestUrl(url: self.rawValue)
    }
}

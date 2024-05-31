
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct DetailsMovie: Codable ,DetailDataMovieProtocol {
   
    


    

    let adult: Bool
    
    let backdropPath: String
    
    let budget: Int
    
    let genres: [GenreDetail]
    
    let homepage: String
    
    let id: Int
    
    let imdbID, originalLanguage, originalTitle, overview: String
    
    let popularity: Double
    
    let posterPath: String
    
    let productionCompanies: [ProductionCompany]
    
    let releaseDate: String
    
    let revenue, runtime: Int
    
    let status, tagline, title: String
    
    let video: Bool
    
    let voteAverage: Double
    
    let voteCount: Int
     
  //MARK: -- DetailViewController Protocol object
    var genreItems: [GenreDetail] {
        genres
        
    }
    
    var voteAvg: Double{
        voteAverage
    }
    var revenueCount: Int{
        revenue
    }
    


    var titleText: String {
        originalTitle
    }
    

    
    var overViewText: String{
        overview
    }
    

    
    var logoImage: String{
        NetworkHelper.shared.getImagePath(url: posterPath )
    }
   
    var productionCompany: [ProductionCompany] {
        productionCompanies ?? []
    }
    
    var backdropUrl: String {
        NetworkHelper.shared.getImagePath(url: backdropPath )
    }
    
    var popular: Double  {
        popularity
    }
    var tagLine :String{
        tagline
    }
   

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case releaseDate = "release_date"
        case revenue, runtime
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Genre
struct GenreDetail: Codable {
    let id: Int
    let name: String
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    let id: Int
    let logoPath: String?
    let name, originCountry: String

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}


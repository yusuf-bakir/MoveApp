//
//  HomePresenter.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 31.03.2024.
//

import Foundation
protocol HomePresenterProtocol{
     var view : HomeViewControllerProtocol?{get set}
    var router :HomeRouterProtocol?{get set}
    var ınteractor: HomeInteractorProtocol?  {get set}
    func getGenre ()
    func getMovie()
    func getCategoryMovie(type:MovieCategory?)
    

}
final class HomePresenter:HomePresenterProtocol{
    func getCategoryMovie(type: MovieCategory?) {
        ınteractor?.getCategory(type:type ?? .popular  , page: 2, complete: { [weak self] movie, error in
            if let  error = error {
                print(error.localizedDescription)
            }else{
                self?.movie = movie
                if let movieItems = movie?.results,!movieItems.isEmpty {
                    self?.view?.categoryMovie(movieItems)                }
                
            }
            
            
            
        })
    }
    
    func getGenre() {
        ınteractor?.getGenres(complete: {[weak self] data,error in
            if let error  = error {
                print(error.localizedDescription)
            }else{
                self?.view?.resultGenre(_dataGenre:data)
            }
            
            
        })
    }
    
 

    
   
    weak  var view: HomeViewControllerProtocol?
    var movie :Movie?
    var router: HomeRouterProtocol?

    var ınteractor: HomeInteractorProtocol?
    init(view: HomeViewControllerProtocol? = nil,  router: HomeRouterProtocol? = nil, ınteractor: HomeInteractorProtocol? = nil) {
        self.view = view
        self.router = router
      
        self.ınteractor = ınteractor
    }
    
    func getMovie() {
        ınteractor?.getCategory(type: .popular, page: 1, complete: { [weak self] movie, error in
            if let  error = error {
                print(error.localizedDescription)
            }else{
                self?.movie = movie
                if let movieItems = movie?.results,!movieItems.isEmpty {
                        self?.view?.updateMovieResults(movieItems)
                }
                
            }
            
            
            
        })
 
    }
}

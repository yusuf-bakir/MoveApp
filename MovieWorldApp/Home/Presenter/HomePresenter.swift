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
    func getCategoryMovie()
    

}
final class HomePresenter:HomePresenterProtocol{

    
    var movieResultItems = [MovieResult]()
    
    var view: HomeViewControllerProtocol?
   
    var movie :Movie?
    var router: HomeRouterProtocol?
    
    var ınteractor: HomeInteractorProtocol?
    init(view: HomeViewControllerProtocol? = nil, router: HomeRouterProtocol? = nil, ınteractor: HomeInteractorProtocol? = nil) {
        self.view = view 
        self.router = router
        self.ınteractor = ınteractor
    }
    
    func getCategoryMovie() {
        ınteractor?.getCategory(type: .popular, page: 1, complete: { [weak self] movie, error in
            if let  error = error {
                print(error.localizedDescription)
            }else{
                self?.movie = movie
                if let movieItems = movie?.results,!movieItems.isEmpty {
                    self?.movieResultItems.append(contentsOf: movieItems)
                        self?.view?.updateMovieResults(movieItems)
                }
                
            }
            
            
            
        })
 
    }
}

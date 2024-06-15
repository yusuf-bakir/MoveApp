//
//  FavoritePresenter.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 6.06.2024.
//

import Foundation
protocol FavoritePresenterProtocol:AnyObject {
    func didDataTransfer(data: DetailDataMovieProtocol?)
    var router : FavoriteRouter?{get set}
    var view :Favorite? { get set }
}
var delegate :detailToFavoriteProtocol?
final class FavoritePresenter :FavoritePresenterProtocol,detailToFavoriteProtocol{
    var router: FavoriteRouter?
 weak var view: Favorite?
    init(router: FavoriteRouter? = nil, view: Favorite? = nil) {
        self.router = router
        self.view = view
    }
    func didDataTransfer(data: DetailDataMovieProtocol?) {
       
            if let data = data {
            print(data)
        
    
            
        }
        
    }
    
}

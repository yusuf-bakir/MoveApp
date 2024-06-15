//
//  FavoriteRouter.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 16.06.2024.
//

import Foundation
protocol FavouriteRouterProtocol{
    static func creatModuleFavorite(view ref : Favorite?)
}
class FavoriteRouter :FavouriteRouterProtocol{
    static func creatModuleFavorite(view ref: Favorite?) {
        let router = FavoriteRouter()
        let presenter = FavoritePresenter(router: router,view: ref)
        ref?.viewToPresenter = presenter
    
    }
    
    
}

//
//  Detailınteractor.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 24.05.2024.
//

import Foundation
protocol DetailInteractorProtocol{
    var networking : NetworkManagerProtocol? {get set }
    func fetchDetail(id : Int, complete: @escaping (DetailsMovie?, Error?) -> ())
    var toPresenter :DetailPresenterProtocol?{get set}
   
}
final class DetailInteractor :DetailInteractorProtocol{
 
    
    var toPresenter: DetailPresenterProtocol?
    
    var networkManager =  NetworkManager()
    var networking: NetworkManagerProtocol?
    init( networking: NetworkManagerProtocol? = nil) {
    
        self.networking = networkManager
    }
    
    
    
    func fetchDetail(id: Int, complete: @escaping (DetailsMovie?, Error?) -> ()) {
        networking?.makeRequest(type: DetailsMovie.self, url: NetworkHelper.shared.getMovieDetailPath(id: id), method: .get, completion: { response in
        
            switch response {
            case .success(let data):
                complete(data,nil)
            case .failure(let failure):
                complete(nil ,failure)
            }
        })
    }
    

    
    
}

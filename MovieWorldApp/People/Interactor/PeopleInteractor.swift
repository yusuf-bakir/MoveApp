//
//  PeopleInteractor.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 18.04.2024.
//

import Foundation
protocol PeopleInteractorProtocol {
    var networking :NetworkManager?{get set}
    var ınteractorTopresenter :  PeoplePresenterProtocol? {get set}
    func fetchPeople (complete:@escaping((People?,Error?)->()))

}
final class PeopleInteractor:PeopleInteractorProtocol {
    
    func fetchPeople(complete: @escaping ((People?, Error?) -> ())) {
        networking?.makeRequest(type: People.self, url:PeopleEnpoint.popular.path , method: .get, completion: { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case.failure(let error):
                complete (nil,error)
               
            }
        })
    }
    


    
    var ınteractorTopresenter: PeoplePresenterProtocol?
    let networkManager = NetworkManager()
    var networking: NetworkManager?

    init(networking: NetworkManager? = nil) {
        self.networking = networkManager
    }
 
  


}

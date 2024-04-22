//
//  PeopleInteractor.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 18.04.2024.
//

import Foundation
protocol PeopleInteractorProtocol {
    var fetch :NetworkManager?{get set}
    
}
class PeopleInteractor:PeopleInteractorProtocol {
    var fetch: NetworkManager?
    

    
    init(fetch: NetworkManager? = nil) {
        self.fetch = fetch
    }
    func movieList() {
        fetch?.makeRequest(type: PeopleEntity.self, url: "", method: .get, completion: { data in
            
        })
        
        
    }
}

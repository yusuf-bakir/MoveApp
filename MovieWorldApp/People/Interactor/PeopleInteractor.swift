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


}
final class PeopleInteractor:PeopleInteractorProtocol {

    
    var ınteractorTopresenter: PeoplePresenterProtocol?
    let networkManager = NetworkManager()
    var networking: NetworkManager?

    init(networking: NetworkManager? = nil) {
        self.networking = networkManager
    }
 
  


}

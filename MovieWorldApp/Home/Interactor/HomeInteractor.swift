//
//  HomeInteractor.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 31.03.2024.
//

import Foundation
protocol HomeInteractorProtocol {
    var ınteractorTopresenter : HomePresenterProtocol? {get set}
}
class HomeInteractor:HomeInteractorProtocol {
    var ınteractorTopresenter: HomePresenterProtocol?
    
    
}

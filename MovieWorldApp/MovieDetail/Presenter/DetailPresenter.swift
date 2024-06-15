    //
    //  DetailPresenter.swift
    //  MovieWorldApp
    //
    //  Created by yusuf bakır on 24.05.2024.
    //

    import Foundation

     protocol DetailPresenterProtocol:AnyObject{
        var view :DetailViewControllerProtocol?{get set}
        var ınteractor : DetailInteractorProtocol? {get set}
        var router : DetailRouterProtocol?{get set}
        func getDetailMovie(id:Int?)
         func FVData(data:DetailDataMovieProtocol?)
    }
final class DetailPresenter :DetailPresenterProtocol{
    func FVData(data: DetailDataMovieProtocol?) {
       
        view?.delegate?.didDataTransfer(data: data)
        
    }
    
        
        weak  var view: DetailViewControllerProtocol?
        
        var ınteractor: DetailInteractorProtocol?
        
        var router: DetailRouterProtocol?
        //MARK: -- initilazide
        init(view: DetailViewControllerProtocol? = nil, ınteractor: DetailInteractorProtocol? = nil, router: DetailRouterProtocol? = nil) {
            self.view = view
            self.ınteractor = ınteractor
            self.router = router
        }
        
        func getDetailMovie(id: Int?) {
            ınteractor?.fetchDetail(id: id!, complete: {[weak self] data ,error in
                DispatchQueue.main.async {
                    if let error = error {
                        self?.router?.showHome(from:self?.view)
                        self?.view?.movieError(message: "Genel Hata!, lütfen daha sonra tekrar deneyiniz.")
                    }else{
                        
                        self?.view?.getDetailMovie(data: data!)
                        
                    }
                }
            })
        }      // detailMovieGet func
        

        
    }

//
//  DetailsViewController.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 24.05.2024.
//

import UIKit
import SnapKit

protocol DetailDataMovieProtocol {
    var titleText: String { get }
    var genreItems: [GenreDetail] { get }
    var overViewText: String { get }
    var logoImage :String{get}
    var productionCompany:[ProductionCompany]{get}
    var voteAvg:Double{get}
    var backdropUrl:String{get}
    var popular :Double {get}
    var tagLine :String{get}
    var revenueCount : Int{get}
}

protocol DetailViewControllerProtocol:AnyObject {
    var viewToPresenter :DetailPresenterProtocol? { get set }
    func movieError (message:String)
    func getDetailMovie(data:DetailDataMovieProtocol)

   
  
}
class DetailsViewController: UIViewController,DetailViewControllerProtocol, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
  
    func getDetailMovie(data: DetailDataMovieProtocol) {
        overwiev.text = data.overViewText
        poster_path.sd_setImage(with: URL(string: data.logoImage))
        backdrop_path.sd_setImage(with: URL(string: data.backdropUrl))
        titleName.text = data.titleText
        tagLines.text = data.tagLine
        popularity.text = "\(data.popular)"
        revenueCount.text = "\(data.revenueCount)"
        reyting.text = "\(data.voteAvg) / 10 IMDB"
        
        productCompany  = data.productionCompany
        cast.reloadData()
      
    }
    
    func movieError(message: String) {
        let showErrorLogin = addAlert(title: "Uyarı", message: message)
        present(showErrorLogin, animated: true, completion: nil)
    }
    
    init() {
        super.init(nibName: "DetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    
    }
    var productCompany : [ProductionCompany] = []
    var viewToPresenter :DetailPresenterProtocol?
    var id = 0

    @IBOutlet weak var revenueCount: UILabel!
    @IBOutlet weak var tagLines: UILabel!
    @IBOutlet weak var viewBehindImage: UIView!
    @IBOutlet weak var poster_path: UIImageView!
    @IBOutlet weak var backdrop_path: UIImageView!
    @IBOutlet weak var overwiev: UILabel!
    @IBOutlet weak var Language: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var reyting: UILabel!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var cast: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .color1
        DetailRouter.creatMyDetailModule(ref: self)
        viewToPresenter?.detailMovieGet(id: id)
        poster_path.layer.cornerRadius = 10
        viewBehindImage.layer.cornerRadius = 10
        cast.delegate = self
        cast.dataSource = self
        cast.register(UINib(nibName: "companyViewCell", bundle: nil), forCellWithReuseIdentifier: "companyViewCell")

        
       

    }

   
 
    @IBAction func backToHome(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
        
    }
    @IBAction func buttomTappedLike(_ sender: UIButton) {
        sender.tintColor = UIColor.red
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productCompany.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cast.dequeueReusableCell(withReuseIdentifier: "companyViewCell", for: indexPath)  as! companyViewCell
         
        cell.configreCell(title: productCompany[indexPath.row].name, imagePath: productCompany[indexPath.row].logoPath ?? "")
        cell.backgroundColor = .white
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:120 , height: 132 )
    }
    
    
    
    
}

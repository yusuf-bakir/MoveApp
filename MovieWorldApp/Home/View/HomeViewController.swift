//
//  HomeViewController.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 31.03.2024.
//
import SnapKit
import UIKit


protocol HomeViewControllerProtocol :AnyObject{
    
    var viewToPresenter : HomePresenterProtocol?{get set }
    func updateMovieResults(_ movieResults: [MovieResult])
    func resultGenre(_dataGenre:[GenreEntitiy]?)
    func categoryMovie(_ movieResults: [MovieResult])
    
   
  
}
final class HomeViewController: UIViewController, HomeViewControllerProtocol{

    var completionHandler: ((Int) -> Void)?
    var genre = "Popular"
    var movieCategory:[MovieResult]?
    var movieGenres :[GenreEntitiy]?
    private  var  collectionView: UICollectionView!
    var viewToPresenter: HomePresenterProtocol?
    var movieResulstData :[MovieResult]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeRouter.creatHomeModule(ref: self)
    
        colletionSetup()
        collectionView.dataSource = self
        collectionView.delegate = self
        viewToPresenter?.getMovie()
        viewToPresenter?.getGenre()
       view.backgroundColor = .color1
        favoriteButtom()
//    
      
    
        
    }
    func categoryMovie(_ movieResults: [MovieResult]) {
        DispatchQueue.main.async { [weak self] in
           self?.movieCategory?.removeAll()
           self?.movieCategory = movieResults
            self?.collectionView.reloadData()
         
        }
    }
    
 
    func resultGenre(_dataGenre: [GenreEntitiy]?) {
        
        DispatchQueue.main.async { [weak self] in
            self?.movieGenres = _dataGenre
            
            GenreHandler.shared.setItems(items: self?.movieGenres ?? [])
            
        }
    }
    
    func favoriteButtom() {
        let button = UIButton(type: .system)
        if let image = UIImage(systemName: "circle.grid.3x3") {
            let whiteImage = image.withTintColor(.white, renderingMode: .alwaysOriginal)
                button.setImage(whiteImage, for: .normal)
               }
               button.frame = CGRect(x: view.bounds.width - 100, y: 50, width: 80, height: 40) // Sağ üst köşe için konum ayarla
               button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
               view.addSubview(button)

    }
    
    @objc func buttonTapped() {
        let menu = MenuViewController()
        menu.delegate = self
        self.present(menu, animated: true, completion: nil)

      
        }

    func updateMovieResults(_ movieResults: [MovieResult]) {
        DispatchQueue.main.async { [weak self] in
            self?.movieCategory = movieResults
            self?.movieResulstData = movieResults
            self?.collectionView.reloadData()
         
        }
        
    }
} 
 // MARK: -- colletionSetup
extension HomeViewController {
    func colletionSetup() {
        let layout  = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
      
        layout.minimumLineSpacing = 30
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
      
        collectionView.register(UINib(nibName: "HorizontalViewCell", bundle: nil), forCellWithReuseIdentifier: "\(HorizontalViewCell.self)")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
       collectionView.backgroundColor = .color1
      
        collectionView.register(UINib(nibName: "HomeHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeader")
               view.addSubview(collectionView)
               setupConstraints()
    }
    func setupConstraints() {
            collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.snp.makeConstraints({ make in
            
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                    make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
                    make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
                    make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        })
           
        }
}
//MARK: -- Horizontal colletionview
extension HomeViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieCategory?.count ?? 0
       }
    

       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalViewCell", for: indexPath)  as! HorizontalViewCell
           cell.configreCell(data:  movieCategory?[indexPath.row])
   
           return cell
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 327 / 375, height: 120)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieID = movieCategory?[indexPath.row].id
     
        viewToPresenter?.showDetail(id: movieID)
    }
    //MARK: -- Header colletionview
    
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
         if kind == UICollectionView.elementKindSectionHeader {
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeHeader", for: indexPath) as! HomeHeader
             headerView.titleCategory.text = genre
             headerView.confirgeData(data:movieResulstData ?? [])
            
                return headerView
            } else {
                
                return UICollectionReusableView()
            }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 400)
        
    }


}

extension HomeViewController: menuCategoryProtocol{
    func category(type: MovieCategory) {
        genre = type.rawValue
        viewToPresenter?.getCategoryMovie(type: type)
        
      
    }
    
    
}

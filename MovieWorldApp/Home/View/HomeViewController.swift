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
}
final class HomeViewController: UIViewController, HomeViewControllerProtocol{
    func resultGenre(_dataGenre: [GenreEntitiy]?) {
        DispatchQueue.main.async { [weak self] in
            self?.movieGenres = _dataGenre
            
            GenreHandler.shared.setItems(items: self?.movieGenres ?? [])
           
         
            
        }
    }
    
    var movieGenres :[GenreEntitiy]?
    var collectionView: UICollectionView!
    var viewToPresenter: HomePresenterProtocol?
    var movieResultData :[MovieResult]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeRouter.creatHomeModule(ref: self)
        colletionSetup()
        collectionView.dataSource = self
        collectionView.delegate = self
        viewToPresenter?.getCategoryMovie()
        viewToPresenter?.getGenre()
        view.backgroundColor = .color1
        
        
       
    }
    func updateMovieResults(_ movieResults: [MovieResult]) {
        DispatchQueue.main.async { [weak self] in
            self?.movieResultData = movieResults
            self?.collectionView.reloadData()
            

        
         
            
        }
        
    }
}
extension HomeViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieResultData?.count ?? 0
       }

       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalViewCell", for: indexPath)  as! HorizontalViewCell
           cell.configreCell(data:  movieResultData?[indexPath.row])

           
           return cell
       }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 327 / 375, height: 120)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 400)
    }
    
    
    func colletionSetup() {
        let layout  = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
      
        layout.minimumLineSpacing = 30
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
      
        collectionView.register(UINib(nibName: "HorizontalViewCell", bundle: nil), forCellWithReuseIdentifier: "\(HorizontalViewCell.self)")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .color1
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

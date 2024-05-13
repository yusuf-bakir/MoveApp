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
    var movieResulstData :[MovieResult]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeRouter.creatHomeModule(ref: self)
        colletionSetup()
        collectionView.dataSource = self
        collectionView.delegate = self
        viewToPresenter?.getCategoryMovie()
        viewToPresenter?.getGenre()
        view.backgroundColor = .color1
        
        
        
        
//        let toolbar = UIToolbar()
//        toolbar.barTintColor = UIColor.white
////        let button1 = UIBarButtonItem(title: "Button 1", style: .plain, target: self, action: #selector(button1Tapped))
////               let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) // Esnek boşluk ekleyerek diğer butonu sağ tarafa kaydırıyoruz
////               let button2 = UIBarButtonItem(title: "Button 2", style: .plain, target: self, action: #selector(button2Tapped))
//        toolbar.setItems([ flexibleSpace], animated: true)
//        toolbar.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(toolbar)
//        
       
    }
    
    
    
    func updateMovieResults(_ movieResults: [MovieResult]) {
        DispatchQueue.main.async { [weak self] in
            self?.movieResulstData = movieResults
            self?.collectionView.reloadData()
            

        
         
            
        }
        
    }
}
extension HomeViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieResulstData?.count ?? 0
       }
    

       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalViewCell", for: indexPath)  as! HorizontalViewCell
           cell.configreCell(data:  movieResulstData?[indexPath.row])
           
           
           return cell
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 327 / 375, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 400)
    }
    
    
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeHeader", for: indexPath) as! HomeHeader
         if kind == UICollectionView.elementKindSectionHeader {
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeHeader", for: indexPath) as! HomeHeader
            
             headerView.confirgeData(data:movieResulstData ?? [])
                return headerView
            } else {
                
                return UICollectionReusableView()
            }
       
      
        
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

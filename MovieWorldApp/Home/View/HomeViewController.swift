//
//  HomeViewController.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 31.03.2024.
//
import SnapKit
import UIKit
protocol HomeViewControllerProtocol {
    var viewToPresenter : HomePresenterProtocol?{get set }
}
final class HomeViewController: UIViewController, HomeViewControllerProtocol,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    var collectionView: UICollectionView!
    var viewToPresenter: HomePresenterProtocol?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        colletionSetup()
        collectionView.dataSource = self
        collectionView.delegate = self
       
       
    }
    func colletionSetup() {
        let layout  = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
      
        layout.minimumLineSpacing = 30
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
      
        collectionView.register(UINib(nibName: "HorizontalViewCell", bundle: nil), forCellWithReuseIdentifier: "\(HorizontalViewCell.self)")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 30 // Örnek eleman sayısı
       }

       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalViewCell", for: indexPath)  as! HorizontalViewCell
            // Hücre rengi
           
           return cell
       }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 327 / 375, height: 120)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 400)
    }
    
   
    
}

//
//  PeopleViewController.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 2.04.2024.
//

import UIKit
import SnapKit
protocol PeopleViewProtocol:AnyObject {
    var viewToPresenter :PeoplePresenter?{get set}
    func peopleList (data:[PeopleResult]?)
    func errorMessage(error :String?)
    
}
final class PeopleViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
    var list  = [PeopleResult]()
    private  var collection : UICollectionView!
       weak  var viewToPresenter :PeoplePresenter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
        view.backgroundColor = .color1
      
       PeopleRouter.creatPeopleModule(ref: self)
//
        configre()
        viewToPresenter?.getPeople()

    }
    
    func configre () {
        let layout = UICollectionViewFlowLayout()
              layout.scrollDirection = .vertical
              layout.minimumInteritemSpacing = 20
              layout.minimumLineSpacing = 20
              
              // UICollectionView oluşturma
        collection = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collection.backgroundColor = .color1
        collection.register(UINib(nibName: "PeopleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PeopleCollectionViewCell")
       
        collection.delegate = self
        collection.dataSource = self
 
        view.addSubview(collection)
        
        
    }
    func setupConstraints() {
         
        collection.snp.makeConstraints({ make in
            
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                    make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
                    make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
                    make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        })
           
        }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return list?.count ?? 0
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "PeopleCollectionViewCell", for: indexPath) as! PeopleCollectionViewCell
        cell.confirePeople(data: list[indexPath.item])
        cell.backgroundColor = .color1
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 10
        let height = collectionView.frame.height * 270 / 812
        return CGSize(width: width, height: height)
    }
}















extension PeopleViewController :PeopleViewProtocol{
    func errorMessage(error: String?) {
        let showErrorLogin = addAlert(title: "Uyarı", message: error ?? "Genel Hata")
             present(showErrorLogin, animated: true, completion: nil)
    }

    func peopleList(data: [PeopleResult]?) {
        DispatchQueue.main.async {
            if let data = data {
                self.list = data
                self.collection.reloadData()
            }
        }
   
    }
    
    
}

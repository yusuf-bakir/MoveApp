//
//  SearchViewController.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 18.04.2024.
//

import UIKit
import SnapKit
protocol FavoriteViewControllerProtocol {
    var viewToPresenter : FavoritePresenterProtocol?{get set }
   
}
class Favorite: UIViewController,detailToFavoriteProtocol ,UITableViewDelegate,UITableViewDataSource{
    func didDataTransfer(data: DetailDataMovieProtocol?) {
        if let data = data {
        print(data)
        }
    }
    
   
    


    
      var viewToPresenter : FavoritePresenterProtocol?
      private  var tableView = UITableView()
    var itemsFavorite: [DetailDataMovieProtocol] = []

    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupTableViewCell()
     
        view.backgroundColor = .color1
        view.addSubview(titleLabel)
        labelConstraint()
        tableView.delegate = self
        tableView.dataSource = self

        
        
    }  
    

    private lazy var titleLabel : UILabel =  {
        let label = UILabel()
        label.text = "Favorite+"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        return label
    
    }()
 private   func labelConstraint() {
     titleLabel.snp.makeConstraints({make in
         make.top.equalTo(view.snp.top).offset(70)
         make.bottom.equalTo(tableView.snp.top)
         make.leading.equalTo(view.snp.leading).offset(20)
         
         
         
         
     })
    }
    func setupTableViewCell() {
        tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView)
      
        
        tabbleViewConstraint()
        self.tableView.register(UINib(nibName: "FavoriteTableCell", bundle: nil), forCellReuseIdentifier: "FavoriteTableCell")
        tableView.backgroundColor = .color1
        tableView.estimatedRowHeight = 100.0
     
        
        
    }
 private    func tabbleViewConstraint() {
        tableView.snp.makeConstraints({ make in
            make.top.equalTo(view.snp.top).offset(130)
            make.bottom.equalTo(view.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10


        
      
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableCell", for: indexPath) as! FavoriteTableCell
//        cell.raytingFV.text = list[indexPath.row].overViewText
        cell.backgroundColor = .color1
        return cell
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100.0 // Örneğin, her hücre 100 piksel yüksekliğinde
        }
}
extension Favorite:FavoriteViewControllerProtocol{
  
    
    
}

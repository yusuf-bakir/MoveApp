//
//  HomeHeader.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 7.05.2024.
//

import UIKit

class HomeHeader: UICollectionReusableView, UICollectionViewDelegate, UICollectionViewDataSource {

    
    
    @IBOutlet weak var viewTop: UIView!
    
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var colletionHead: UICollectionView!
    var items =  [MovieResult]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewTop.backgroundColor = .color1
        viewBottom.backgroundColor = .color1
       colletionHead.backgroundColor = .color1
        colletionHead.delegate = self
        colletionHead.dataSource = self
        configreHead()
    }
    func confirgeData(data:[MovieResult]){
    
        items = data 
        colletionHead.reloadData()
    }
    func configreHead () {
        colletionHead.register(UINib(nibName: "VerticalCell", bundle: nil), forCellWithReuseIdentifier: "VerticalCell")
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colletionHead.dequeueReusableCell(withReuseIdentifier: "VerticalCell", for: indexPath)  as! VerticalCell
        cell.configreData(data: items[indexPath.item])
        cell.layer.cornerRadius = 5
        cell.backgroundColor = .color1
        

        return cell
    }

}

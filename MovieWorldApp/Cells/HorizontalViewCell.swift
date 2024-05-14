//
//  HorizontalViewCell.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 22.04.2024.
//

import UIKit
import SnapKit
import SDWebImage
protocol MovieCellProtocol {
    var posterImage: String { get  }
    var titleText: String { get }
    var ratingText: String { get }
     var genreItems: [String] { get }
    var overViewText: String { get }
}

class HorizontalViewCell: UICollectionViewCell {
    
    @IBOutlet weak var overViewLabel: UILabel!
    
    @IBOutlet weak var colletionTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var colletion: UICollectionView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak  var movieImage: UIImageView!
    @IBOutlet weak  var movieTitle: UILabel!
    var items = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        movieImage.layer.cornerRadius = 5
        colletion.dataSource = self
        colletion.delegate = self
        configreLabelCell()
    }
    func configreCell(data : MovieCellProtocol?){
        ratingLabel.text = data?.ratingText
        movieTitle.text = data?.titleText
        if let ımageUrl = data?.posterImage{
        movieImage.sd_setImage(with: URL(string: ımageUrl))
            
        }
        if data?.genreItems == []{
            colletionTopConstraint.constant = 0
            collectionHeightConstraint.constant = 0
        }else{
            items = data?.genreItems ?? []
            self.colletion.reloadData()
        }
        overViewLabel.text = data?.overViewText
    }
 
    func configreLabelCell () {
      
        colletion.register(UINib(nibName: "LabelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LabelCollectionViewCell")
        colletion.backgroundColor = .color1
     
       
      
       
    
        
    }
    
   
    
}
extension HorizontalViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LabelCollectionViewCell", for: indexPath)  as! LabelCollectionViewCell
      
        cell.configre(text: items[indexPath.item].uppercased())
   
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height:  collectionView.frame.height)
    }
    
}

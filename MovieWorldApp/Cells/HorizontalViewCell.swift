//
//  HorizontalViewCell.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 22.04.2024.
//

import UIKit
import SDWebImage
protocol MovieCellProtocol {
    var posterImage: String { get }
    var titleText: String { get }
    var ratingText: String { get }
//    var genreItems: [String] { get }
    var overViewText: String { get }
}

class HorizontalViewCell: UICollectionViewCell {
    
    var imageUrlString  = ""
    @IBOutlet weak var colletion: UICollectionView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak  var movieImage: UIImageView!
    @IBOutlet weak  var movieTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        if let imageUrl = URL(string: imageUrlString ?? "") {
            movieImage.sd_setImage(with: imageUrl)
               }
        
       
    }

}

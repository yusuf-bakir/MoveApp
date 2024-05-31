//
//  VeritcalCollectionViewCell.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 5.05.2024.
//

import UIKit
import SDWebImage
class VerticalCell: UICollectionViewCell {
    
    @IBOutlet weak var verticalRating: UILabel!
    @IBOutlet weak var verticalLabel: UILabel!
    @IBOutlet weak var verticalImage: UIImageView!
    var ımagePathUrl = ""
    override func awakeFromNib() {
        super.awakeFromNib()

      
        verticalLabel.textColor = .white
        verticalRating.textColor = .white
     
        verticalImage.layer.cornerRadius = 5
    }
    func configreData(data : MovieCellProtocol){
        verticalRating.text  = data.ratingText
        verticalLabel.text = data.titleText
        ımagePathUrl = data.posterImage
        verticalImage.sd_setImage(with: URL(string: ımagePathUrl))
        
    }
   
    
}

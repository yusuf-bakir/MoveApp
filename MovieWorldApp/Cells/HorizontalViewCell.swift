//
//  HorizontalViewCell.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 22.04.2024.
//

import UIKit

class HorizontalViewCell: UICollectionViewCell {

  
    @IBOutlet weak  var movieImage: UIImageView!
    @IBOutlet weak  var movieTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        movieImage.image = UIImage(named: "play")
       
    }

}

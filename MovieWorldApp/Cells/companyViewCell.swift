//
//  companyViewCell.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 31.05.2024.
//

import UIKit
import SDWebImage
protocol DetailCompanyProtocol {
    func configreCell (title:String,imagePath:String)
}

class companyViewCell: UICollectionViewCell,DetailCompanyProtocol {
    func configreCell(title: String, imagePath: String) {
                                   
    
        ımage.sd_setImage(with: URL(string: NetworkHelper.shared.getImagePath(url: imagePath)))
        
        titleName.text = title
        
    
    }
    


    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var ımage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleName.textColor = .black
        
      
            self.layer.borderWidth = 4.0
              self.layer.borderColor = UIColor.yellow.cgColor
              self.layer.cornerRadius = 8.0
              self.clipsToBounds = true
  
    }
   
}

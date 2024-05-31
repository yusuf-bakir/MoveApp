//
//  PeopleCollectionViewCell.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 21.05.2024.
//

import UIKit
protocol PeopleCellProtocol {
    var titleText :String {get  }
    var imagePath :String {get }
}

class PeopleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var peopleImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
        titleName.textColor = .white
        peopleImage.layer.borderWidth = 4.0
        
            
        peopleImage.layer.borderColor = UIColor.white.cgColor
        peopleImage.layer.cornerRadius = 8.0
        peopleImage.clipsToBounds = true

      
     
              

                
  
    }
    func confirePeople(data: PeopleCellProtocol) {
        titleName.text = data.titleText
        
        peopleImage.sd_setImage(with: URL(string: data.imagePath ))
        
    
        
    }

}



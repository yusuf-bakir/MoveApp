//
//  LabelCollectionViewCell.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 4.05.2024.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.textColor = .black
        layer.cornerRadius = 5
        layer.masksToBounds = true
       
      
    }
    func configre (text:String) {
        titleLabel.text = text
    }

}

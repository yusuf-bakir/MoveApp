//
//  PeopleCell.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 19.05.2024.
//

import UIKit
import SDWebImage
protocol PeopleCellProtocol {
    var name :String {get  }
    var imagePath :String {get }
}

class PeopleCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var peopleImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func confirePeople(data: PeopleCellProtocol) {
        titleLabel.text = data.name
        peopleImage.sd_setImage(with: URL(string: data.imagePath))
        
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

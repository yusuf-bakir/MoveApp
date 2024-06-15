//
//  FavoriteTableCell.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 6.06.2024.
//

import UIKit

class FavoriteTableCell: UITableViewCell {
    @IBOutlet weak var titileFV: UILabel!
    @IBOutlet weak var raytingFV: UILabel!
    @IBOutlet weak var ımageFV: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ımageFV.image  = UIImage(named: "movie-850")
        
        titileFV.text = "ScarFace"
        titileFV.textColor = .white
        raytingFV.textColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func buttomFV_Delete(_ sender: Any) {
    }
    
}

//
//  SideMenuViewController.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 14.05.2024.
//

import UIKit
import SnapKit

class SideMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }
    
    func configreCompenent () {
        let menuLabel = UILabel()
        menuLabel.text = "Menu Item 1"
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuLabel)
        menuLabel.snp.makeConstraints({ make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
      
        })
    }


}

//
//  ViewController.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 12.03.2024.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
   
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        toolBarBottom ()
    }

    func toolBarBottom () {
        let toolbar = UIToolbar()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let item1 = UIBarButtonItem(title: "Item 1", style: .plain, target: self, action: #selector(item1Tapped))
        toolbar.items = [item1, flexibleSpace]
        view.addSubview(toolbar)
        toolbar.snp.makeConstraints({ make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
        })
    }
    @objc func item1Tapped() {
    
       }
}
//#Preview{
//    ViewController()
//}

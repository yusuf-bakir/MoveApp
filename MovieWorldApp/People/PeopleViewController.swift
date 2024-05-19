//
//  PeopleViewController.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 2.04.2024.
//

import UIKit
protocol PeopleViewProtocol:AnyObject {
    var viewToPresenter :PeoplePresenter?{get set}
}
final class PeopleViewController: UIViewController {
  weak  var viewToPresenter :PeoplePresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .color1
        PeopleRouter.creatPeopleModule(ref: self)

    
  
    }
    


}
extension PeopleViewController :PeopleViewProtocol{
    
}

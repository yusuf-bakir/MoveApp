//
//  MenuViewController.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 14.05.2024.
//

import UIKit
import SnapKit

protocol menuCategory :AnyObject{
    func category(type :MovieCategory)
}



class MenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate  {
  weak  var delegate : menuCategory?
    var item = listCategory
    private let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(UINib(nibName: "CategoryCellTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryCellTableViewCell")
  
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        tableView.backgroundColor =  .color1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCellTableViewCell", for: indexPath) as! CategoryCellTableViewCell
        cell.title.text = item[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let type  = item[indexPath.row].type else { return }
    
        delegate?.category(type: type)
        self.dismiss(animated: true)
    }

    }
    




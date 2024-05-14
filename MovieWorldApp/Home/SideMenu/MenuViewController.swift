//
//  MenuViewController.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 14.05.2024.
//

import UIKit
enum MenuViewControllerError: Error {
    case initializationFailed
}

class MenuViewController: UIViewController, MenuViewControllerProtocol  {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init()  {
        super.init(nibName: nil, bundle: nil)
          
        }
    var sideMenuController :SideMenuViewController?
    
       var isMenuOpen = false
    var sideMenuWidth:CGFloat = 250
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configre()
    }
    func configre () {
        if let head = loadHomeHeader() {
            head.homeDelegate = self
            }
    }
    
    func loadHomeHeader() -> HomeHeader? {
           let nib = UINib(nibName: "HomeHeader", bundle: nil)
           return nib.instantiate(withOwner: nil, options: nil).first as? HomeHeader
       }
    func isMenuToggle() {
     print("yusuf")
    }
    
//
//    func openMenu () {
//        guard let sideMenuVC = sideMenuController.self else { return }
//        addChild(sideMenuVC)
//        sideMenuVC.view.frame = CGRect(x: -self.view.frame.width, y: 0, width: self.view.frame.width * 0.75, height: self.view.frame.height)
//        view.addSubview(sideMenuVC.view)
//        sideMenuVC.didMove(toParent: self)
//        UIView.animate(withDuration: 0.3) {
//             sideMenuVC.view.frame.origin.x = 0
//         }
//         
//         isMenuOpen = true
//     
//    }
//    func closeMenu() {
//           guard let sideMenuVC = sideMenuController.self else { return }
//           
//           UIView.animate(withDuration: 0.3, animations: {
//               sideMenuVC.view.frame.origin.x = -self.view.frame.width
//           }) { _ in
//               sideMenuVC.willMove(toParent: nil)
//               sideMenuVC.view.removeFromSuperview()
//               sideMenuVC.removeFromParent()
//           }
//           
//           isMenuOpen = false
//       }
}

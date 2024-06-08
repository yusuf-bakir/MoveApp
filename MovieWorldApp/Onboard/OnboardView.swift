//
//  OnboardView.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 13.03.2024.
//

import Foundation
import UIKit
import SnapKit
protocol OnBoardViewProtocol {
    func onTappedContiuneButton()
}

class OnboardView <T: OnboardMoveContoroller>:UIView{
    
    var delegate: OnBoardViewProtocol?
    let controler: T
    //MARK: -- backToView
    private lazy var  backToView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor.orange
        view.layer.shadowColor = UIColor.red.cgColor
        view.layer.shadowOpacity = 0.5 //Gölgelendirme opaklığı
        var transform = CATransform3DIdentity
        transform.m34 = -0.1 / 500 // Perspektif ekler
               transform = CATransform3DRotate(transform, CGFloat(Double.pi / 4), 1, 1, 0) // X ve Y eksenleri etrafında döndürür
        view.layer.transform = transform

        view.layer.shadowOffset = CGSize(width: 2, height: 2) // Gölgelendirme boyutu
        view.layer.shadowRadius = 5 // Gölgelendirme yarıçapı
        return view
    }()
    //MARK: // continue Tapped Buttom
    private lazy var buttom :UIButton = {
        let buttomMovie = UIButton()
        buttomMovie.setTitle("Continue", for: .normal)
        buttomMovie.setTitleColor(.white, for: .normal)
        buttomMovie.backgroundColor = .red
        buttomMovie.translatesAutoresizingMaskIntoConstraints = false
        buttomMovie.layer.cornerRadius = 16
        buttomMovie.addAction(action, for: .touchUpInside)
        
         
        return buttomMovie
    }()
    lazy var action : UIAction = UIAction {_ in
             self.delegate?.onTappedContiuneButton()
    }
    //MARK: // Image View
    private lazy var profileImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.camera
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    //MARK: //
    private lazy var profileSubTitle : UILabel = {
        let label = UILabel()
        label.text = "Filim Dünyasına Hoşgeldiniz. Filim ve dizileri HD kalitede izleyebilirsiniz."
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .center
//        label.font = UIFont(name: "Bold", size: 24)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
        
    }()
    private lazy var profileTitleLabel : UILabel = {
        let profileTitle = UILabel()
        profileTitle.text = "Welcom to Cinema+"
        profileTitle.textColor = .orange
        
        profileTitle.font = UIFont.boldSystemFont(ofSize: 35)
        return profileTitle
        
    }()
     init(_ controller: T) {
         self.controler = controller
         super.init(frame: .zero)
        
         backgroundColor = .color1
         addSubview(profileTitleLabel)
         addSubview(profileSubTitle )
         addSubview(profileImage)
         addSubview(buttom)
         addSubview(backToView)
          backToView.addSubview(profileImage)
       
        backToView.snp.makeConstraints({ make in
            let uiScreenHeight = UIScreen.main.bounds.height
            make.top.equalToSuperview().offset(uiScreenHeight * 0.1)
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(self.snp.height).multipliedBy(0.5)
            make.centerX.equalToSuperview()
        })
        profileImage.snp.makeConstraints({ make in
            let uiScreenHeight = UIScreen.main.bounds.height
            make.top.equalToSuperview().offset(uiScreenHeight * 0.1)//üst taraftan 0.2 pading boşluk bırakır
            
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(self.snp.height).multipliedBy(0.4)
       })
        profileTitleLabel.snp.makeConstraints({make in
            make.top.equalTo(profileImage.snp.bottom ).offset(20)
            make.centerX.equalToSuperview()
            
        })
        profileSubTitle.snp.makeConstraints({make in
            make.top.equalTo(profileTitleLabel.snp.bottom ).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
            
        })
        buttom.snp.makeConstraints({ make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.8)
            
            
            
            
        })
        
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

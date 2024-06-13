//
//  TopImageBottomLabelView.swift
//  LinkUp
//
//  Created by Hamza Malik on 02/06/2023.
//

import UIKit

class TopImageBottomLabelView : UIView {
    
//    private var image : String
//    private var text : String
    
    let backgroundView : UIView = {
       let obj = UIView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .white
//        obj.tintColor = UIColor(named: "darkPurple")
//        obj.contentVerticalAlignment = .fill
//        obj.contentHorizontalAlignment = .fill
//        obj.imageView?.contentMode = .scaleAspectFit
//        obj.imageEdgeInsets = UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 20)
        obj.layer.cornerRadius = 20
        obj.layer.shadowColor = UIColor.black.cgColor
        obj.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        obj.layer.shadowOpacity = 0.2
        obj.layer.shadowRadius = 2
        obj.layer.masksToBounds = false
        return obj
        
    }()
    
    let imagee : UIImageView = {
       let obj = UIImageView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .white
        obj.layer.cornerRadius = 15
        obj.tintColor = UIColor(named: "darkPurple")
//        obj.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        obj.contentMode = .scaleAspectFit
        obj.image = UIImage(systemName: "square.and.pencil")
        return obj
    }()
    
    private let bottomLabel : UILabel = {
       let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
//        obj.backgroundColor = .green
        obj.text = "NOTICE BOARD"
        obj.font = UIFont.boldSystemFont(ofSize: 12)
        return obj
    }()
    
    init(
        text : String, image : String
    ){
        self.imagee.image = UIImage(systemName: image)
        self.bottomLabel.text = text

        super.init(frame: .zero)

        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        
        addSubview(backgroundView)
        backgroundView.addSubview(imagee)
        addSubview(bottomLabel)
        
        NSLayoutConstraint.activate([
        
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 60),
            backgroundView.widthAnchor.constraint(equalToConstant: 60),
            
            imagee.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            imagee.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            imagee.widthAnchor.constraint(equalToConstant: 50),
            imagee.heightAnchor.constraint(equalToConstant: 50),
            
            bottomLabel.topAnchor.constraint(equalTo: backgroundView.bottomAnchor , constant: 10),
            bottomLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
        ])
    }
    
    
}

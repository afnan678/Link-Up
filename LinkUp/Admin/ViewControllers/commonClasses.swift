//
//  commonClass.swift
//  LinkUp
//
//  Created by Hamza Malik on 15/04/2023.
//

import Foundation
import UIKit

class CustomNavigationBarButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        setImage( UIImage(systemName: "chevron.backward"), for: .normal)
        setTitle(" Back", for: .normal)
        setTitleColor(UIColor.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
        sizeToFit()
        addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    }
    
    @objc func backButtonPressed() {
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
          print("pressed")
            navigationController.popViewController(animated: true)
        }
    }
}

//
//  AttendenceDateCustomCell.swift
//  LinkUp
//
//  Created by Hamza Malik on 01/06/2023.
//

import Foundation
import UIKit

class AttendenceDateCustomCell: UICollectionViewCell {
    
    static let identifier = "AttendenceDateCell"
    let dateLabel: UILabel

    override init(frame: CGRect) {
        
        let str = NSAttributedString(string: "Hello, World", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.strokeColor : UIColor.black,
            NSAttributedString.Key.strokeWidth : -2,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 60.0)
               ])
        
        dateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        dateLabel.textAlignment = .center
        dateLabel.attributedText = str
        dateLabel.font = UIFont.systemFont(ofSize: 16)

        super.init(frame: frame)

        contentView.addSubview(dateLabel)
        

        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  LableDesign.swift
//  LinkUp
//
//  Created by Afnan Ahmed on 04/08/2023.
//

import Foundation
import UIKit

// this class is used for the lable designging

class BorderedLabel: UILabel {
    let topBorderLayer = CALayer()
    let bottomBorderLayer = CALayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBorders()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupBorders()
    }

    private func setupBorders() {
        // Set up the top border
        topBorderLayer.backgroundColor = UIColor.black.cgColor
        layer.addSublayer(topBorderLayer)

        // Set up the bottom border
        bottomBorderLayer.backgroundColor = UIColor.black.cgColor
        layer.addSublayer(bottomBorderLayer)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        // Update the position and size of the borders
        let lineWidth: CGFloat = 1.5
        topBorderLayer.frame = CGRect(x: 0, y: 0, width: rect.size.width, height: lineWidth)
        bottomBorderLayer.frame = CGRect(x: 0, y: rect.size.height - lineWidth, width: rect.size.width, height: lineWidth)
    }
}

//
//  QuizMarksTableViewCell.swift
//  LinkUp
//
//  Created by Hamza Malik on 12/06/2023.
//

import Foundation
import UIKit

class QuizMarksTableViewCell: UITableViewCell {
    
    static let identifier = "QuizMarksTableViewCell"
    
    
    var LablesBackgrounds_StackView : UIStackView = {
        let obj = UIStackView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.axis = .horizontal
        obj.distribution = .fillEqually
//        obj.alignment = .fill
        obj.backgroundColor = .white
//        obj.spacing = 130
        return obj
    }()
    
    private let Quiz_lbl: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Quiz 1"
        return lbl
    }()
    
    private let Subject_lbl: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Math"
        return lbl
    }()
    private let ObtainMarks_lbl: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "8"
        return lbl
    }()
    private let TotalMarks_lbl: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "10"
        return lbl
    }()
    
    
    private let Date_lbl: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.font = .systemFont(ofSize: 12)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Marks 2"
        return lbl
    }()
    
    public func configure(text: String, subject: String, obtainmarks: String, TotalMarks: String, date: String )
    {
        Quiz_lbl.text = text
        Subject_lbl.text = subject
        ObtainMarks_lbl.text = obtainmarks
        TotalMarks_lbl.text = TotalMarks
        Date_lbl.text = date
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        Quiz_lbl.text = nil
        Subject_lbl.text = nil
        ObtainMarks_lbl.text = nil
        TotalMarks_lbl.text = nil
        Date_lbl.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(LablesBackgrounds_StackView)
        LablesBackgrounds_StackView.addArrangedSubview(Quiz_lbl)
        LablesBackgrounds_StackView.addArrangedSubview(Subject_lbl)
//        LablesBackgrounds_StackView.addArrangedSubview(ObtainMarks_lbl)
        LablesBackgrounds_StackView.addArrangedSubview(TotalMarks_lbl)
        LablesBackgrounds_StackView.addArrangedSubview(Date_lbl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        LablesBackgrounds_StackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        LablesBackgrounds_StackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        LablesBackgrounds_StackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        LablesBackgrounds_StackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
//        Quiz_lbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        

    }
    
    
    
}

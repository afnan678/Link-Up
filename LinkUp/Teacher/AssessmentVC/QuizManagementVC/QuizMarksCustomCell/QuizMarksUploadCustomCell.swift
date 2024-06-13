//
//  QuizMarksUploadCustomCell.swift
//  LinkUp
//
//  Created by Hamza Malik on 12/06/2023.
//

import Foundation
import UIKit
class QuizMarksUploadCustomCell: UITableViewCell {
    
    static let identifier = "QuizMarksUploadCustomCell"
    
    
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
    
    private let StudentRollNo_Label: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Quiz 1"
        return lbl
    }()
    
    private let StudentName_Label: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Math"
        return lbl
    }()
    
    private let TotalMarks_label: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "10"
        return lbl
    }()
    
    private let ObtainMarks_TextField: UITextField = {
        let text = UITextField(frame: CGRect(x: 0, y: 0, width: 200.00, height: 40.00))
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .white
        text.backgroundColor = .white
        text.textColor = .black
        text.textAlignment = .center
        text.attributedPlaceholder = NSAttributedString(
            string: "0",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        
        let botlayer = CALayer()
        botlayer.frame = CGRect(x: 0, y: text.frame.height, width: text.frame.width-115, height: 1)
        botlayer.backgroundColor = UIColor.black.cgColor
        text.layer.addSublayer(botlayer)
        return text
        
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
        StudentRollNo_Label.text = text
        StudentName_Label.text = subject
        //        ObtainMarks_lbl.text = obtainmarks
        TotalMarks_label.text = TotalMarks
        Date_lbl.text = date
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        StudentRollNo_Label.text = nil
        StudentName_Label.text = nil
        ObtainMarks_TextField.text = nil
        TotalMarks_label.text = nil
        Date_lbl.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(LablesBackgrounds_StackView)
        LablesBackgrounds_StackView.addArrangedSubview(StudentRollNo_Label)
        LablesBackgrounds_StackView.addArrangedSubview(StudentName_Label)
        LablesBackgrounds_StackView.addArrangedSubview(TotalMarks_label)
        LablesBackgrounds_StackView.addArrangedSubview(ObtainMarks_TextField)
        //        LablesBackgrounds_StackView.addArrangedSubview(Date_lbl)
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

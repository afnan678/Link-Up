//
//  ClassRoomStudentsCustomCell.swift
//  LinkUp
//
//  Created by Hamza Malik on 11/06/2023.
//

import Foundation
import UIKit

class ClassRoomStudentsCustomCell : UITableViewCell {
    
    static var identifier = "ClassRoomStudentsCustomCell"
    
    var cellBackgroundView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20
        return view
      }()
    
    var studentStackView : UIStackView = {
       let obj = UIStackView()
        obj.axis = .horizontal
        obj.distribution = .fillEqually
        obj.layer.cornerRadius  = 10
//        obj.backgroundColor = UIColor(named: "lightPurple")
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    var studentidLabel : UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.text = "Roll No"
        obj.font = .boldSystemFont(ofSize: 20)
        obj.textColor = .black
        obj.textAlignment = .center
        return obj
    }()
    var studentNameLabel : UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.text = "Name"
        obj.font = .boldSystemFont(ofSize: 20)
        obj.textColor = .black
        obj.textAlignment = .center
        return obj
    }()
    var studentFatherNameLabel : UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.text = "Hamza Rasheed"
        obj.font = .boldSystemFont(ofSize: 20)
        obj.textColor = .black
        obj.textAlignment = .center
        return obj
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        contentView.backgroundColor = UIColor(named: "lightPurple")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(){
        contentView.addSubview(cellBackgroundView)
        
        cellBackgroundView.addSubview(studentStackView)
        
        studentStackView.addArrangedSubview(studentidLabel)
        studentStackView.addArrangedSubview(studentNameLabel)
        studentStackView.addArrangedSubview(studentFatherNameLabel)
        
        NSLayoutConstraint.activate([
            cellBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 10),
            cellBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 5),
            cellBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -10),
            cellBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -5),
            
            studentStackView.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor),
            studentStackView.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor),
            studentStackView.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor),
            studentStackView.bottomAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor),

        ])
    }
    func setStudentDetail( student : StudentDataModelForTeacher){
        studentidLabel.text = String(student.rollNo)
        studentNameLabel.text = student.studentName
        studentFatherNameLabel.text = student.fatherName
    }
    
}

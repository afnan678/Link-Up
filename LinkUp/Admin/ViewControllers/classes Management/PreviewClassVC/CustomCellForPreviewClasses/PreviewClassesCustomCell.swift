//
//  PreviewClassesCustomCell.swift
//  LinkUp
//
//  Created by Hamza Malik on 08/06/2023.
//

import Foundation
import UIKit

class PreviewClassesCustomCell : UITableViewCell {
    
    static var identifier = "PreviewClassesCustomCell"
    
    var cellContainerView : UIView = {
        let obj = UIView()
        obj.backgroundColor = UIColor(named: "lightPurple")
        obj.layer.cornerRadius = 10
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    var classNameAndTeacherNameStackView : UIStackView = {
        let obj = UIStackView()
        obj.axis = .horizontal
        obj.distribution = .fillEqually
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .systemBackground
        obj.layer.cornerRadius = 10
        return obj
    }()
    var classesNameLabel : UILabel = {
       
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Class Name"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        lbl.textAlignment = .center
        return lbl
    }()
    var teacherNameLabel : UILabel = {
       
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Teacher Assigned"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        lbl.textAlignment = .center
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureUI(){
        contentView.addSubview(cellContainerView)
        cellContainerView.addSubview(classNameAndTeacherNameStackView)
        
        classNameAndTeacherNameStackView.addArrangedSubview(classesNameLabel)
        classNameAndTeacherNameStackView.addArrangedSubview(teacherNameLabel)
        
        NSLayoutConstraint.activate([
            cellContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            classNameAndTeacherNameStackView.topAnchor.constraint(equalTo: cellContainerView.topAnchor , constant: 5),
            classNameAndTeacherNameStackView.leadingAnchor.constraint(equalTo: cellContainerView.leadingAnchor ,constant: 5),
            classNameAndTeacherNameStackView.trailingAnchor.constraint(equalTo: cellContainerView.trailingAnchor , constant: -5),
            classNameAndTeacherNameStackView.bottomAnchor.constraint(equalTo: cellContainerView.bottomAnchor , constant: -5),
        ])
    }
    
    func setRecord(obj : ClassDataModel){
        classesNameLabel.text = obj.className
        teacherNameLabel.text = String(obj.assignedTeacher)
    }
}

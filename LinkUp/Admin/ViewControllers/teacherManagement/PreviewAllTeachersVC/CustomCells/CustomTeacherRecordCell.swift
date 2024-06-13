//
//  CustomTeacherRecordCell.swift
//  LinkUp
//
//  Created by Hamza Malik on 18/05/2023.
//

import Foundation
import UIKit
class CustomTeacherRecordCell : UITableViewCell {
     static let identifier = "CustomTeacherRecordCell"
    
    private let backGroundView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: "lightPurple")
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let teacherImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.circle")
        img.backgroundColor = .red
        img.layer.cornerRadius = 45
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let teacherRecordStackView : UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let teacherNameStackView : UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
//        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Name : "
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var nameLabelValue : UILabel = {
        let label = UILabel()
        label.text = "Hamza"
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let teacherEmailStackView : UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
//        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let qualificationLabel : UILabel = {
        let label = UILabel()
        label.text = "Qualification : "
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var qualificationLabelValue : UILabel = {
        let label = UILabel()
        label.text = ""
//        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let teacherPhoneNoStackView : UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
//        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let phoneNoLabel : UILabel = {
        let label = UILabel()
        label.text = "Phone No : "
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneNoLabelValue : UILabel = {
        let label = UILabel()
        label.text = "03404004660"
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let assignClassStackView : UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
//        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let assignClassLabel : UILabel = {
        let label = UILabel()
        label.text = "Assigned Class : "
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let assignClassLabelValue : UILabel = {
        let label = UILabel()
        label.text = "No"
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureUI(){
            print("configureUI")
        contentView.addSubview(backGroundView)
        backGroundView.addSubview(teacherImage)
        backGroundView.addSubview(teacherRecordStackView)
        
        teacherRecordStackView.addArrangedSubview(teacherNameStackView)
        teacherRecordStackView.addArrangedSubview(teacherEmailStackView)
        teacherRecordStackView.addArrangedSubview(teacherPhoneNoStackView)
        teacherRecordStackView.addArrangedSubview(assignClassStackView)
        
        teacherNameStackView.addArrangedSubview(nameLabel)
        teacherNameStackView.addArrangedSubview(nameLabelValue)

        teacherEmailStackView.addArrangedSubview(qualificationLabel)
        teacherEmailStackView.addArrangedSubview(qualificationLabelValue)
        teacherPhoneNoStackView.addArrangedSubview(phoneNoLabel)
        teacherPhoneNoStackView.addArrangedSubview(phoneNoLabelValue)
        assignClassStackView.addArrangedSubview(assignClassLabel)
        assignClassStackView.addArrangedSubview(assignClassLabelValue)
        
        NSLayoutConstraint.activate([
            backGroundView.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 10),
            backGroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            backGroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -20),
            backGroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -10),

            teacherImage.topAnchor.constraint(equalTo: backGroundView.topAnchor , constant: 10),
            teacherImage.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor , constant: 10),
            teacherImage.widthAnchor.constraint(equalToConstant: 90),
            teacherImage.heightAnchor.constraint(equalToConstant: 90),
            
            teacherRecordStackView.topAnchor.constraint(equalTo: backGroundView.topAnchor , constant: 10),
            teacherRecordStackView.leadingAnchor.constraint(equalTo: teacherImage.trailingAnchor , constant: 15),
            teacherRecordStackView.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor , constant: 10),
            teacherRecordStackView.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor , constant: -10),
            
        ])
    }
    func setTeacherDetails (teacherImage image : UIImage , teacherData : TeacherDataModelForAdmin ){
        teacherImage.image = image
        nameLabelValue.text = teacherData.name
        qualificationLabelValue.text = teacherData.qualification
        phoneNoLabelValue.text = teacherData.phNo
        assignClassLabelValue.text = teacherData.assignedClass
    }
}

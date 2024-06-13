//
//  AssignTeacherCustomCell.swift
//  LinkUp
//
//  Created by Hamza Malik on 09/06/2023.
//

import Foundation
import UIKit
class AssignTeacherCustomCell : UITableViewCell {
    static let identifier = "AssignTeacherCustomCell"
    
    private let backGroundView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "lightPurple")
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let teacherRecordStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let teacherIdStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let idLabel : UILabel = {
        let label = UILabel()
        label.text = "Teacher Id"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var idLabelValue : UILabel = {
        let label = UILabel()
        label.text = "02"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private let teacherNameStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Teacher Name"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var nameLabelValue : UILabel = {
        let label = UILabel()
        label.text = "Hamza"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let qualificationStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let qualificationLabel : UILabel = {
        let label = UILabel()
        label.text = "Qualification"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var qualificationLabelValue : UILabel = {
        let label = UILabel()
        label.text = "Bs IT"
        //        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 17)
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
        label.text = "Assigned Class"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let assignClassLabelValue : UILabel = {
        let label = UILabel()
        label.text = "Not Assigned"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let assignTeacherButtonBackgroundView : UIView = {
        let view = UIView()
        //        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let assignTeacherButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Select Teacher", for: .normal)
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 10
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
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
        backGroundView.addSubview(teacherRecordStackView)

        teacherRecordStackView.addArrangedSubview(teacherIdStackView)
        teacherRecordStackView.addArrangedSubview(teacherNameStackView)
        teacherRecordStackView.addArrangedSubview(qualificationStackView)
        teacherRecordStackView.addArrangedSubview(assignClassStackView)
        teacherRecordStackView.addArrangedSubview(assignTeacherButtonBackgroundView)
        
        assignTeacherButtonBackgroundView.addSubview(assignTeacherButton)

        teacherIdStackView.addArrangedSubview(idLabel)
        teacherIdStackView.addArrangedSubview(idLabelValue)

        teacherNameStackView.addArrangedSubview(nameLabel)
        teacherNameStackView.addArrangedSubview(nameLabelValue)
        

        qualificationStackView.addArrangedSubview(qualificationLabel)
        qualificationStackView.addArrangedSubview(qualificationLabelValue)
        
        assignClassStackView.addArrangedSubview(assignClassLabel)
        assignClassStackView.addArrangedSubview(assignClassLabelValue)
        
        NSLayoutConstraint.activate([
            backGroundView.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 10),
            backGroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            backGroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -20),
            backGroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -10),
            

            
            teacherRecordStackView.topAnchor.constraint(equalTo: backGroundView.topAnchor , constant: 10),
            teacherRecordStackView.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor , constant: 10),
            teacherRecordStackView.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor , constant: 10),
            teacherRecordStackView.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor , constant: -10),
            //            assignTeacherButton.widthAnchor.constraint(equalTo: teacherRecordStackView.widthAnchor, multiplier: 0.7),
            assignTeacherButton.leadingAnchor.constraint(equalTo: assignTeacherButtonBackgroundView.leadingAnchor , constant: 80),
            assignTeacherButton.trailingAnchor.constraint(equalTo: assignTeacherButtonBackgroundView.trailingAnchor , constant: -80),
            assignTeacherButton.heightAnchor.constraint(equalTo: assignTeacherButtonBackgroundView.heightAnchor),
        ])
    }
    func setTeacherDetails (teacherData : TeacherDataModelForAdmin){
        idLabelValue.text = String(teacherData.teacherId)
        nameLabelValue.text = teacherData.name
        qualificationLabelValue.text = teacherData.qualification
        assignClassLabelValue.text = teacherData.assignedClass
    }
}

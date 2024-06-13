//
//  TeacherRecordDetailViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 19/05/2023.
//

import Foundation
import UIKit

class TeacherRecordDetailViewController : UIViewController {
    
    private let teacherImage : UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 75
        img.backgroundColor = .red
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        return img
    }()
    private let teacherRecordStackView : UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.distribution = .fillEqually
//        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let teacherNameStackView : UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 30
        view.distribution = .fillEqually
        
//        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let teacherNameLabel : UILabel = {
       let lbl = UILabel()
        lbl.text = "Name : "
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    private var teacherNameValueLabel : UILabel = {
       let lbl = UILabel()
        lbl.text = "Hamza "
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let teacherCNICStackView : UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
//        view.backgroundColor = .orange
        view.spacing = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let teacherCNICLabel : UILabel = {
       let lbl = UILabel()
        lbl.text = "CNIC : "
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    private var teacherCNICValueLabel : UILabel = {
       let lbl = UILabel()
        lbl.text = "12345678 "
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let teacherQualificationStackView : UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
//        view.backgroundColor = .orange
        view.spacing = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let teacherQualificationLabel : UILabel = {
       let lbl = UILabel()
        lbl.text = "Qualification : "
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    private let teacherQualificationValueLabel : UILabel = {
       let lbl = UILabel()
        lbl.text = "Bs(IT) "
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    private let teacherEmailStackView : UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
//        view.backgroundColor = .orange
        view.spacing = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let teacherEmailLabel : UILabel = {
       let lbl = UILabel()
        lbl.text = "Email : "
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    private let teacherEmailValueLabel : UILabel = {
       let lbl = UILabel()
        lbl.text = "Hamza@gmail.com "
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let teacherPhoneNoStackView : UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
//        view.backgroundColor = .orange
        view.spacing = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let teacherPhoneNoLabel : UILabel = {
       let lbl = UILabel()
        lbl.text = "Phone No : "
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    private let teacherPhoneNoValueLabel : UILabel = {
       let lbl = UILabel()
        lbl.text = "03404004660 "
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemBackground
        title = "Teacher Complete Record"
        configureUI()
    }
    
    
    private func configureUI(){
        
        view.addSubview(teacherImage)
        view.addSubview(teacherRecordStackView)
        
        teacherRecordStackView.addArrangedSubview(teacherNameStackView)
        teacherRecordStackView.addArrangedSubview(teacherCNICStackView)
        teacherRecordStackView.addArrangedSubview(teacherQualificationStackView)
        teacherRecordStackView.addArrangedSubview(teacherEmailStackView)
        teacherRecordStackView.addArrangedSubview(teacherPhoneNoStackView)
        
        teacherNameStackView.addArrangedSubview(teacherNameLabel)
        teacherNameStackView.addArrangedSubview(teacherNameValueLabel)

        teacherCNICStackView.addArrangedSubview(teacherCNICLabel)
        teacherCNICStackView.addArrangedSubview(teacherCNICValueLabel)

        teacherQualificationStackView.addArrangedSubview(teacherQualificationLabel)
        teacherQualificationStackView.addArrangedSubview(teacherQualificationValueLabel)

        teacherEmailStackView.addArrangedSubview(teacherEmailLabel)
        teacherEmailStackView.addArrangedSubview(teacherEmailValueLabel)

        teacherPhoneNoStackView.addArrangedSubview(teacherPhoneNoLabel)
        teacherPhoneNoStackView.addArrangedSubview(teacherPhoneNoValueLabel)
        
        
        NSLayoutConstraint.activate([
        
            teacherImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 15),
            teacherImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            teacherImage.heightAnchor.constraint(equalToConstant: 150),
            teacherImage.widthAnchor.constraint(equalToConstant: 150),
            
            teacherRecordStackView.topAnchor.constraint(equalTo: teacherImage.bottomAnchor , constant: 15),
            teacherRecordStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 60),
            teacherRecordStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -20),
            teacherRecordStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
        ])
    }
    func setTeacherDetail(data : TeacherDataModelForAdmin , image : UIImage){
        teacherImage.image = image
        teacherNameValueLabel.text = data.name
        teacherCNICValueLabel.text = data.cNIC
        teacherQualificationValueLabel.text = data.qualification
        teacherEmailValueLabel.text = data.email
        teacherPhoneNoValueLabel.text = data.phNo
    }
    
}

//
//  TeacherProfileButtonViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 10/06/2023.
//

import Foundation
import UIKit

class TeacherProfileViewController : UIViewController {
    
//    var registerStudentContainerView : UIView = {
//       let view = UIView()
//        view.backgroundColor = UIColor(named: "darkPurple")
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    let topView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "darkPurple")
        return view
    }()
    
    func title_bar ()
    {
        title = "Teacher Information"
        view.backgroundColor = .white
        UINavigationBar.appearance().backgroundColor = UIColor(named: "darkPurple")
        UINavigationBar.appearance().barTintColor = UIColor(named: "darkPurple")  // solid color
        UIBarButtonItem.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        UITabBar.appearance().barTintColor = .white
    }
    
    let bottomView : UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

//    var profile_lable : UILabel = {
//
//        var lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = ""
//        lbl.textColor = .white
//        lbl.font = UIFont.boldSystemFont(ofSize: 25.0)
//        return lbl
//    }()
    var Student_Profile_Name_lable : UILabel = {
       
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = TeacherDataModel.shared.name
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        lbl.layer.shadowColor = UIColor.black.cgColor
        lbl.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        lbl.layer.shadowOpacity = 0.5
        lbl.layer.shadowRadius = 2
        lbl.layer.masksToBounds = false
        return lbl
    }()
    
    var Class_Name_Lable : UILabel = {
       
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Assigned Class : \(TeacherDataModel.shared.assignedClass)"
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 15.0)
        lbl.layer.shadowColor = UIColor.black.cgColor
        lbl.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        lbl.layer.shadowOpacity = 0.2
        lbl.layer.shadowRadius = 1
        lbl.layer.masksToBounds = false
        return lbl
    }()
    
    //image
    var image : UIImageView = {
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 130, height: 130))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.shadowColor = UIColor.black.cgColor
        img.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        img.layer.shadowOpacity = 1
        img.layer.shadowRadius = 2
        img.layer.masksToBounds = false
        img.layer.cornerRadius = img.frame.size.width / 2
        img.layer.cornerRadius = img.frame.size.height / 2
        img.layer.borderWidth = 0.5
        img.layer.borderColor = UIColor.white.cgColor
        img.image = TeacherDataModel.shared.image!
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    private let teacherProfileRecordStackView : UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private let teacherIdLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.text = "ID"
        return lbl
    }()
//    private let studentProfileLeadingSpacerView : UIView = {
//       let view = UIView()
//        view.backgroundColor = .systemBackground
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    private let teacherIdLabelValue: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.text = String(TeacherDataModel.shared.teacherID)
        return lbl
    }()
    
    private let teacherIdStackView : UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = .systemBackground
        stack.distribution = .fillEqually
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let teacherCNICLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.text = "CNIC"
        return lbl
    }()

    private let teacherCNICLabelValue: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 15)
        lbl.text = TeacherDataModel.shared.cNIC
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let teacherCNICStackView : UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = .systemBackground
        stack.distribution = .fillEqually
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let teacherEmailLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.text = "Email"
        return lbl
    }()

    private let teacherEmailLabelValue: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 15)
        lbl.text = TeacherDataModel.shared.email
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let teacherEmailStackView : UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = .systemBackground
        stack.distribution = .fillEqually
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let teacherContactNoLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.text = "Contact No"
        return lbl
    }()

    private let teacherContactNoLabelValue: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.text = TeacherDataModel.shared.phoneNo
        return lbl
    }()
    
    private let teacherContactNoStackView : UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = .systemBackground
        stack.distribution = .fillEqually
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title_bar()
        ConfigureUI()
        
    }


    
    func ConfigureUI ()
    {
        view.addSubview(topView)
        topView.addSubview(image)
        topView.addSubview(Student_Profile_Name_lable)
        topView.addSubview(Class_Name_Lable)
        view.addSubview(bottomView)

        bottomView.addSubview(teacherProfileRecordStackView)

        teacherProfileRecordStackView.addArrangedSubview(teacherIdStackView)
        teacherProfileRecordStackView.addArrangedSubview(teacherCNICStackView)
        teacherProfileRecordStackView.addArrangedSubview(teacherEmailStackView)
        teacherProfileRecordStackView.addArrangedSubview(teacherContactNoStackView)
        
        teacherIdStackView.addArrangedSubview(teacherIdLabel)
        teacherIdStackView.addArrangedSubview(teacherIdLabelValue)
        
        teacherCNICStackView.addArrangedSubview(teacherCNICLabel)
        teacherCNICStackView.addArrangedSubview(teacherCNICLabelValue)
        
        teacherEmailStackView.addArrangedSubview(teacherEmailLabel)
        teacherEmailStackView.addArrangedSubview(teacherEmailLabelValue)

        teacherContactNoStackView.addArrangedSubview(teacherContactNoLabel)
        teacherContactNoStackView.addArrangedSubview(teacherContactNoLabelValue)
        
        NSLayoutConstraint.activate([
            
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
            
            Student_Profile_Name_lable.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            Student_Profile_Name_lable.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            Student_Profile_Name_lable.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03),
            
            Class_Name_Lable.topAnchor.constraint(equalTo: Student_Profile_Name_lable.bottomAnchor),
            Class_Name_Lable.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            Class_Name_Lable.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.03),
            
            image.topAnchor.constraint(equalTo: topView.topAnchor , constant: 20),
            image.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 130),
            image.widthAnchor.constraint(equalToConstant: 130),
            
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor ),
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -10),
            
            teacherProfileRecordStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            teacherProfileRecordStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            teacherProfileRecordStackView.topAnchor.constraint(equalTo: topView.bottomAnchor ),
            teacherProfileRecordStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -10),
        ])
    }
}

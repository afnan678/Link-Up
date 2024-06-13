//
//  ParentProfileViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 31/05/2023.
//

import Foundation
import UIKit

class ParentProfileViewController : UIViewController {
     
    
    let topView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "darkPurple")
        return view
    }()
    
    func title_bar ()
    {
        title = "Student Information"
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

    var profile_lable : UILabel = {
       
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 25.0)
        return lbl
    }()
    var Student_Profile_Name_lable : UILabel = {
       
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ParentRecordModel.shared.studentName
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
        lbl.text = "Class : \(ParentRecordModel.shared.studentClass)"
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
        img.image = ParentRecordModel.shared.studentImage!
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    private let studentProfileRecordStackView : UIStackView = {
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
    
    private let studentRollNoLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.text = "Roll No"
        return lbl
    }()
    private let studentProfileLeadingSpacerView : UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let studentRollNoLabelValue: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.text = String(ParentRecordModel.shared.studentRollNo)
        return lbl
    }()
    
    private let studentRollNoStackView : UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = .systemBackground
        stack.distribution = .fillEqually
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let studentDOBLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.text = "DOB"
        return lbl
    }()

    private let studentDOBLabelValue: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.text = ParentRecordModel.shared.studentDOB
        return lbl
    }()
    
    private let studentDOBStackView : UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = .systemBackground
        stack.distribution = .fillEqually
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let studentFatherNameLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.text = "Father Name"
        return lbl
    }()

    private let studentFatherNameLabelValue: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.text = ParentRecordModel.shared.fatherName
        return lbl
    }()
    
    private let studentFatherNameStackView : UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = .systemBackground
        stack.distribution = .fillEqually
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let studentEmergencyContactNoLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.text = "Emergency Contact"
        return lbl
    }()

    private let studentEmergencyContactNoLabelValue: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.text = ParentRecordModel.shared.fatherPhoneNo
        return lbl
    }()
    
    private let studentEmergencyContactNoStackView : UIStackView = {
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

        bottomView.addSubview(studentProfileRecordStackView)

        studentProfileRecordStackView.addArrangedSubview(studentRollNoStackView)
        studentProfileRecordStackView.addArrangedSubview(studentDOBStackView)
        studentProfileRecordStackView.addArrangedSubview(studentFatherNameStackView)
        studentProfileRecordStackView.addArrangedSubview(studentEmergencyContactNoStackView)
        
        studentRollNoStackView.addArrangedSubview(studentRollNoLabel)
        studentRollNoStackView.addArrangedSubview(studentRollNoLabelValue)
        
        studentDOBStackView.addArrangedSubview(studentDOBLabel)
        studentDOBStackView.addArrangedSubview(studentDOBLabelValue)
        
        studentFatherNameStackView.addArrangedSubview(studentFatherNameLabel)
        studentFatherNameStackView.addArrangedSubview(studentFatherNameLabelValue)

        studentEmergencyContactNoStackView.addArrangedSubview(studentEmergencyContactNoLabel)
        studentEmergencyContactNoStackView.addArrangedSubview(studentEmergencyContactNoLabelValue)
        
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
            
            studentProfileRecordStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            studentProfileRecordStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            studentProfileRecordStackView.topAnchor.constraint(equalTo: topView.bottomAnchor ),
            studentProfileRecordStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -10),
        ])
    }
}


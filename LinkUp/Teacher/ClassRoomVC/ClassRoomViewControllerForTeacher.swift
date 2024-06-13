//
//  ClassRoomViewControllerForTeacher.swift
//  LinkUp
//
//  Created by Hamza Malik on 10/06/2023.
//

import Foundation
import UIKit

class ClassRoomViewControllerForTeacher : UIViewController {
    
    var classRoomContainerView : UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var classNameAndValueStackView : UIStackView = {
       let obj = UIStackView()
        obj.axis = .horizontal
        obj.distribution = .fillEqually
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    var classNameLabel : UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.text = "Assigned Class"
        obj.font = .boldSystemFont(ofSize: 20)
        obj.textColor = UIColor(named: "darkPurple")
        obj.textAlignment = .center
//        obj.font = .boldSystemFont(ofSize: 20)
        return obj
    }()
    var classNameLabelValue : UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
//        obj.text = TeacherDataModel.shared.assignedClass
        obj.text = "Two"
        obj.font = .boldSystemFont(ofSize: 20)
        obj.textColor = UIColor(named: "darkPurple")
        obj.textAlignment = .center
//        obj.font = .boldSystemFont(ofSize: 20)
        return obj
    }()
//    var subjectNameLabel : UILabel = {
//        let obj = UILabel()
//        obj.translatesAutoresizingMaskIntoConstraints = false
//        obj.text = "Subjects"
//        obj.font = .boldSystemFont(ofSize: 20)
//        obj.textColor = UIColor(named: "darkPurple")
//        obj.textAlignment = .center
////        obj.font = .boldSystemFont(ofSize: 20)
//        return obj
//    }()
//    var subjectsNameLabelValue : UILabel = {
//        let obj = UILabel()
//        obj.translatesAutoresizingMaskIntoConstraints = false
////        obj.text = TeacherDataModel.shared.assignedClass
//        obj.text = "Two"
//        obj.font = .boldSystemFont(ofSize: 20)
//        obj.textColor = UIColor(named: "darkPurple")
//        obj.textAlignment = .center
////        obj.font = .boldSystemFont(ofSize: 20)
//        return obj
//    }()
    
    var studentsLabel : UILabel = {
       let obj = UILabel()
        obj.text = "Students"
        obj.font = .boldSystemFont(ofSize: 35)
        obj.textAlignment = .left
        obj.textColor = UIColor(named: "darkPurple")
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    var studentListStackViewBackgroundView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: "lightPurple")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var studentListHeaderStackView : UIStackView = {
       let obj = UIStackView()
        obj.axis = .horizontal
        obj.distribution = .fillEqually
//        obj.layer.cornerRadius  = 10
        obj.backgroundColor = UIColor(named: "lightPurple")
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
        obj.text = "Father Name"
        obj.font = .boldSystemFont(ofSize: 20)
        obj.textColor = .black
        obj.textAlignment = .center
        return obj
    }()
    var studentListTableView : UITableView = {
       let obj = UITableView()
//        obj.backgroundColor = UIColor(named: "lightPurple")
        obj.register(ClassRoomStudentsCustomCell.self, forCellReuseIdentifier: ClassRoomStudentsCustomCell.identifier)
//        obj.layer.cornerRadius = 10
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    private var activityIndicator: UIActivityIndicatorView = {
       var indicator = UIActivityIndicatorView()
        indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .gray
        return indicator
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ClassRoom"
//        configureUI()
        print(StudentDataModelForTeacher.studentArray.count)
        loadstudentsRecord()
//        studentListTableView.delegate = self
//        studentListTableView.dataSource = self

    }
    
    func loadstudentsRecord () {
        
        view.backgroundColor = UIColor(named: "darkPurple")
        view.addSubview(classRoomContainerView)
        classRoomContainerView.addSubview(classNameAndValueStackView)
        
        classNameAndValueStackView.addArrangedSubview(classNameLabel)
        classNameAndValueStackView.addArrangedSubview(classNameLabelValue)
        classRoomContainerView.addSubview(studentsLabel)
        classRoomContainerView.addSubview(studentListStackViewBackgroundView)
        studentListStackViewBackgroundView.addSubview(studentListHeaderStackView)
        
        studentListHeaderStackView.addArrangedSubview(studentidLabel)
        studentListHeaderStackView.addArrangedSubview(studentNameLabel)
        studentListHeaderStackView.addArrangedSubview(studentFatherNameLabel)
        
        classRoomContainerView.addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            
            activityIndicator.centerXAnchor.constraint(equalTo: classRoomContainerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: classRoomContainerView.centerYAnchor),
            
            classRoomContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            classRoomContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            classRoomContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            classRoomContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            classNameAndValueStackView.topAnchor.constraint(equalTo: classRoomContainerView.topAnchor),
            classNameAndValueStackView.leadingAnchor.constraint(equalTo: classRoomContainerView.leadingAnchor),
            classNameAndValueStackView.trailingAnchor.constraint(equalTo: classRoomContainerView.trailingAnchor),
            classNameAndValueStackView.heightAnchor.constraint(equalTo: classRoomContainerView.heightAnchor , multiplier: 0.1),
            studentsLabel.topAnchor.constraint(equalTo: classNameAndValueStackView.bottomAnchor),
            studentsLabel.leadingAnchor.constraint(equalTo: classRoomContainerView.leadingAnchor , constant: 10),
            
            studentListStackViewBackgroundView.topAnchor.constraint(equalTo: studentsLabel.bottomAnchor , constant: 10),
            studentListStackViewBackgroundView.leadingAnchor.constraint(equalTo: classRoomContainerView.leadingAnchor , constant: 10),
            studentListStackViewBackgroundView.trailingAnchor.constraint(equalTo: classRoomContainerView.trailingAnchor , constant: -10),
            studentListStackViewBackgroundView.heightAnchor.constraint(equalTo: classRoomContainerView.heightAnchor , multiplier: 0.05),
            
            studentListHeaderStackView.topAnchor.constraint(equalTo: studentListStackViewBackgroundView.topAnchor),
            studentListHeaderStackView.leadingAnchor.constraint(equalTo: studentListStackViewBackgroundView.leadingAnchor , constant: 10),
            studentListHeaderStackView.trailingAnchor.constraint(equalTo: studentListStackViewBackgroundView.trailingAnchor , constant: -10),
            studentListHeaderStackView.heightAnchor.constraint(equalTo: studentListStackViewBackgroundView.heightAnchor , multiplier: 1),
            
//            studentListTableView.topAnchor.constraint(equalTo: studentListStackViewBackgroundView.bottomAnchor ),
//            studentListTableView.leadingAnchor.constraint(equalTo: classRoomContainerView.leadingAnchor , constant: 10),
//            studentListTableView.trailingAnchor.constraint(equalTo: classRoomContainerView.trailingAnchor , constant: -10),
//            studentListTableView.bottomAnchor.constraint(equalTo: classRoomContainerView.safeAreaLayoutGuide.bottomAnchor , constant: -20),
        ])
        
        activityIndicator.startAnimating()
        FirestoreManager.shared.loadAllStudentsRecordForTeacher(classId: TeacherDataModel.shared.assignedClass) { success in
            if success {
                self.activityIndicator.stopAnimating()
//                self.studentListTableView.reloadData()
                self.configureUI()
            }else{
                self.activityIndicator.stopAnimating()

            }
        }
    }
    
    func configureUI(){
        print(StudentDataModelForTeacher.studentArray.count)
        studentListTableView.delegate = self
        studentListTableView.dataSource = self
//        view.backgroundColor = UIColor(named: "darkPurple")
//        view.addSubview(classRoomContainerView)
//        classRoomContainerView.addSubview(classNameAndValueStackView)
        
//        classNameAndValueStackView.addArrangedSubview(classNameLabel)
//        classNameAndValueStackView.addArrangedSubview(classNameLabelValue)
        
//        classRoomContainerView.addSubview(studentsLabel)
//        classRoomContainerView.addSubview(studentListStackViewBackgroundView)
//        studentListStackViewBackgroundView.addSubview(studentListHeaderStackView)
        classRoomContainerView.addSubview(studentListTableView)
        
//        studentListHeaderStackView.addArrangedSubview(studentidLabel)
//        studentListHeaderStackView.addArrangedSubview(studentNameLabel)
//        studentListHeaderStackView.addArrangedSubview(studentFatherNameLabel)
        
//        classRoomContainerView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            
//            activityIndicator.centerXAnchor.constraint(equalTo: classRoomContainerView.centerXAnchor),
//            activityIndicator.centerYAnchor.constraint(equalTo: classRoomContainerView.centerYAnchor),
//
//            classRoomContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            classRoomContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            classRoomContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            classRoomContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//
//            classNameAndValueStackView.topAnchor.constraint(equalTo: classRoomContainerView.topAnchor),
//            classNameAndValueStackView.leadingAnchor.constraint(equalTo: classRoomContainerView.leadingAnchor),
//            classNameAndValueStackView.trailingAnchor.constraint(equalTo: classRoomContainerView.trailingAnchor),
//            classNameAndValueStackView.heightAnchor.constraint(equalTo: classRoomContainerView.heightAnchor , multiplier: 0.1),
//            studentsLabel.topAnchor.constraint(equalTo: classNameAndValueStackView.bottomAnchor),
//            studentsLabel.leadingAnchor.constraint(equalTo: classRoomContainerView.leadingAnchor , constant: 10),
//
//            studentListStackViewBackgroundView.topAnchor.constraint(equalTo: studentsLabel.bottomAnchor , constant: 10),
//            studentListStackViewBackgroundView.leadingAnchor.constraint(equalTo: classRoomContainerView.leadingAnchor , constant: 10),
//            studentListStackViewBackgroundView.trailingAnchor.constraint(equalTo: classRoomContainerView.trailingAnchor , constant: -10),
//            studentListStackViewBackgroundView.heightAnchor.constraint(equalTo: classRoomContainerView.heightAnchor , multiplier: 0.05),
//
//            studentListHeaderStackView.topAnchor.constraint(equalTo: studentListStackViewBackgroundView.topAnchor),
//            studentListHeaderStackView.leadingAnchor.constraint(equalTo: studentListStackViewBackgroundView.leadingAnchor , constant: 10),
//            studentListHeaderStackView.trailingAnchor.constraint(equalTo: studentListStackViewBackgroundView.trailingAnchor , constant: -10),
//            studentListHeaderStackView.heightAnchor.constraint(equalTo: studentListStackViewBackgroundView.heightAnchor , multiplier: 1),
            
            studentListTableView.topAnchor.constraint(equalTo: studentListStackViewBackgroundView.bottomAnchor ),
            studentListTableView.leadingAnchor.constraint(equalTo: classRoomContainerView.leadingAnchor , constant: 10),
            studentListTableView.trailingAnchor.constraint(equalTo: classRoomContainerView.trailingAnchor , constant: -10),
            studentListTableView.bottomAnchor.constraint(equalTo: classRoomContainerView.safeAreaLayoutGuide.bottomAnchor , constant: -20),
        ])
      
    }
    
}
extension ClassRoomViewControllerForTeacher : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        StudentDataModelForTeacher.studentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ClassRoomStudentsCustomCell.identifier, for: indexPath) as! ClassRoomStudentsCustomCell
        let studentData = StudentDataModelForTeacher.studentArray[indexPath.row]
        print(indexPath.row)
        print(studentData)
        cell.setStudentDetail(student: studentData)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    
}

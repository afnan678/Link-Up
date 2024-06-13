//
//  AssignTeacherToCLassViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 08/06/2023.
//

import Foundation
import UIKit

class AssignTeacherToClassViewController : UIViewController{
    
    var assignTeacherContainerView : UIView = {
        let obj = UIView()
        obj.backgroundColor = .systemBackground
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()

    var classNameLabel : UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.text = "Selected Class"
        obj.font = .boldSystemFont(ofSize: 20)
        obj.textColor = UIColor(named: "darkPurple")
        obj.textAlignment = .center
//        obj.font = .boldSystemFont(ofSize: 20)
        return obj
    }()
    var classNameLabelValue : UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.text = ""
        obj.font = .boldSystemFont(ofSize: 20)
        obj.textColor = UIColor(named: "darkPurple")
        obj.textAlignment = .center
//        obj.font = .boldSystemFont(ofSize: 20)
        return obj
    }()

    var classNameStackView : UIStackView = {
        let obj = UIStackView()
        obj.axis = .horizontal
        obj.distribution = .fillEqually
        obj.alignment = .center
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    var teacherTable : UITableView = {
       var obj = UITableView()
        obj.register(AssignTeacherCustomCell.self, forCellReuseIdentifier: AssignTeacherCustomCell.identifier)
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = UIColor(named: "lightPurple")
        return obj
    }()
    var activityIndicator : UIActivityIndicatorView = {
        var indicator = UIActivityIndicatorView()
        indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    var classRecordIndexPath : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Assign Teacher"
        view.backgroundColor = UIColor(named: "darkPurple")
        configureUI()
    }
    
    func configureUI(){
        teacherTable.delegate = self
        teacherTable.dataSource = self
        
        view.addSubview(assignTeacherContainerView)

        assignTeacherContainerView.addSubview(classNameStackView)
//
        classNameStackView.addArrangedSubview(classNameLabel)
        classNameStackView.addArrangedSubview(classNameLabelValue)
        
        assignTeacherContainerView.addSubview(teacherTable)

        assignTeacherContainerView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([

            assignTeacherContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            assignTeacherContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            assignTeacherContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            assignTeacherContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            

            classNameStackView.topAnchor.constraint(equalTo: assignTeacherContainerView.topAnchor ),
            classNameStackView.leadingAnchor.constraint(equalTo: assignTeacherContainerView.leadingAnchor),
            classNameStackView.trailingAnchor.constraint(equalTo: assignTeacherContainerView.trailingAnchor),
            classNameStackView.heightAnchor.constraint(equalTo: assignTeacherContainerView.heightAnchor , multiplier: 0.1),
            
            teacherTable.topAnchor.constraint(equalTo: classNameStackView.bottomAnchor ),
            teacherTable.leadingAnchor.constraint(equalTo: assignTeacherContainerView.leadingAnchor),
            teacherTable.trailingAnchor.constraint(equalTo: assignTeacherContainerView.trailingAnchor),
            teacherTable.bottomAnchor.constraint(equalTo: assignTeacherContainerView.safeAreaLayoutGuide.bottomAnchor , constant: -20),
            
            activityIndicator.centerXAnchor.constraint(equalTo: assignTeacherContainerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: assignTeacherContainerView.centerYAnchor)
        ])
        if TeacherDataModelForAdmin.records.isEmpty{
            activityIndicator.startAnimating()
            FirestoreManager.shared.loadAllTeacheraReocrd { success in
                if success {
                    self.activityIndicator.stopAnimating()
                    print(ClassDataModel.recordArray)
                    self.teacherTable.reloadData()
                }else{
                    print("Error loading Documents")
                }
            }
        }else{

        }
    }
    func setData(indexPath : Int){
        classNameLabelValue.text = ClassDataModel.recordArray[indexPath].className
        classRecordIndexPath = indexPath
    }
    func generateAlert( largeTitle : String , message : String ){
        let alert = UIAlertController(title: largeTitle , message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default))
        alert.addAction(UIAlertAction(title : "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
extension AssignTeacherToClassViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        ClassDataModel.teacherRecordsWithoutImages.count
        TeacherDataModelForAdmin.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: AssignTeacherCustomCell.identifier, for: indexPath) as? AssignTeacherCustomCell
//        var teacherRecord = ClassDataModel.teacherRecordsWithoutImages[indexPath.row]
        var teacherRecord = TeacherDataModelForAdmin.records[indexPath.row]
        cell?.setTeacherDetails(teacherData: teacherRecord)
        cell?.assignTeacherButton.tag = indexPath.row
        cell?.assignTeacherButton.addTarget(self, action: #selector(didTapAssignTeacherButton(_:)), for: .touchUpInside)
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    @objc func didTapAssignTeacherButton(_ sender : UIButton){
        let rowIndex = sender.tag
        let indexPath = IndexPath.init(row: rowIndex, section: 0)

        let alert = UIAlertController(title: "Assign Teacher" , message: "Are you sure!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default , handler: { _ in
            self.activityIndicator.startAnimating()
            
            FirestoreManager.shared.assignClassToTeacher(classId: ClassDataModel.recordArray[self.classRecordIndexPath!].className, teacherId: TeacherDataModelForAdmin.records[indexPath.row].teacherId) { success in
                if success {
                    self.activityIndicator.stopAnimating()
//                    print(ClassDataModel.recordArray)
//                    print(TeacherDataModel.records)
                    ClassDataModel.recordArray[self.classRecordIndexPath!].assignedTeacher = String(TeacherDataModelForAdmin.records[indexPath.row].teacherId)
                    TeacherDataModelForAdmin.records[indexPath.row].assignedClass = ClassDataModel.recordArray[self.classRecordIndexPath!].className
                    
//                    print(ClassDataModel.recordArray[indexPath.row].assignedTeacher)
//                    print(TeacherDataModel.records[indexPath.row].assignedClass)
//
////                    print(indexPath.row)
////                    print(self.classRecordIndexPath!)
//
//                    print(ClassDataModel.recordArray)
//                    print(TeacherDataModel.records)
                    
                    
                    
                    
                    self.teacherTable.reloadData()
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }))
        alert.addAction(UIAlertAction(title : "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}

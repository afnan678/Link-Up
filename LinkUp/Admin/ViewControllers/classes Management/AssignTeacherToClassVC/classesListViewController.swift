//
//  AssigningTeacherViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 08/06/2023.
//

import Foundation
import UIKit

class classesListViewController : UIViewController{
    
    var previewClassesContainerView : UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var classesListLabel : UILabel = {
       
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Select Class To Assign"
        lbl.textColor = UIColor(named: "mediumPurple")
        lbl.font = UIFont.boldSystemFont(ofSize: 22.0)
        return lbl
    }()
    var classNameAndAssignedTeacherStackView : UIStackView = {
        let obj = UIStackView()
        obj.axis = .horizontal
        obj.distribution = .fillEqually
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    var classesNameLabel : UILabel = {
       
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Class Name"
        lbl.textColor = UIColor(named: "mediumPurple")
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        lbl.textAlignment = .center
        return lbl
    }()
    var assignedTeacherLabel : UILabel = {
       
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Assigned Teacher ID"
        lbl.textColor = UIColor(named: "mediumPurple")
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        lbl.textAlignment = .center
        return lbl
    }()
    
    var classesListTableView : UITableView = {
       let obj = UITableView()
        obj.register(PreviewClassesCustomCell.self, forCellReuseIdentifier: PreviewClassesCustomCell.identifier)
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    
    var activityIndicator : UIActivityIndicatorView = {
        var indicator = UIActivityIndicatorView()
        indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Assign Teacher"
        classesListTableView.delegate = self
        classesListTableView.dataSource = self
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
////        view.backgroundColor = .systemBackground
////        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
////        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
////        activityIndicator.startAnimating()
////        FirestoreManager.shared.loadClassesDetail { success in
////            if success {
////                self.activityIndicator.stopAnimating()
////                print(ClassDataModel.recordArray)
////                self.configureUI()
////            }else{
////                print("Error loading Documents")
////            }
////        }
//    }
    override func viewDidAppear(_ animated: Bool) {
//        classesListTableView.delegate = self
//        classesListTableView.dataSource = self
//        view.backgroundColor = .systemBackground
        classesListTableView.reloadData()

    }
    
    func configureUI(){
        
        view.backgroundColor = UIColor(named: "darkPurple")

        view.addSubview(previewClassesContainerView)
        previewClassesContainerView.addSubview(classesListLabel)
        previewClassesContainerView.addSubview(classNameAndAssignedTeacherStackView)

        classNameAndAssignedTeacherStackView.addArrangedSubview(classesNameLabel)
        classNameAndAssignedTeacherStackView.addArrangedSubview(assignedTeacherLabel)
        
        previewClassesContainerView.addSubview(classesListTableView)
        previewClassesContainerView.addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            
            
            
            previewClassesContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            previewClassesContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            previewClassesContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            previewClassesContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: previewClassesContainerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: previewClassesContainerView.centerYAnchor),
            
            classesListLabel.topAnchor.constraint(equalTo: previewClassesContainerView.topAnchor , constant: 20),
            classesListLabel.centerXAnchor.constraint(equalTo: previewClassesContainerView.centerXAnchor),
            
            classNameAndAssignedTeacherStackView.topAnchor.constraint(equalTo: classesListLabel.bottomAnchor , constant: 5),
            classNameAndAssignedTeacherStackView.leadingAnchor.constraint(equalTo: previewClassesContainerView.leadingAnchor),
            classNameAndAssignedTeacherStackView.trailingAnchor.constraint(equalTo: previewClassesContainerView.trailingAnchor),
            classNameAndAssignedTeacherStackView.heightAnchor.constraint(equalTo: previewClassesContainerView.heightAnchor , multiplier: 0.1),
            
            classesListTableView.topAnchor.constraint(equalTo: classNameAndAssignedTeacherStackView.bottomAnchor , constant: 10),
            classesListTableView.leadingAnchor.constraint(equalTo: previewClassesContainerView.leadingAnchor),
            classesListTableView.trailingAnchor.constraint(equalTo: previewClassesContainerView.trailingAnchor),
//            classesListTableView.widthAnchor.constraint(equalTo: view.widthAnchor , multiplier: 1),
            classesListTableView.bottomAnchor.constraint(equalTo: previewClassesContainerView.safeAreaLayoutGuide.bottomAnchor),
        ])
        if ClassDataModel.recordArray.isEmpty{
            activityIndicator.startAnimating()
            FirestoreManager.shared.loadClassesDetail { success in
                if success {
                    self.activityIndicator.stopAnimating()
                    print(ClassDataModel.recordArray)
                    self.classesListTableView.reloadData()
                }else{
                    print("Error loading Documents")
                }
            }
        }
    }
    
}
extension classesListViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ClassDataModel.recordArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PreviewClassesCustomCell.identifier, for: indexPath) as? PreviewClassesCustomCell
        let record = ClassDataModel.recordArray[indexPath.row]
        print("         \(record)           ")
        cell?.setRecord(obj: record)
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let vc = AssignTeacherToClassViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.setData(indexPath: indexPath.row)
        navigationController?.pushViewController(vc, animated: true)
    }
}

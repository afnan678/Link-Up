//
//  SearchStudentViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 15/04/2023.
//

import Foundation
import UIKit
import DropDown
import FirebaseFirestore


class SearchStudentViewController : UIViewController {
    
    var searchStudentContainerView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: "darkPurple")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var searchStudentBackgroundView : UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var selectClassLabel : UILabel = {
        var lbl = UILabel()
        lbl.text = "Select Class"
        lbl.font = UIFont.boldSystemFont(ofSize: 23)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.layer.cornerRadius = 10
        lbl.layer.masksToBounds = true
        lbl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        lbl.backgroundColor = UIColor(named: "mediumPurple")
        return lbl
    }()
    
    var classDropDownButton : UIButton = {
       let button = UIButton()
        button.setTitle(" Choose", for: .normal)
//        button.layer.borderWidth = 2
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 23)
//        button.layer.borderColor = CGColor(gray: 20, alpha: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "mediumPurple")
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let arrowImage = UIImage(systemName: "chevron.down")
            button.setImage(arrowImage, for: .normal)
            button.semanticContentAttribute = .forceRightToLeft
            button.imageEdgeInsets = UIEdgeInsets(top: 2, left: 8, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(didTapChooseClass), for: .touchUpInside)
        return button
    }()

    var selectClassStackView : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.backgroundColor = UIColor(named: "lightPurple")
        return stackView
    }()
    var rollNoTextField : UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Enter Roll No"
        
        field.keyboardType = .numberPad
        field.font = .systemFont(ofSize: 20)
        field.textAlignment = .center
        field.heightAnchor.constraint(equalToConstant: 35).isActive = true
        field.borderStyle = .line
        
        return field
    }()
    var searchButton : UIButton = {
       let button = UIButton()
        button.setTitle(" Search", for: .normal)
//        button.layer.borderWidth = 2
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 23)
//        button.layer.borderColor = CGColor(gray: 20, alpha: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "mediumPurple")
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
       
        button.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        return button
    }()
   
    var searchStackView : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.backgroundColor = UIColor(named: "lightPurple")
        return stackView
    }()
    
    private var recordBackgroundView : UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .red
        return view
    }()
    
    
    var studentRecordStackView : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
//        stackView.alignment = .center
//        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.backgroundColor = UIColor(named: "lightPurple")
        return stackView
    }()
    
    var studentRecordTitleLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Student Record"
        lbl.font = .boldSystemFont(ofSize: 23)
        lbl.textAlignment = .center
        lbl.textColor = .black
//        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
        return lbl
    }()
    
    var nameLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Name"
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        return lbl
    }()
    
    var studentNameLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        return lbl
    }()
    var nameStackView : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var rollNoLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Roll No"
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        return lbl
    }()
    
    var studentRollNoLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        return lbl
    }()
    var rollNoStackView : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var ageLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Age"
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        return lbl
    }()
    
    var studentAgeLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        return lbl
    }()
    var ageStackView : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var fatherNameLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Father Name"
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        return lbl
    }()
    
    var studentFatherNameLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        return lbl
    }()
    var fatherNameStackView : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var fatherEmailLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Father Email"
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        return lbl
    }()
    
    var studentfatherEmailLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        return lbl
    }()
    var fatherCNICStackView : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var phNoLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Phone No"
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        return lbl
    }()
    
    var studentFatherPhNoLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        return lbl
    }()
    var fatherPhNoStackView : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var addressLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Address"
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        return lbl
    }()
    
    var studentAddressLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        return lbl
    }()
    var addressStackView : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var classesIds = [String]()
    private var selectedClass : String?
    var searchedStudentData = student()


    let menu : DropDown = {
        let menu = DropDown()
        
        menu.backgroundColor = UIColor(named: "lightPurple")
        menu.textColor = .black
        menu.textFont = UIFont.boldSystemFont(ofSize: 16)
        return menu
    }()
    
    override func loadView() {
        super.loadView()
        title = "Search Student"
        view.backgroundColor = .systemBackground
        print("load")
        menu.anchorView = classDropDownButton
        menu.width = 100
        menu.bottomOffset = CGPoint(x: 35, y: classDropDownButton.bounds.height+50)
        configureUI()
        loadClassesIds()

    }
    private var studentRecordStackViewHeightConstraint : NSLayoutConstraint?

    func configureUI(){
        
        menu.dataSource = classesIds
        
        view.addSubview(searchStudentContainerView)
        searchStudentContainerView.addSubview(searchStudentBackgroundView)
        
        searchStudentBackgroundView.addSubview(selectClassStackView)
        searchStudentBackgroundView.addSubview(searchStackView)
        searchStudentBackgroundView.addSubview(recordBackgroundView)
        recordBackgroundView.addSubview(studentRecordStackView)
        
        //        view.addSubview(nameStackView)
        selectClassStackView.addArrangedSubview(selectClassLabel)
        selectClassStackView.addArrangedSubview(classDropDownButton)
        searchStackView.addArrangedSubview(rollNoTextField)
        searchStackView.addArrangedSubview(searchButton)
//
        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(studentNameLabel)
        rollNoStackView.addArrangedSubview(rollNoLabel)
        rollNoStackView.addArrangedSubview(studentRollNoLabel)
        ageStackView.addArrangedSubview(ageLabel)
        ageStackView.addArrangedSubview(studentAgeLabel)
        fatherNameStackView.addArrangedSubview(fatherNameLabel)
        fatherNameStackView.addArrangedSubview(studentFatherNameLabel)
        fatherCNICStackView.addArrangedSubview(fatherEmailLabel)
        fatherCNICStackView.addArrangedSubview(studentfatherEmailLabel)
        fatherPhNoStackView.addArrangedSubview(phNoLabel)
        fatherPhNoStackView.addArrangedSubview(studentFatherPhNoLabel)
        addressStackView.addArrangedSubview(addressLabel)
        addressStackView.addArrangedSubview(studentAddressLabel)

        studentRecordStackView.addArrangedSubview(studentRecordTitleLabel)
        studentRecordStackView.addArrangedSubview(nameStackView)
        studentRecordStackView.addArrangedSubview(rollNoStackView)
        studentRecordStackView.addArrangedSubview(ageStackView)
        studentRecordStackView.addArrangedSubview(fatherNameStackView)
        studentRecordStackView.addArrangedSubview(fatherCNICStackView)
        studentRecordStackView.addArrangedSubview(fatherPhNoStackView)
        studentRecordStackView.addArrangedSubview(addressStackView)

        studentRecordStackViewHeightConstraint = studentRecordStackView.heightAnchor.constraint(equalToConstant: 0)
        
        NSLayoutConstraint.activate([
            
            
            searchStudentContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            searchStudentContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchStudentContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchStudentContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            searchStudentBackgroundView.topAnchor.constraint(equalTo: searchStudentContainerView.safeAreaLayoutGuide.topAnchor),
            searchStudentBackgroundView.leadingAnchor.constraint(equalTo: searchStudentContainerView.leadingAnchor),
            searchStudentBackgroundView.trailingAnchor.constraint(equalTo: searchStudentContainerView.trailingAnchor),
            searchStudentBackgroundView.bottomAnchor.constraint(equalTo: searchStudentContainerView.bottomAnchor),
            
            
            selectClassStackView.topAnchor.constraint(equalTo: searchStudentBackgroundView.safeAreaLayoutGuide.topAnchor , constant: 10),
            selectClassStackView.leadingAnchor.constraint(equalTo: searchStudentBackgroundView.leadingAnchor, constant: 5),
            selectClassStackView.trailingAnchor.constraint(equalTo: searchStudentBackgroundView.trailingAnchor, constant: -5),
//            selectClassStackView.heightAnchor.constraint(equalToConstant: 70),
            selectClassStackView.heightAnchor.constraint(equalTo: searchStudentBackgroundView.heightAnchor, multiplier: 0.1),
            
//            searchStackView.topAnchor.constraint(equalTo: selectClassStackView.bottomAnchor, constant: 15),
            searchStackView.topAnchor.constraint(equalTo: selectClassStackView.bottomAnchor),
            searchStackView.leadingAnchor.constraint(equalTo: searchStudentBackgroundView.leadingAnchor , constant: 5),
            searchStackView.trailingAnchor.constraint(equalTo: searchStudentBackgroundView.trailingAnchor , constant: -5),
//            searchStackView.heightAnchor.constraint(equalToConstant: 50),
            searchStackView.heightAnchor.constraint(equalTo: searchStudentBackgroundView.heightAnchor, multiplier: 0.1),
            

            recordBackgroundView.topAnchor.constraint(equalTo: searchStackView.bottomAnchor , constant: 10),
            recordBackgroundView.leadingAnchor.constraint(equalTo: searchStudentBackgroundView.leadingAnchor),
            recordBackgroundView.trailingAnchor.constraint(equalTo: searchStudentBackgroundView.trailingAnchor),
            
            studentRecordStackView.topAnchor.constraint(equalTo: recordBackgroundView.topAnchor),
            studentRecordStackView.leadingAnchor.constraint(equalTo: recordBackgroundView.leadingAnchor , constant: 20 ),
            studentRecordStackView.trailingAnchor.constraint(equalTo: recordBackgroundView.trailingAnchor , constant: -20),
            studentRecordStackView.heightAnchor.constraint(equalTo: recordBackgroundView.heightAnchor, multiplier: 1)
 
        ])
        studentRecordStackViewHeightConstraint?.isActive = true
    }
    var recordAvalable = 0
    func studentRecordConstraints(){
        if recordAvalable == 0{
            recordAvalable = 1
//            studentRecordStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
            studentRecordStackViewHeightConstraint?.isActive = false
            studentRecordStackViewHeightConstraint = studentRecordStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
            studentRecordStackViewHeightConstraint?.isActive = true
        }
    }
    func removeStudentRecordConstraints(){
        print(recordAvalable)
        if recordAvalable == 1 {
            recordAvalable = 0
            searchedStudentData.name = ""
            searchedStudentData.rollNo = ""
            searchedStudentData.age = ""
            searchedStudentData.fName = ""
            searchedStudentData.fEmail = ""
            searchedStudentData.phNo = ""
            searchedStudentData.address = ""
            recordAvalable = 0

        studentRecordStackViewHeightConstraint?.isActive = false
        studentRecordStackViewHeightConstraint = studentRecordStackView.heightAnchor.constraint(equalToConstant: 0)
        studentRecordStackViewHeightConstraint?.isActive = true
        }
    }
    
    let collectionRef = Firestore.firestore().collection("Classes")
    let studentRef = Firestore.firestore().collection("Students")
    
    @objc func didTapChooseClass () {
        menu.show()
        menu.selectionAction = { [unowned self] (index: Int, item: String) in
                    // Handle the user's selection here
            classDropDownButton.setTitle(item, for: .normal)
            print("User selected item \(item) at index \(index)")
            selectedClass = item
        }
    }
    @objc func searchButtonPressed () {
        rollNoTextField.resignFirstResponder()
        guard let rollNo = rollNoTextField.text, let reqClass = selectedClass , !rollNo.isEmpty , !reqClass.isEmpty else {
            print("empty")
            guard let reqClass = selectedClass , !reqClass.isEmpty else{
                generateAlert(largeTitle: "Woops", message: "Please Select Class")

                return
            }
            generateAlert(largeTitle: "Woops", message: "Please enter RollNo")
            return
        }
        let query = studentRef.whereField("Class", isEqualTo: reqClass).whereField("Roll_No", isEqualTo: Int(rollNo)!)

        query.getDocuments { [weak self] (snapshot, error) in
            guard let strongSelf = self else {
                return
            }
            
            if let error = error as NSError? {
                    print("Error getting documents: \(error.localizedDescription)")
                
            }else{
                
                if let snapshot = snapshot {
                    if !snapshot.isEmpty {
                        for document in snapshot.documents {
                            print("\(document.documentID) => \(document.data())")
                            let data = document.data()
                                                   // access data fields as needed
                            let name = data["Name"] as? String ?? "n"
                            let rollNo = data["Roll_No"] as? Int ?? 00
                            let age = data["Age"] as? String ?? "0"
                            let fName = data["Father Name"] as? String ?? "_"
                            let fatherEmail = data["Father Email"] as? String ?? "_"
                            let phNo = data["Phone No"] as? String ?? "_"
                            let address = data["Address"] as? String ?? "_"

                            strongSelf.searchedStudentData.name = name
                            strongSelf.searchedStudentData.rollNo = String(rollNo)
                            strongSelf.searchedStudentData.age = age
                            strongSelf.searchedStudentData.fName = fName
                            strongSelf.searchedStudentData.fEmail = fatherEmail
                            strongSelf.searchedStudentData.phNo = phNo
                            strongSelf.searchedStudentData.address = address

                            // etc.
                            print("\(name) is in class \(reqClass) and has roll no. \(rollNo)")
                        }
                        
                        if strongSelf.recordAvalable == 0{
                            strongSelf.studentRecordConstraints()
                        }
                        strongSelf.setStudentsDataToFields()

                    } else {

                        if strongSelf.recordAvalable == 1{
                            strongSelf.removeStudentRecordConstraints()
                        }
                        strongSelf.generateAlert(largeTitle: "Not Found", message: "Student Record Not Found")


                        print("No documents found")
                    }
                }
            }
        }
    }

    func setStudentsDataToFields(){
        studentNameLabel.text = searchedStudentData.name
        studentRollNoLabel.text = searchedStudentData.rollNo
        studentAgeLabel.text = searchedStudentData.age
        studentFatherNameLabel.text = searchedStudentData.fName
        studentfatherEmailLabel.text = searchedStudentData.fEmail
        studentFatherPhNoLabel.text = searchedStudentData.phNo
        studentAddressLabel.text = searchedStudentData.address

    }
    func loadClassesIds() {
        collectionRef.getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else {
                print("Error fetching documents: \(error!)")
                    return
                }
                for document in snapshot.documents {
                    let data = document.data()
                    if let fieldId = data["id"] as? String {
                        self.classesIds.append(fieldId)
                    }
                }
                self.menu.dataSource = self.classesIds
            }
        }
    func generateAlert(largeTitle: String , message : String ){
            
            let alert = UIAlertController(title: largeTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
}

//
//  RemoveStudentViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 16/04/2023.
//

import Foundation
import UIKit
import DropDown
import FirebaseFirestore


class RemoveStudentViewController : UIViewController {
    
    var removeStudentContainerView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: "darkPurple")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var removeStudentBackgroundView : UIView = {
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
//        lbl.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
//        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
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
        stackView.alignment = .fill
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
//        field.heightAnchor.constraint(equalToConstant: 35).isActive = true
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
//        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
       
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
    
    
    
    var studentRecordStackView : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
//        stackView.spacing = 20

        stackView.distribution = .fillEqually
//        stackView.alignment = .center
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
//
//    var fatherCNICLabel : UILabel = {
//        
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "Father Email"
//        lbl.textAlignment = .left
//        lbl.textColor = .black
//        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
//        return lbl
//    }()
    
//    var removeStudentButton : UIButton = {
//       let button = UIButton()
//        button.setTitle("Remove Student", for: .normal)
////        button.layer.borderWidth = 2
//        button.setTitleColor(.white, for: .normal)
//        button.contentHorizontalAlignment = .center
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 23)
////        button.layer.borderColor = CGColor(gray: 20, alpha: 20)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .red
//        button.layer.cornerRadius = 10
////        button.layer.shadowColor = UIColor.black.cgColor
////        button.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
////        button.layer.shadowOpacity = 0.1
////        button.layer.shadowRadius = 2
//        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
//
//        button.addTarget(self, action: #selector(removeButtonPressed), for: .touchUpInside)
//        return button
//    }()
    var removeStudentButton : UIButton = {
       let button = UIButton()
        button.setTitle("Remove Student", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 23)
//        button.layer.borderColor = CGColor(gray: 20, alpha: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
//        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
       
        button.addTarget(self, action: #selector(removeButtonPressed), for: .touchUpInside)
        return button
    }()
    var removeStackViewBackgroundView : UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .red
        return view
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
    
    var studentRecordStackViewHeightConstraint : NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Remove Student"
        view.backgroundColor = .systemBackground
        print("load")
       
        configureUI()
        loadClassesIds()

    }
    
    func configureUI(){
        
        menu.anchorView = classDropDownButton
        menu.width = 100
        menu.bottomOffset = CGPoint(x: 35, y: classDropDownButton.bounds.height+50)
        menu.dataSource = classesIds
        
        view.addSubview(removeStudentContainerView)
        removeStudentContainerView.addSubview(removeStudentBackgroundView)
        
        removeStudentBackgroundView.addSubview(selectClassStackView)
        removeStudentBackgroundView.addSubview(searchStackView)
        removeStudentBackgroundView.addSubview(removeStackViewBackgroundView)
        removeStackViewBackgroundView.addSubview(studentRecordStackView)
        
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
        fatherNameStackView.addArrangedSubview(fatherNameLabel)
        fatherNameStackView.addArrangedSubview(studentFatherNameLabel)
        
        

        studentRecordStackView.addArrangedSubview(studentRecordTitleLabel)
        studentRecordStackView.addArrangedSubview(nameStackView)
        studentRecordStackView.addArrangedSubview(rollNoStackView)
        studentRecordStackView.addArrangedSubview(fatherNameStackView)
        studentRecordStackView.addArrangedSubview(removeStudentButton)

        studentRecordStackViewHeightConstraint = studentRecordStackView.heightAnchor.constraint(equalToConstant: 0)
        

        print("configure")
        NSLayoutConstraint.activate([
            
            removeStudentContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            removeStudentContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            removeStudentContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            removeStudentContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            removeStudentBackgroundView.topAnchor.constraint(equalTo: removeStudentContainerView.safeAreaLayoutGuide.topAnchor),
            removeStudentBackgroundView.leadingAnchor.constraint(equalTo: removeStudentContainerView.leadingAnchor),
            removeStudentBackgroundView.trailingAnchor.constraint(equalTo: removeStudentContainerView.trailingAnchor),
            removeStudentBackgroundView.bottomAnchor.constraint(equalTo: removeStudentContainerView.bottomAnchor),
            
            selectClassStackView.topAnchor.constraint(equalTo: removeStudentBackgroundView.safeAreaLayoutGuide.topAnchor , constant: 10),
            selectClassStackView.leadingAnchor.constraint(equalTo: removeStudentBackgroundView.leadingAnchor, constant: 5),
            selectClassStackView.trailingAnchor.constraint(equalTo: removeStudentBackgroundView.trailingAnchor, constant: -5),
            selectClassStackView.heightAnchor.constraint(equalTo: removeStudentBackgroundView.heightAnchor, multiplier: 0.06),
            
            searchStackView.topAnchor.constraint(equalTo: selectClassStackView.bottomAnchor , constant: 10),
            searchStackView.leadingAnchor.constraint(equalTo: removeStudentBackgroundView.leadingAnchor , constant: 5),
            searchStackView.trailingAnchor.constraint(equalTo: removeStudentBackgroundView.trailingAnchor , constant: -5),
            searchStackView.heightAnchor.constraint(equalTo: removeStudentBackgroundView.heightAnchor, multiplier: 0.06),
            
//            removeStackViewBackgroundView.topAnchor.constraint(equalTo: searchStackView.bottomAnchor , constant: 30),
            removeStackViewBackgroundView.leadingAnchor.constraint(equalTo: removeStudentBackgroundView.leadingAnchor),
            removeStackViewBackgroundView.trailingAnchor.constraint(equalTo: removeStudentBackgroundView.trailingAnchor),
            removeStackViewBackgroundView.centerXAnchor.constraint(equalTo: removeStudentBackgroundView.centerXAnchor),
            removeStackViewBackgroundView.centerYAnchor.constraint(equalTo: removeStudentBackgroundView.centerYAnchor),
            
            studentRecordStackView.topAnchor.constraint(equalTo: removeStackViewBackgroundView.topAnchor),
            studentRecordStackView.leadingAnchor.constraint(equalTo: removeStackViewBackgroundView.leadingAnchor , constant: 20 ),
            studentRecordStackView.trailingAnchor.constraint(equalTo: removeStackViewBackgroundView.trailingAnchor , constant: -20),
            studentRecordStackView.heightAnchor.constraint(equalTo: removeStackViewBackgroundView.heightAnchor, multiplier: 1)


//            //setting width of RecordStackView
//            studentRecordTitleLabel.widthAnchor.constraint(equalTo: studentRecordStackView.widthAnchor, multiplier: 1),
//            nameStackView.widthAnchor.constraint(equalTo: studentRecordStackView.widthAnchor, multiplier: 1),
//            rollNoStackView.widthAnchor.constraint(equalTo: studentRecordStackView.widthAnchor, multiplier: 1),
//            fatherNameStackView.widthAnchor.constraint(equalTo: studentRecordStackView.widthAnchor, multiplier: 1),
//            removeStudentButton.widthAnchor.constraint(equalTo: studentRecordStackView.widthAnchor, multiplier: 1),
//
////            removeStudentButton.widthAnchor.constraint(equalTo: studentRecordStackView.widthAnchor, multiplier: 1),
//            //setting height of Records Label
//            nameLabel.heightAnchor.constraint(equalTo: nameStackView.heightAnchor),
//            studentNameLabel.heightAnchor.constraint(equalTo: nameStackView.heightAnchor),
//            rollNoLabel.heightAnchor.constraint(equalTo: rollNoStackView.heightAnchor),
//            studentRollNoLabel.heightAnchor.constraint(equalTo: rollNoStackView.heightAnchor),
//            fatherNameLabel.heightAnchor.constraint(equalTo: fatherNameStackView.heightAnchor),
//            studentFatherNameLabel.heightAnchor.constraint(equalTo: fatherNameStackView.heightAnchor),
//            removeStudentButton.heightAnchor.constraint(equalTo: studentRecordStackView.heightAnchor, multiplier: 0.1)
//            removeStudentButton.leadingAnchor.constraint(equalTo: studentRecordStackView.leadingAnchor ,constant: 20),
//            removeStudentButton.trailingAnchor.constraint(equalTo: studentRecordStackView.trailingAnchor , constant: -30),
        ])
        
        studentRecordStackViewHeightConstraint?.isActive = true
    }
    var recordAvalable = 0
    func studentRecordConstraints(){
        if recordAvalable == 0{
            recordAvalable = 1
            studentRecordStackViewHeightConstraint?.isActive = false
            studentRecordStackViewHeightConstraint = studentRecordStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35)
            studentRecordStackViewHeightConstraint?.isActive = true
//            configureUI()
//            studentRecordStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
            

        }
    }
    func removeStudentRecordConstraints(){
        print(recordAvalable)
            recordAvalable = 0
            searchedStudentData.name = ""
            searchedStudentData.rollNo = ""
            searchedStudentData.fName = ""
        studentRecordStackViewHeightConstraint?.isActive = false
        studentRecordStackViewHeightConstraint = studentRecordStackView.heightAnchor.constraint(equalToConstant: 0)
        studentRecordStackViewHeightConstraint?.isActive = true

//            selectClassStackView.removeFromSuperview()
//            searchStackView.removeFromSuperview()
//            nameStackView.removeFromSuperview()
//            rollNoStackView.removeFromSuperview()
//            fatherNameStackView.removeFromSuperview()
//            studentRecordStackView.removeFromSuperview()
//            configureUI()

//            studentRecordStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.0).isActive = true

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
                            let fName = data["Father Name"] as? String ?? "f"

                            strongSelf.searchedStudentData.name = name
                            strongSelf.searchedStudentData.rollNo = String(rollNo)
                            strongSelf.searchedStudentData.fName = fName

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
        studentFatherNameLabel.text = searchedStudentData.fName
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
    @objc func removeButtonPressed(){
        
        let alert = UIAlertController(title: "Delete User", message: "Are you sure", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            guard let strongSelf = self else{
                return
            }
            if let studentClass = strongSelf.selectedClass , !strongSelf.searchedStudentData.rollNo.isEmpty, !studentClass.isEmpty{
                print("studentClass inner")
            }
            let registeredClass = strongSelf.selectedClass!
            let studentRollNo = Int(strongSelf.searchedStudentData.rollNo)
            
            FirestoreManager.shared.removeStudent(classId: registeredClass, rollNo: studentRollNo! )
//            strongSelf.recordAvalable = 0
            strongSelf.generateAlert(largeTitle: "Remove Student", message: "Student Removed Successfully")
            strongSelf.removeStudentRecordConstraints()

        }))
        present(alert, animated: true)
    }
    func generateAlert(largeTitle: String , message : String ){
            
        let alert = UIAlertController(title: largeTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
}

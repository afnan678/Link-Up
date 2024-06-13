//
//  UpdateStudentViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 17/05/2023.
//

import Foundation
import UIKit
import FirebaseFirestore
import SDWebImage
import DropDown
import FirebaseStorage
class UpdateStudentViewController : UIViewController {
    
    var updateStudentContainerView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: "darkPurple")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var updateStudentBackgroundView : UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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

    var selectClassLabel : UILabel = {
        var lbl = UILabel()
        lbl.text = "Select Class"
        lbl.font = UIFont.boldSystemFont(ofSize: 23)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.layer.cornerRadius = 10
        lbl.layer.masksToBounds = true
//        lbl.heightAnchor.constraint(equalToConstant: 45).isActive = true
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
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "mediumPurple")
        button.layer.cornerRadius = 10
//        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        let arrowImage = UIImage(systemName: "chevron.down")
            button.setImage(arrowImage, for: .normal)
            button.semanticContentAttribute = .forceRightToLeft
            button.imageEdgeInsets = UIEdgeInsets(top: 2, left: 8, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(didTapChooseClass), for: .touchUpInside)
        return button
    }()
    let menu : DropDown = {
        let menu = DropDown()
        menu.backgroundColor = UIColor(named: "lightPurple")
        menu.textColor = .black
        menu.textFont = UIFont.boldSystemFont(ofSize: 16)
        return menu
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
    
    var rollNoTextField : UITextField = {
    let field = UITextField()
    field.translatesAutoresizingMaskIntoConstraints = false
    field.placeholder = "Enter Roll No"
    
    field.keyboardType = .numberPad
    field.font = .systemFont(ofSize: 20)
    field.textAlignment = .center
//    field.heightAnchor.constraint(equalToConstant: 35).isActive = true
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
//    button.heightAnchor.constraint(equalToConstant: 35).isActive = true
   
    button.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
    return button
}()

    var fieldsStackView : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
//        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.backgroundColor = UIColor(named: "lightPurple")
        return stackView
    }()
    
    private let studentImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 75
        imageView.isUserInteractionEnabled = true
        
        imageView.clipsToBounds = true
        
        return imageView
    }()

    private let addPhotoLabel : UILabel = {
        let label = UILabel()
        label.text = "Add Photo"
        label.backgroundColor = UIColor(named: "labelBackground")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private let studentNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Student Name..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let studentAgeField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Student Age..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let FatherNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Father Name..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let FatherEmailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Father Email..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.keyboardType = .numberPad
        return field
    }()
    
    private let FatherPhoneNoField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Father Phone No..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.keyboardType = .numberPad
        return field
    }()
    
    private let studentAddressField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Address..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let updateStudentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Update", for: .normal)
        button.backgroundColor = UIColor(named: "mediumPurple")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20 , weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(updateStudentButtonTapped), for: .touchUpInside)
        return button
    }()

    var activityIndicator: UIActivityIndicatorView = {
       var indicator = UIActivityIndicatorView()
        indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .gray
        return indicator
    }()

    private var selectedClass : String?
    var fieldIds = [String]()
    private let storage = Storage.storage().reference()
    var imageData : Data?
    var searchedStudentData = student()


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Update Student"
        view.backgroundColor = .white
        configureUI()
    }
    
    private func configureUI(){
        
        menu.anchorView = classDropDownButton
        menu.width = 80
        menu.bottomOffset = CGPoint(x: 45, y: classDropDownButton.bounds.height + 40)
        menu.dataSource = fieldIds
        loadFieldIds()
        
        view.addSubview(updateStudentContainerView)
        updateStudentContainerView.addSubview(updateStudentBackgroundView)
        
        view.addSubview(searchStackView)
        view.addSubview(selectClassStackView)
        selectClassStackView.addArrangedSubview(selectClassLabel)
        selectClassStackView.addArrangedSubview(classDropDownButton)
        searchStackView.addArrangedSubview(rollNoTextField)
        searchStackView.addArrangedSubview(searchButton)
        view.addSubview(fieldsStackView)
        
        view.addSubview(studentImage)
        studentImage.addSubview(addPhotoLabel)

        fieldsStackView.addArrangedSubview(studentNameField)
        fieldsStackView.addArrangedSubview(studentAgeField)
        fieldsStackView.addArrangedSubview(FatherNameField)
        fieldsStackView.addArrangedSubview(FatherEmailField)
        fieldsStackView.addArrangedSubview(FatherPhoneNoField)
        fieldsStackView.addArrangedSubview(studentAddressField)
//        fieldsStackView.addArrangedSubview(selectClassStackView)
        fieldsStackView.addArrangedSubview(updateStudentButton)

        selectClassStackView.addArrangedSubview(selectClassLabel)
        selectClassStackView.addArrangedSubview(classDropDownButton)
        view.addSubview(activityIndicator)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(studentImagePressed))
        studentImage.addGestureRecognizer(tapGesture)
        NSLayoutConstraint.activate([
            
            updateStudentContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            updateStudentContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            updateStudentContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            updateStudentContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            updateStudentBackgroundView.topAnchor.constraint(equalTo: updateStudentContainerView.safeAreaLayoutGuide.topAnchor),
            updateStudentBackgroundView.leadingAnchor.constraint(equalTo: updateStudentContainerView.leadingAnchor),
            updateStudentBackgroundView.trailingAnchor.constraint(equalTo: updateStudentContainerView.trailingAnchor),
            updateStudentBackgroundView.bottomAnchor.constraint(equalTo: updateStudentContainerView.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: updateStudentContainerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: updateStudentContainerView.centerYAnchor),
            
            selectClassStackView.topAnchor.constraint(equalTo: updateStudentBackgroundView.safeAreaLayoutGuide.topAnchor , constant: 5),
            selectClassStackView.leadingAnchor.constraint(equalTo: updateStudentBackgroundView.leadingAnchor, constant: 5),
            selectClassStackView.trailingAnchor.constraint(equalTo: updateStudentBackgroundView.trailingAnchor, constant: -5),
            selectClassStackView.heightAnchor.constraint(equalTo: updateStudentBackgroundView.heightAnchor, multiplier: 0.06),
            
            searchStackView.topAnchor.constraint(equalTo: selectClassStackView.bottomAnchor , constant: 10),
            searchStackView.leadingAnchor.constraint(equalTo: updateStudentBackgroundView.leadingAnchor , constant: 5),
            searchStackView.trailingAnchor.constraint(equalTo: updateStudentBackgroundView.trailingAnchor , constant: -5),
            searchStackView.heightAnchor.constraint(equalTo: updateStudentBackgroundView.heightAnchor, multiplier: 0.06),
            
            selectClassLabel.heightAnchor.constraint(equalTo: selectClassStackView.heightAnchor, multiplier: 1),
            classDropDownButton.heightAnchor.constraint(equalTo: selectClassStackView.heightAnchor, multiplier: 1),
            searchButton.heightAnchor.constraint(equalTo: searchStackView.heightAnchor, multiplier: 1),
            rollNoTextField.heightAnchor.constraint(equalTo: searchStackView.heightAnchor, multiplier: 1),

            studentImage.centerXAnchor.constraint(equalTo: updateStudentBackgroundView.centerXAnchor),
            studentImage.widthAnchor.constraint(equalToConstant: 150),
            studentImage.topAnchor.constraint(equalTo: searchStackView.bottomAnchor , constant: 5),
            studentImage.heightAnchor.constraint(equalToConstant: 150),

            fieldsStackView.topAnchor.constraint(equalTo: studentImage.bottomAnchor , constant: 5),
            fieldsStackView.leadingAnchor.constraint(equalTo: updateStudentBackgroundView.leadingAnchor , constant: 30),
            fieldsStackView.trailingAnchor.constraint(equalTo: updateStudentBackgroundView.trailingAnchor , constant: -30),
//            fieldsStackView.heightAnchor.constraint(equalTo: updateStudentBackgroundView.heightAnchor, multiplier: 0.45),
            fieldsStackView.bottomAnchor.constraint(equalTo: updateStudentBackgroundView.safeAreaLayoutGuide.bottomAnchor , constant: -20),
            addPhotoLabel.centerXAnchor.constraint(equalTo: studentImage.centerXAnchor),
            addPhotoLabel.centerYAnchor.constraint(equalTo: studentImage.centerYAnchor , constant: 5),

//
        ])
        stopUserInteractionToField()
//        activityIndicator.startAnimating()

    }
    
    @objc func didTapChooseClass () {
        
        menu.show()
        menu.selectionAction = { [unowned self] (index: Int, item: String) in
            // Handle the user's selection here
            classDropDownButton.setTitle(item, for: .normal)
            print("User selected item \(item) at index \(index)")
            selectedClass = item
        }
    }
    
    let classesCollectionRef = Firestore.firestore().collection("Classes")
    let collectionRef = Firestore.firestore().collection("Classes")
    let studentRef = Firestore.firestore().collection("Students")

    func loadFieldIds() {
        
        classesCollectionRef.getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else {
                print("Error fetching documents: \(error!)")
                return
            }
            for document in snapshot.documents {
                let data = document.data()
                if let fieldId = data["id"] as? String {
                    self.fieldIds.append(fieldId)
                }
            }
            self.menu.dataSource = self.fieldIds
        }
    }
    
    
    var previousImageURLString : String?
    @objc func searchButtonPressed () {
        
        guard let rollNo = rollNoTextField.text, let reqClass = selectedClass , !rollNo.isEmpty , !reqClass.isEmpty else {
            print("empty")
            guard let reqClass = selectedClass , !reqClass.isEmpty else{
                generateAlert(largeTitle: "Woops", message: "Please Select Class" , title: "Ok")

                return
            }
            generateAlert(largeTitle: "Woops", message: "Please enter RollNo" , title: "Ok")
            return
        }
        activityIndicator.startAnimating()
        let query = studentRef.whereField("Class", isEqualTo: reqClass).whereField("Roll_No", isEqualTo: Int(rollNo)!)

        query.getDocuments { [weak self] (snapshot, error) in
            guard let strongSelf = self else {
                return
            }
            strongSelf.rollNoTextField.resignFirstResponder()
            if let error = error as NSError? {
                print("Error getting documents: \(error.localizedDescription)")
            }else{
                if let snapshot = snapshot {
                    if !snapshot.isEmpty {
                        for document in snapshot.documents {
                            print("\(document.documentID) => \(document.data())")
                            let data = document.data()
                            // access data fields as needed
                            strongSelf.previousImageURLString = data["ImageUrl"] as? String ?? ""
                            let name = data["Name"] as? String ?? "n"
                            let rollNo = data["Roll_No"] as? Int ?? 00
                            let age = data["Age"] as? String ?? "0"
                            let fName = data["Father Name"] as? String ?? "_"
                            let fatherEmail = data["Father Email"] as? String ?? "_"
                            let phNo = data["Phone No"] as? String ?? "_"
                            let address = data["Address"] as? String ?? "_"
                            
                            strongSelf.searchedStudentData.imageUrl = strongSelf.previousImageURLString!
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
                        strongSelf.setStudentsDataToFields()
                        strongSelf.startUserInteractionToField()
                        
                    } else {
                        strongSelf.clearStudentDataFields()
                        strongSelf.generateAlert(largeTitle: "Not Found", message: "Student Record Not Found" , title: "Ok")
                        strongSelf.stopUserInteractionToField()
                        print("No documents found")
                    }
                }
            }
        }
    }
    
    func setStudentsDataToFields(){
        if let imageUrl = URL(string: searchedStudentData.imageUrl){
            SDWebImageDownloader.shared.downloadImage(with: imageUrl , progress: nil) { image, _, error, _ in
                if let error = error{
                    print("Error loading Image \(error.localizedDescription)")
                }
                if let image = image {
                    self.addPhotoLabel.text = ""
                    self.studentImage.image = image
                    self.studentNameField.text = self.searchedStudentData.name
                    self.studentAgeField.text = self.searchedStudentData.age
                    self.FatherNameField.text = self.searchedStudentData.fName
                    self.FatherEmailField.text =  self.searchedStudentData.fEmail
                    self.FatherPhoneNoField.text =  self.searchedStudentData.phNo
                    self.studentAddressField.text =  self.searchedStudentData.address
                    self.activityIndicator.stopAnimating()
                }else{
                    print("Invalid URL")
                }
            }
        }
//        //download image using URLSession method
//        if let imageURL = URL(string: searchedStudentData.imageUrl) {
//            URLSession.shared.dataTask(with: imageURL) { data, response, error in
//                if let error = error {
//                    print("Error downloading image: \(error)")
//                    return
//                }
//                guard let data = data, let image = UIImage(data: data) else {
//                    print("Invalid image data")
//                    return
//                }
//                DispatchQueue.main.async {
//                    self.addPhotoLabel.text = ""
//                    self.studentImage.image = image
//                    self.studentNameField.text = self.searchedStudentData.name
//                    self.studentAgeField.text = self.searchedStudentData.age
//                    self.FatherNameField.text = self.searchedStudentData.fName
//                    self.FatherEmailField.text =  self.searchedStudentData.fEmail
//                    self.FatherPhoneNoField.text =  self.searchedStudentData.phNo
//                    self.studentAddressField.text =  self.searchedStudentData.address
//                    self.activityIndicator.stopAnimating()
//                }
//            }.resume()
//        } else {
//            print("Invalid image URL")
//        }
        
    }
    func clearStudentDataFields (){
        self.activityIndicator.stopAnimating()
        addPhotoLabel.text = "Add Photo"
        addPhotoLabel.backgroundColor = UIColor(named: "labelBackground")
        studentImage.image = UIImage(systemName: "person.circle")
        studentNameField.text = ""
        studentAgeField.text = ""
        FatherNameField.text = ""
        FatherEmailField.text = ""
        FatherPhoneNoField.text = ""
        studentAddressField.text = ""
        
    }
    func stopUserInteractionToField (){
        studentImage.isUserInteractionEnabled = false
        studentNameField.isUserInteractionEnabled = false
        studentAgeField.isUserInteractionEnabled = false
        FatherNameField.isUserInteractionEnabled = false
        FatherEmailField.isUserInteractionEnabled = false
        FatherPhoneNoField.isUserInteractionEnabled = false
        studentAddressField.isUserInteractionEnabled = false
        updateStudentButton.isUserInteractionEnabled = false
    }
    func startUserInteractionToField (){
        studentImage.isUserInteractionEnabled = true
        studentNameField.isUserInteractionEnabled = true
        studentAgeField.isUserInteractionEnabled = true
        FatherNameField.isUserInteractionEnabled = true
        FatherEmailField.isUserInteractionEnabled = true
        FatherPhoneNoField.isUserInteractionEnabled =  true
        studentAddressField.isUserInteractionEnabled = true
        updateStudentButton.isUserInteractionEnabled = true
    }
    
    func generateAlert(largeTitle: String , message : String , title : String ){
            
            let alert = UIAlertController(title: largeTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: title, style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    
    
    var isImageChanged = false
    
    @objc func studentImagePressed() {
        let alert = UIAlertController(title: "Select image source", message: "", preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // Present the UIImagePickerController with sourceType set to .camera
            alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { [weak self] _ in
            
                guard let strongSelf = self else {
                    return
                }
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.delegate = self
                picker.allowsEditing = true
                strongSelf.present(picker , animated: true)
            }))
        }
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { [weak self] _ in
            guard let strongSelf = self else {
                return
            }
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            picker.allowsEditing = true
            strongSelf.present(picker , animated: true)
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert , animated: true)
    }
    
    @objc private func updateStudentButtonTapped(){
        
        if !isImageChanged {
            imageData = studentImage.image?.pngData()
        }

        guard  let img = imageData , let studentName = studentNameField.text, let studentAge = studentAgeField.text, let fatherName = FatherNameField.text, let fatherEmail = FatherEmailField.text, let fatherPhNo = FatherPhoneNoField.text, let studentAddress = studentAddressField.text, let s_Class = selectedClass , let rollNoText = rollNoTextField.text , let previousImageURL = previousImageURLString ,
               !img.isEmpty , !studentName.isEmpty, !studentAge.isEmpty, !fatherName.isEmpty, !fatherEmail.isEmpty, !fatherPhNo.isEmpty, !studentAddress.isEmpty , !s_Class.isEmpty , !rollNoText.isEmpty , !previousImageURL.isEmpty else {

                   generateAlert(largeTitle: "Woops", message: "Please enter all information ", title: "Dismiss")
                   return
               }
        if let rollNo = Int(rollNoText){
            activityIndicator.startAnimating()
            stopUserInteractionToField()
            FirestoreManager.shared.updateStudent(studentRollNo: rollNo, studentClass: s_Class, isImageChanged: isImageChanged, previousImageURLString: previousImageURL, newImage: img, name: studentName, age: studentAge, FName: fatherName, FEmail: fatherEmail, phNo: fatherPhNo, address: studentAddress) { success in
                if self.isImageChanged {
                    self.isImageChanged = false
                }
                self.activityIndicator.stopAnimating()
                self.clearStudentDataFields()
                self.alertStudentUpdateSuccessfully()
            }
//            FirestoreManager.shared.registerStudent(image: self.imageData!, name: studentName, age: studentAge, FName: fatherName, FEmail: fatherEmail, phNo: fatherPhNo, address: studentAddress, studentClass: s_Class){ success in
//                
//                // Stop the animation of the activity indicator
//                self.activityIndicator.stopAnimating()
//                self.alertStudentUpdateSuccessfully()
//            }
        }
    }
//    func alertStudentRegisterError(){
//
//        let alert = UIAlertController(title: "Woops", message: "Please enter all information to log in", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
//        present(alert, animated: true)
//    }

    func alertStudentUpdateSuccessfully(){
        
        let alert = UIAlertController(title: "Updated", message: "Student Record Successfully Updated", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self] _ in
            guard let strongSelf = self else {
                return
            }
            strongSelf.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true)
    }
}
extension UpdateStudentViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        picker.dismiss(animated: true)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        guard let imageData = image.pngData() else{
            return
        }
        studentImage.image = image
        addPhotoLabel.text = ""
        addPhotoLabel.backgroundColor = .clear
        self.imageData = imageData
        isImageChanged = true
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true)
    }
}

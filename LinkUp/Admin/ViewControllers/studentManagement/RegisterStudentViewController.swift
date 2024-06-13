//
//  RegisterStudentViewController.swift
//  LinkUp
//
//  Created by Mac on 14/02/2023.
//

import Foundation
import UIKit
import FirebaseFirestore
import DropDown
import FirebaseStorage
class RegisterStudentViewController : UIViewController {
    
    var registerStudentContainerView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: "darkPurple")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var registerStudentBackgroundView : UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    @objc func studentImagePressed() {
        let alert = UIAlertController(title: "Choose", message: "Select image source", preferredStyle: .alert)
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
    
//    private let selectClassLabel : UITextView = {
//        let lbl = UITextView()
//        lbl.text = "Select Class"
//        lbl.textAlignment = .center
//        //        lbl.layer.borderWidth = 2
//        lbl.isUserInteractionEnabled = false
//
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        return lbl
//    }()
    var selectClassLabel : UILabel = {
        var lbl = UILabel()
        lbl.text = "Select Class"
        lbl.font = UIFont.boldSystemFont(ofSize: 23)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.layer.cornerRadius = 10
        lbl.layer.masksToBounds = true
        lbl.heightAnchor.constraint(equalToConstant: 45).isActive = true
        lbl.backgroundColor = UIColor(named: "mediumPurple")
        return lbl
    }()
//    private let classDropDownButton : UIButton = {
//        let button = UIButton()
//        button.setTitle(" Choose", for: .normal)
//        button.layer.borderWidth = 2
//        button.setTitleColor(.black, for: .normal)
//        button.contentHorizontalAlignment = .center
////        button.layer.borderColor = CGColor(gray: 20, alpha: 20)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(didTapChooseClass), for: .touchUpInside)
//        return button
//    }()
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
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        let arrowImage = UIImage(systemName: "chevron.down")
            button.setImage(arrowImage, for: .normal)
            button.semanticContentAttribute = .forceRightToLeft
            button.imageEdgeInsets = UIEdgeInsets(top: 2, left: 8, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(didTapChooseClass), for: .touchUpInside)
        return button
    }()

    private var selectedClass : String?
    
    private let registerStudentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = UIColor(named: "mediumPurple")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20 , weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(registerStudentButtonTapped), for: .touchUpInside)
        return button
    }()
    var fieldIds = [String]()
    
    let menu : DropDown = {
        let menu = DropDown()
        menu.backgroundColor = UIColor(named: "lightPurple")
        menu.textColor = .black
        menu.textFont = UIFont.boldSystemFont(ofSize: 16)
        return menu
    }()

    
    var activityIndicator: UIActivityIndicatorView = {
       var indicator = UIActivityIndicatorView()
        indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .gray
        return indicator
    }()

    
    private let storage = Storage.storage().reference()
    var imageData : Data?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register Student"
        view.backgroundColor = .white
        configureUI()
    }
    
    private func configureUI(){
        
        menu.anchorView = classDropDownButton
        menu.width = 80
        menu.bottomOffset = CGPoint(x: 35, y: classDropDownButton.bounds.height+50)
        menu.dataSource = fieldIds
        loadFieldIds()
        
        view.addSubview(registerStudentContainerView)
        registerStudentContainerView.addSubview(registerStudentBackgroundView)
        registerStudentBackgroundView.addSubview(studentImage)
        studentImage.addSubview(addPhotoLabel)
        
        registerStudentBackgroundView.addSubview(fieldsStackView)
        
        fieldsStackView.addArrangedSubview(studentNameField)
        fieldsStackView.addArrangedSubview(studentAgeField)
        fieldsStackView.addArrangedSubview(FatherNameField)
        fieldsStackView.addArrangedSubview(FatherEmailField)
        fieldsStackView.addArrangedSubview(FatherPhoneNoField)
        fieldsStackView.addArrangedSubview(studentAddressField)
        fieldsStackView.addArrangedSubview(selectClassStackView)
        fieldsStackView.addArrangedSubview(registerStudentButton)

        selectClassStackView.addArrangedSubview(selectClassLabel)
        selectClassStackView.addArrangedSubview(classDropDownButton)
        view.addSubview(activityIndicator)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(studentImagePressed))
        studentImage.addGestureRecognizer(tapGesture)

        NSLayoutConstraint.activate([
            
            registerStudentContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            registerStudentContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registerStudentContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            registerStudentContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            registerStudentBackgroundView.topAnchor.constraint(equalTo: registerStudentContainerView.safeAreaLayoutGuide.topAnchor),
            registerStudentBackgroundView.leadingAnchor.constraint(equalTo: registerStudentContainerView.leadingAnchor),
            registerStudentBackgroundView.trailingAnchor.constraint(equalTo: registerStudentContainerView.trailingAnchor),
            registerStudentBackgroundView.bottomAnchor.constraint(equalTo: registerStudentContainerView.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: registerStudentContainerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: registerStudentContainerView.centerYAnchor),
            
            studentImage.centerXAnchor.constraint(equalTo: registerStudentBackgroundView.centerXAnchor),
            studentImage.widthAnchor.constraint(equalToConstant: 150),
            studentImage.topAnchor.constraint(equalTo: registerStudentContainerView.safeAreaLayoutGuide.topAnchor),
            studentImage.heightAnchor.constraint(equalToConstant: 150),
            
            addPhotoLabel.centerXAnchor.constraint(equalTo: studentImage.centerXAnchor),
            addPhotoLabel.centerYAnchor.constraint(equalTo: studentImage.centerYAnchor , constant: 5),

            

            fieldsStackView.topAnchor.constraint(equalTo: studentImage.bottomAnchor , constant: 5),
            fieldsStackView.leadingAnchor.constraint(equalTo: registerStudentBackgroundView.leadingAnchor , constant: 30),
            fieldsStackView.trailingAnchor.constraint(equalTo: registerStudentBackgroundView.trailingAnchor , constant: -30),
//            fieldsStackView.heightAnchor.constraint(equalTo: registerStudentBackgroundView.heightAnchor, multiplier: 0.65),
            fieldsStackView.bottomAnchor.constraint(equalTo: registerStudentBackgroundView.safeAreaLayoutGuide.bottomAnchor , constant: -20),

        ])
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
    
    let collectionRef = Firestore.firestore().collection("Classes")
    
    func loadFieldIds() {
        
        collectionRef.getDocuments { (snapshot, error) in
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
    
    @objc private func registerStudentButtonTapped(){
        
        
        
        guard  let img = imageData , let studentName = studentNameField.text, let studentAge = studentAgeField.text, let fatherName = FatherNameField.text, let fatherEmail = FatherEmailField.text, let fatherPhNo = FatherPhoneNoField.text, let studentAddress = studentAddressField.text, let s_Class = selectedClass ,
               !img.isEmpty , !studentName.isEmpty, !studentAge.isEmpty, !fatherName.isEmpty, !fatherEmail.isEmpty, !fatherPhNo.isEmpty, !studentAddress.isEmpty , !s_Class.isEmpty else {
            alertStudentRegisterError()
            return
        }
        activityIndicator.startAnimating()
//        DispatchQueue.global(qos: .userInteractive).async {
//            FirestoreManager.shared.registerStudent( image : self.imageData! , name: studentName, age: studentAge, FName: fatherName, FEmail: fatherEmail, phNo: fatherPhNo, address: studentAddress, studentClass: s_Class)
//            DispatchQueue.main.async {
//                self.activityIndicator.stopAnimating()
////
//            }
//        }
//        DispatchQueue.global(qos: .userInteractive).async {
            FirestoreManager.shared.registerStudent(image: self.imageData!, name: studentName, age: studentAge, FName: fatherName, FEmail: fatherEmail, phNo: fatherPhNo, address: studentAddress, studentClass: s_Class){ success in
                
//                DispatchQueue.main.async {
                    // Stop the animation of the activity indicator
                    self.activityIndicator.stopAnimating()
                    self.alertStudentRegisterSuccessfully()

                    // Add any additional UI updates or code here
                    // ...
//                }
//            }
        }
            
    }
    func alertStudentRegisterError(){

        let alert = UIAlertController(title: "Woops", message: "Please enter all information to log in", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
//    func alertTeacherRegisterSuccessfully(){
//
//        let alert = UIAlertController(title: "Uploaded", message: "Teacher Registered Successfully", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self] _ in
//            guard let strongSelf = self else {
//                return
//            }
//
//            strongSelf.navigationController?.popViewController(animated: true)
//        }))
//        present(alert, animated: true)
//    }
    func alertStudentRegisterSuccessfully(){
        
        let alert = UIAlertController(title: "Uploaded", message: "Student Registered Successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self] _ in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true)
    }
}
extension RegisterStudentViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
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

    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true)
    }
    
}

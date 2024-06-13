//
//  UpdateTeacherViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 20/05/2023.
//

import Foundation
import UIKit

class UpdateTeacherViewController : UIViewController{
    
    
    private let teacherImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 75
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let addPhotoLabel : UILabel = {
       let label = UILabel()
        label.text = "Add Photo"
        label.backgroundColor = UIColor(named: "labelBackground")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let teacherRecordFieldsStackView : UIStackView = {
        let stackVIew = UIStackView()
        stackVIew.axis = .vertical
        stackVIew.spacing = 15
        stackVIew.distribution = .fillEqually
        stackVIew.translatesAutoresizingMaskIntoConstraints = false
        return stackVIew
    }()
    private let teacherNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Teacher Name..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    private let teacherQualificationField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Qualification..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    private let teacherEmailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    private let teacherCNICField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "CNIC..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let teacherPhoneNoField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Phone No..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let updateTeacherButton: UIButton = {
       let button = UIButton()
        button.setTitle("Update", for: .normal)
        button.backgroundColor = UIColor(named: "mediumPurple")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20 , weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(updateTeacherButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var activityIndicator : UIActivityIndicatorView = {
        var indicator = UIActivityIndicatorView()
        indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .gray
        return indicator
    }()
    
    
    var imageData : Data?
    var teacherID : Int = 00
    var previousImageURL : String = ""
    var isImageChanged = false
    var teachersRecordIndexPath : Int?
    
    //Main
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register Teacher"
        view.backgroundColor = .white
        configureUI()
    }
    //func
    private func configureUI() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(teacherImagePressed ) )
        teacherImage.addGestureRecognizer(tap)
        
        
        view.addSubview(teacherImage)
        teacherImage.addSubview(addPhotoLabel)
        view.addSubview(teacherRecordFieldsStackView)
        
        teacherRecordFieldsStackView.addArrangedSubview(teacherNameField)
        teacherRecordFieldsStackView.addArrangedSubview(teacherQualificationField)
        teacherRecordFieldsStackView.addArrangedSubview(teacherEmailField)
        teacherRecordFieldsStackView.addArrangedSubview(teacherCNICField)
        teacherRecordFieldsStackView.addArrangedSubview(teacherPhoneNoField)
        teacherRecordFieldsStackView.addArrangedSubview(updateTeacherButton)
        view.addSubview(activityIndicator)


        NSLayoutConstraint.activate([

            teacherImage.centerXAnchor.constraint(equalTo: view.centerXAnchor , constant: 10),
            teacherImage.widthAnchor.constraint(equalToConstant: 150),
            teacherImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 15),
            teacherImage.heightAnchor.constraint(equalToConstant: 150),
            
            addPhotoLabel.centerXAnchor.constraint(equalTo: teacherImage.centerXAnchor),
            addPhotoLabel.centerYAnchor.constraint(equalTo: teacherImage.centerYAnchor , constant: 5),
            
            teacherRecordFieldsStackView.topAnchor.constraint(equalTo: teacherImage.bottomAnchor , constant: 10),
            teacherRecordFieldsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 30),
            teacherRecordFieldsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -30),
            teacherRecordFieldsStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    @objc func teacherImagePressed(){
        print("dpne")
        var alert = UIAlertController(title: "Choose", message: "Select Image Source", preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            alert.addAction(UIAlertAction(title: "Camera", style: .default , handler: { [weak self] _ in
                guard let strongSelf = self else {
                    return
                }
                let imagePicker = UIImagePickerController()
                imagePicker.sourceType = .camera
                imagePicker.delegate = self
                imagePicker.allowsEditing = true
                strongSelf.present(imagePicker , animated: true)
            }))
        }
        alert.addAction(UIAlertAction(title: "Gallery", style: .default , handler: { [weak self] _ in
            guard let strongSelf = self else {
                return
            }
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            strongSelf.present(imagePicker , animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert , animated: true)
    }
    @objc private func updateTeacherButtonTapped(){
        
        if !isImageChanged{
            imageData = teacherImage.image?.pngData()
        }
        
        guard  let image = imageData  , let teacherName = teacherNameField.text, let teacherQualification = teacherQualificationField.text, let teacherEmail = teacherEmailField.text, let teacherCNIC = teacherCNICField.text, let teacherPhNo = teacherPhoneNoField.text,
             !image.isEmpty , !teacherName.isEmpty, !teacherQualification.isEmpty, !teacherEmail.isEmpty, !teacherCNIC.isEmpty, !teacherPhNo.isEmpty else {
            generateAlert(largeTitle: "Woops", message: "Please enter all information to log in", title: "Dismiss")
            return
        }
        if teacherID != 00{
            print("received teacherId \(teacherID)")
        }
        activityIndicator.startAnimating()
        disableUserInteraction()
        FirestoreManager.shared.updateTeacher(teacherID: teacherID, teacherImage: image, previousImageURLString: previousImageURL, isImageChanged: isImageChanged, name: teacherName, qualification: teacherQualification, email: teacherEmail, cnic: teacherCNIC, phNo: teacherPhNo) { success in
            if success {
                if self.isImageChanged {
                    self.isImageChanged = false
                    TeacherDataModelForAdmin.teacherImageArray[self.teachersRecordIndexPath!] = self.teacherImage.image!
                }
//                var updatedTeacherRecord = TeacherDataModelForAdmin()
//                updatedTeacherRecord.name = teacherName
//                updatedTeacherRecord.qualification = teacherQualification
//                updatedTeacherRecord.email = teacherEmail
//                updatedTeacherRecord.cNIC = teacherCNIC
//                updatedTeacherRecord.phNo = teacherPhNo
////                updatedTeacherRecord.assignedClass = TeacherDataModelForAdmin.records[self.teachersRecordIndexPath!].assignedClass
//
//                TeacherDataModelForAdmin.records[self.teachersRecordIndexPath!] = updatedTeacherRecord
//                self.activityIndicator.stopAnimating()
//                var newData = TeacherDataModelForAdmin()
//                newData.name = teacherName
//                newData.qualification = teacherQualification
//                newData.cNIC = teacherCNIC
//                newData.phNo = teacherPhNo
//                newData.email = teacherEmail
//                TeacherDataModelForAdmin.records[self.teachersRecordIndexPath!] = newData
                print(TeacherDataModelForAdmin.records[self.teachersRecordIndexPath!])
                TeacherDataModelForAdmin.records[self.teachersRecordIndexPath!].name = teacherName
                TeacherDataModelForAdmin.records[self.teachersRecordIndexPath!].qualification = teacherQualification
                TeacherDataModelForAdmin.records[self.teachersRecordIndexPath!].cNIC = teacherCNIC
                TeacherDataModelForAdmin.records[self.teachersRecordIndexPath!].phNo = teacherPhNo
                TeacherDataModelForAdmin.records[self.teachersRecordIndexPath!].email = teacherEmail
                
                print(TeacherDataModelForAdmin.records[self.teachersRecordIndexPath!])
                self.alertTeacherUpdateSuccessfully()
                
            }
        }
    }
    func generateAlert( largeTitle : String , message : String , title : String ){
        let alert = UIAlertController(title: largeTitle , message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: title, style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    func alertTeacherUpdateSuccessfully(){
        
        let alert = UIAlertController(title: "Updated", message: "Teacher Update Successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self] _ in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true)
    }
    func disableUserInteraction(){
        teacherNameField.isUserInteractionEnabled = false
        teacherImage.isUserInteractionEnabled = false
        teacherQualificationField.isUserInteractionEnabled = false
        teacherEmailField.isUserInteractionEnabled = false
        teacherCNICField.isUserInteractionEnabled = false
        teacherPhoneNoField.isUserInteractionEnabled = false
    }
    func setTeacherFieldsData( data: TeacherDataModelForAdmin , image: UIImage , rowIndex : Int){
        addPhotoLabel.text = ""
        addPhotoLabel.backgroundColor = .clear
        teacherImage.image = image
        teacherNameField.text = data.name
        teacherQualificationField.text = data.qualification
        teacherCNICField.text = data.cNIC
        teacherEmailField.text = data.email
        teacherPhoneNoField.text = data.phNo
        teacherID = Int(data.teacherId)
        previousImageURL = data.imageUrl
        teachersRecordIndexPath = rowIndex
    }
}

extension UpdateTeacherViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        guard let imageData = image.pngData() else {
            return
        }
        teacherImage.image = image
        addPhotoLabel.text = ""
        addPhotoLabel.backgroundColor = .clear
        self.imageData = imageData
        isImageChanged = true
        if teachersRecordIndexPath != nil  {
            //adding image to image list
            
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true)
    }
    
}

//
//  LoginViewController.swift
//  LinkUp
//
//  Created by Mac on 12/02/2023.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabase
import SDWebImage

class LoginViewController: UIViewController {

    let db = Firestore.firestore()
    
    private let logoImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email Address..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        
        field.text = "student1@gmail.com"
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.isSecureTextEntry = true
        field.text = "123456"
        return field
    }()
    
    private let loginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20 , weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Utilities.isInternetConnected() {
            configureUI()
        } else {
            print(NetworkError.noInternet)
        }
    }
    
    func configureUI(){
        view.backgroundColor = .systemBackground
        self.title = "Log In"
        navigationController?.navigationBar.backgroundColor = UIColor(named: "darkPurple")
  
        emailField.delegate = self
        passwordField.delegate = self
        view.addSubview(logoImage)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)

        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 60),
            logoImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33, constant: 0),
            
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailField.topAnchor.constraint(equalTo: logoImage.bottomAnchor ),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -30),
            emailField.heightAnchor.constraint(equalToConstant: 52),
            
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 30 ),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -30),
            passwordField.heightAnchor.constraint(equalToConstant: 52),
            
            
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20 ),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -30),
            loginButton.heightAnchor.constraint(equalToConstant: 52),
            
        ])
    }
    
//    @objc private func didTapRegister() {
//        let vc = RegisterViewController()
//        vc.title = "Create Account"
//        navigationController?.pushViewController(vc, animated: true)
//    }
//
    @objc private func loginButtonTapped(){
        
        
                
        
//        let rootVC =  ParentTabBarViewController()
//        let navVC  = UINavigationController(rootViewController: rootVC)
//        navVC.modalPresentationStyle = .fullScreen
//        present(navVC, animated: true)
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        var rootViewController: UIViewController?


        guard let email = emailField.text, let password = passwordField.text,
              !email.isEmpty, !password.isEmpty, password.count >= 6 else {
                  alertUserLoginError()
            return
        }
        //Firebase Login

        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else {
                return
            }
            guard let result = authResult , error == nil else {
                print("Faild to log in user with email: \(email)")
                return
            }
            let user = result.user
            print("Logged in User \(user)")
            if let user = Auth.auth().currentUser {
                let uid = user.uid
                print("Logged-in user's UID: \(uid)")
//                strongSelf.checkIfUserIsAdmin(id: uid )
                FirestoreManager.shared.loadAdminRecord()
                strongSelf.db.collection("Admin").document(uid).getDocument {  (document, error) in
                    if let document = document, document.exists {
                        // The user is an admin
                        print("User is an admin")
                        let data = document.data()
                        AdminData.shared.name = data!["Name"] as? String ?? "n"
                        AdminData.shared.email = data!["Email"] as? String ?? "n"


                        rootViewController = AdminTabBarViewController()
                        strongSelf.makeRootViewController(rootViewController: rootViewController!)

                    } else {
                        // The user is not an admin
//                        self.checkIfUserIsTeacher(id : id)
//                        strongSelf.db.collection("Teacher").document(uid).getDocument { (document, error) in
                        strongSelf.db.collection("Teacher").whereField("Email", isEqualTo: email).getDocuments { snapshot, error in

                            if let document = snapshot?.documents.first {
                                        // Document found
                                        print("Document data: \(document.data())")
                                        // Call getDocument() on the reference to retrieve the single document
                                        document.reference.getDocument { (documentSnapshot, error) in
                                            if let error = error {
                                                print("Error getting document: \(error)")
                                            } else {
                                                if let document = documentSnapshot, document.exists {
                                                    // Document exists
                                                    print("Document data: \(String(describing: document.data()))")
                                                    print("User is a teacher")
                                                    let data = document.data()
                                                    TeacherDataModel.shared.name = data!["Name"] as? String ?? ""
                                                    TeacherDataModel.shared.teacherID = data!["teacherID"] as? Int ?? 00
                                                    TeacherDataModel.shared.cNIC = data!["CNIC"] as? String ?? ""
                                                    TeacherDataModel.shared.qualification = data!["Qualification"] as? String ?? ""
                                                    TeacherDataModel.shared.email = data!["Email"] as? String ?? ""
                                                    TeacherDataModel.shared.phoneNo = data!["Phone No"] as? String ?? ""
                                                    TeacherDataModel.shared.assignedClass = data!["AssignedClass"] as? String ?? ""
                                                    TeacherDataModel.shared.imageUrl = data!["ImageUrl"] as? String ?? ""

                                                    if let imageUrl = URL(string: TeacherDataModel.shared.imageUrl){
                                                        SDWebImageDownloader.shared.downloadImage(with: imageUrl, progress: nil) { image, _, error, _ in
                                                            if let error = error {
                                                                print("Error loading Image \(error.localizedDescription)")
                                                            }
                                                            if let image = image {
                                                                TeacherDataModel.shared.image = image
//                                                                rootViewController = ParentTabBarViewController()
//                                                                self?.makeRootViewController(rootViewController: rootViewController!)
                                                                rootViewController = TeacherTabBarViewController()
                                                                strongSelf.makeRootViewController(rootViewController: rootViewController!)
                                                            }
                                                        }
                                                    }
//                                                    rootViewController = TeacherTabBarViewController()
//                                                    strongSelf.makeRootViewController(rootViewController: rootViewController!)
                                                } else {
                                                    // Document does not exist
                                                    print("Document does not exist")
                                                    print("User is not an a teacher")

                                                }
                                            }
                                        }
                                    } else {
                                        strongSelf.db.collection("Students").whereField("Father Email", isEqualTo: email).getDocuments { snapshot, error in
                                            if let document = snapshot?.documents.first {
                                                print("Document data: \(document.data())")
                                                var data = document.data()
                                                ParentRecordModel.shared.studentRollNo = data["Roll_No"] as? Int ?? 00
                                                ParentRecordModel.shared.studentName = data["Name"] as? String ?? ""
                                                ParentRecordModel.shared.studentDOB = data["Age"] as? String ?? ""
                                                ParentRecordModel.shared.studentClass = data["Class"] as? String ?? ""
                                                ParentRecordModel.shared.fatherName = data["Father Name"] as? String ?? ""
                                                ParentRecordModel.shared.fatherEmail = data["Email"] as? String ?? ""
                                                ParentRecordModel.shared.fatherPhoneNo = data["Phone No"] as? String ?? ""
                                                ParentRecordModel.shared.address = data["Address"] as? String ?? ""
                                                ParentRecordModel.shared.imageURL = data["ImageUrl"] as? String ?? ""

                                                if let imageUrl = URL(string: ParentRecordModel.shared.imageURL){
                                                    SDWebImageDownloader.shared.downloadImage(with: imageUrl, progress: nil) { image, _, error, _ in
                                                        if let error = error {
                                                            print("Error loading Image \(error.localizedDescription)")
                                                        }
                                                        if let image = image {
                                                            ParentRecordModel.shared.studentImage = image
                                                            rootViewController = ParentTabBarViewController()
                                                            self?.makeRootViewController(rootViewController: rootViewController!)
                                                        }
                                                    }
                                                }


                                            } else {
                                                print("User is not an admin or a teacher and not an Parent")

                                            }
                                        }
                                    }
                        }
                    }
                }

            } else {
                print("No user is currently logged in.")
            }
        }
    }

    private func makeRootViewController( rootViewController : UIViewController ){
        
////        UIApplication.shared.keyWindow?.rootViewController = rootViewController
//        navigationController?.dismiss(animated: true)
////        var navController = UINavigationController
//        let vc = rootViewController
//        let navController = UINavigationController(rootViewController: vc)
//        UIApplication.shared.keyWindow?.rootViewController = navController
////        vc.modalPresentationStyle = .fullScreen
////        present(vc , animated: true)
        
        
        let rootVC = rootViewController
        guard let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        else {
            return
        }
        scene.window?.rootViewController = rootVC
        scene.window?.makeKeyAndVisible()
    }

    func alertUserLoginError(){
        let alert = UIAlertController(title: "Woops", message: "Please enter all information to log in", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }


}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == emailField{
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            loginButtonTapped()
        }
        return true
    }
}

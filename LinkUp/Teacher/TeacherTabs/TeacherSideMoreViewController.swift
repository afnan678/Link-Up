//
//  TeacherProfileViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 17/04/2023.
//

import Foundation
import UIKit
import Firebase

class TeacherSideMoreViewController : UIViewController {
    let topView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "darkPurple")
        return view
    }()
    
    let bottonView : UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
        
    }()
    
    var optionsStackView : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .red
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 5
        return view
        
    }()
    
    
    
//    lable
    var profile_lable : UILabel = {
       
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "More"
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 25.0)
        return lbl
    }()
    var userNameLabel : UILabel = {
       
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = TeacherDataModel.shared.name
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        lbl.layer.shadowColor = UIColor.black.cgColor
        lbl.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        lbl.layer.shadowOpacity = 0.5
        lbl.layer.shadowRadius = 2
        lbl.layer.masksToBounds = false
        return lbl
    }()
    
//    var Blank_lable : UILabel = {
//
//        var lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 130, height: 130))
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "Edit Profile"
//        lbl.backgroundColor = .black
//        lbl.textColor = .white
//        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
//        lbl.layer.shadowColor = UIColor.black.cgColor
//        lbl.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
//        lbl.layer.shadowOpacity = 1
//        lbl.layer.shadowRadius = 2
//        lbl.layer.masksToBounds = false
//        lbl.layer.cornerRadius = 130
////        lbl.layer.cornerRadius = l
//        lbl.layer.borderWidth = 1
//        lbl.clipsToBounds = true
//        lbl.layer.borderColor = UIColor.white.cgColor
//        return lbl
//    }()
    
    //image
    var profile_ImageView : UIImageView = {
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
        img.image = TeacherDataModel.shared.image
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
        
    }()
    
//    Button
    var homeButton : UIButton = {
        let bttn = UIButton(type: .system)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = .white
        bttn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        bttn.setTitle("  Home", for: .normal)
        bttn.setTitleColor(.black, for: .normal)
        bttn.setImage(UIImage(systemName: "house"),for: .normal)
        bttn.tintColor = UIColor(named: "darkPurple")
        bttn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        bttn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        bttn.layer.cornerRadius = 10
        bttn.layer.shadowColor = UIColor.black.cgColor
        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        bttn.layer.shadowOpacity = 0.1
        bttn.layer.shadowRadius = 2
        bttn.layer.masksToBounds = false
        bttn.addTarget( self, action: #selector(homeButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
    
    
    var profileButton : UIButton = {
        let bttn = UIButton(type: .system)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = .white
        bttn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        bttn.setTitle("  Profile", for: .normal)
        bttn.setTitleColor(.black, for: .normal)
        bttn.setImage(UIImage(systemName: "person.fill"),for: .normal)
        bttn.tintColor = UIColor(named: "darkPurple")
        bttn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        bttn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        bttn.layer.cornerRadius = 10
        bttn.layer.shadowColor = UIColor.black.cgColor
        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        bttn.layer.shadowOpacity = 0.1
        bttn.layer.shadowRadius = 2
        bttn.layer.masksToBounds = false
        bttn.addTarget( self, action: #selector(profileButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
    
    var CalenderButton : UIButton = {
        let bttn = UIButton(type: .system)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = .white
        bttn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        bttn.setTitle("  Calender", for: .normal)
        bttn.setTitleColor(.black, for: .normal)
        bttn.setImage(UIImage(systemName: "calendar"),for: .normal)
        bttn.tintColor = UIColor(named: "darkPurple")
        bttn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        bttn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        bttn.layer.cornerRadius = 10
        bttn.layer.shadowColor = UIColor.black.cgColor
        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        bttn.layer.shadowOpacity = 0.1
        bttn.layer.shadowRadius = 2
        bttn.layer.masksToBounds = false
        bttn.addTarget( self, action: #selector(CalenderButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
    
    
    var NotificationButton : UIButton = {
        let bttn = UIButton(type: .system)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = .white
        bttn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        bttn.setTitle("  Notification", for: .normal)
        bttn.setTitleColor(.black, for: .normal)
        bttn.setImage(UIImage(systemName: "bell.badge"),for: .normal)
        bttn.tintColor = UIColor(named: "darkPurple")
        bttn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        bttn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        bttn.layer.cornerRadius = 10
        bttn.layer.shadowColor = UIColor.black.cgColor
        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        bttn.layer.shadowOpacity = 0.1
        bttn.layer.shadowRadius = 2
        bttn.layer.masksToBounds = false
        bttn.addTarget( self, action: #selector(NotificationButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
    
    var settingButton : UIButton = {
        let bttn = UIButton(type: .system)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = .white
        bttn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        bttn.setTitle("  Setting", for: .normal)
        bttn.setTitleColor(.black, for: .normal)
        bttn.setImage(UIImage(systemName: "staroflife.fill"),for: .normal)
        bttn.tintColor = UIColor(named: "darkPurple")
        bttn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        bttn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        bttn.layer.cornerRadius = 10
        bttn.layer.shadowColor = UIColor.black.cgColor
        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        bttn.layer.shadowOpacity = 0.1
        bttn.layer.shadowRadius = 2
        bttn.layer.masksToBounds = false
        bttn.addTarget( self, action: #selector(settingButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
    
    
    var adminInfoButton : UIButton = {
        let bttn = UIButton(type: .system)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = .white
        bttn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        bttn.setTitle("  Admin info", for: .normal)
        bttn.setTitleColor(.black, for: .normal)
        bttn.setImage(UIImage(systemName: "person.bust.fill"),for: .normal)
        bttn.tintColor = UIColor(named: "darkPurple")
        bttn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        bttn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        bttn.layer.cornerRadius = 10
        bttn.layer.shadowColor = UIColor.black.cgColor
        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        bttn.layer.shadowOpacity = 0.1
        bttn.layer.shadowRadius = 2
        bttn.layer.masksToBounds = false
        bttn.addTarget( self, action: #selector(adminInfoButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
    
    
    var logoutButton : UIButton = {
        let bttn = UIButton(type: .system)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = .white
        bttn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        bttn.setTitle("  Log out", for: .normal)
        bttn.setTitleColor(.black, for: .normal)
        bttn.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.forward"),for: .normal)
        bttn.tintColor = UIColor(named: "darkPurple")
        bttn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        bttn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        bttn.layer.cornerRadius = 10
        bttn.layer.shadowColor = UIColor.black.cgColor
        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        bttn.layer.shadowOpacity = 0.1
        bttn.layer.shadowRadius = 2
        bttn.layer.masksToBounds = false
        bttn.addTarget( self, action: #selector(logoutButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        print(TeacherDataModel.shared.name)
//        title = "More"
        ConfigureUI()

    }
    
    
    
    func ConfigureUI ()
    {
        print(TeacherDataModel.shared.name)

        view.addSubview(topView)
        view.addSubview(bottonView)
        bottonView.addSubview(optionsStackView)
        topView.addSubview(profile_lable)
        topView.addSubview(profile_ImageView)
        topView.addSubview(userNameLabel)
        optionsStackView.addArrangedSubview(homeButton)
        optionsStackView.addArrangedSubview(profileButton)
        optionsStackView.addArrangedSubview(CalenderButton)
        optionsStackView.addArrangedSubview(NotificationButton)
        optionsStackView.addArrangedSubview(settingButton)
        optionsStackView.addArrangedSubview(adminInfoButton)
        optionsStackView.addArrangedSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            
            topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
            
            bottonView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 1),
            bottonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottonView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.60),
            
            optionsStackView.topAnchor.constraint(equalTo: bottonView.topAnchor),
            optionsStackView.leadingAnchor.constraint(equalTo: bottonView.leadingAnchor),
            optionsStackView.trailingAnchor.constraint(equalTo: bottonView.trailingAnchor),
            optionsStackView.bottomAnchor.constraint(equalTo: bottonView.bottomAnchor),
            optionsStackView.widthAnchor.constraint(equalTo: bottonView.widthAnchor),
                        
            
            profile_lable.topAnchor.constraint(equalTo: topView.topAnchor, constant: 56),
            profile_lable.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            profile_lable.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03),
            
            userNameLabel.topAnchor.constraint(equalTo: profile_ImageView.bottomAnchor, constant: 10),
            userNameLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            userNameLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03),
            
            
            
            profile_ImageView.topAnchor.constraint(equalTo: profile_lable.bottomAnchor,constant: 16),
            profile_ImageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            profile_ImageView.heightAnchor.constraint(equalToConstant: 130),
            profile_ImageView.widthAnchor.constraint(equalToConstant: 130),

            
            
            homeButton.widthAnchor.constraint(equalTo: optionsStackView.widthAnchor),
            homeButton.heightAnchor.constraint(equalToConstant: 55),
            
            profileButton.widthAnchor.constraint(equalTo: optionsStackView.widthAnchor),
            profileButton.heightAnchor.constraint(equalToConstant: 55),
            
            CalenderButton.widthAnchor.constraint(equalTo: optionsStackView.widthAnchor),
            CalenderButton.heightAnchor.constraint(equalToConstant: 55),
            
            NotificationButton.widthAnchor.constraint(equalTo: optionsStackView.widthAnchor),
            NotificationButton.heightAnchor.constraint(equalToConstant: 55),
            
            settingButton.widthAnchor.constraint(equalTo: optionsStackView.widthAnchor),
            settingButton.heightAnchor.constraint(equalToConstant: 55),
            
            adminInfoButton.widthAnchor.constraint(equalTo: optionsStackView.widthAnchor),
            adminInfoButton.heightAnchor.constraint(equalToConstant: 55),
            
            logoutButton.widthAnchor.constraint(equalTo: optionsStackView.widthAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: 55),
        
        ])
        
        
    }

    //Functions
    @objc func homeButtonPressed(){

//        let vc = AdminTabBarViewController()
//        vc.modalPresentationStyle = .fullScreen
//        present(vc , animated: true)
//        self.navigationController?.viewControllers.removeAll()

    }
    @objc func profileButtonPressed(){
        
    }
    @objc func CalenderButtonPressed(){
        
    }
    @objc func NotificationButtonPressed(){
        
    }
    @objc func settingButtonPressed(){
        
    }
    @objc func adminInfoButtonPressed(){
        
    }
    @objc func logoutButtonPressed(){

        
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc , animated: true)
        do {
                // Sign out from Firebase Authentication
                try Auth.auth().signOut()
                
                // Reset the user interface (e.g., navigate to the sign-in screen)
                resetUserInterface()
            } catch {
                // Handle sign-out error
                print("Error signing out: \(error.localizedDescription)")
            }
        self.navigationController?.viewControllers.removeAll()
        
    }
    func resetUserInterface(){
        StudentDataModelForTeacher.studentArray.removeAll()
        TeacherDataModel.shared.name = ""
        TeacherDataModel.shared.teacherID = 0
        TeacherDataModel.shared.cNIC = ""
        TeacherDataModel.shared.qualification = ""
        TeacherDataModel.shared.email = ""
        TeacherDataModel.shared.phoneNo = ""
        TeacherDataModel.shared.assignedClass = ""
        TeacherDataModel.shared.imageUrl = ""
        TeacherDataModel.shared.image = nil

    }

}

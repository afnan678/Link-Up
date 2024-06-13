//
//  ClassesManagementViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 06/06/2023.
//

import Foundation
import UIKit

class ClassesManagementViewController: UIViewController {
    
    var studentManagementContainerView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: "darkPurple")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var studentManagementBackgroundView : UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var managementOptionBackgroundView : UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var studentManagementLabel : UILabel = {
       
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Classes Managment"
        lbl.textColor = UIColor(named: "mediumPurple")
        lbl.font = UIFont.boldSystemFont(ofSize: 25.0)
        return lbl
    }()
    
    var managementOptionsStackView : UIStackView = {
       let obj = UIStackView()
        obj.axis = .vertical
        obj.distribution = .fillEqually
//        obj.backgroundColor = .systemBackground
        obj.spacing = 40
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    let topView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    
    
    //    lable
//        var studentManagementLabel : UILabel = {
//
//            var lbl = UILabel()
//            lbl.translatesAutoresizingMaskIntoConstraints = false
//            lbl.text = "Student Managment"
//            lbl.textColor = UIColor(named: "mediumPurple")
//            lbl.font = UIFont.boldSystemFont(ofSize: 25.0)
//            return lbl
//        }()
    

    
    //    Button
        var previewClasses : UIButton = {
            let bttn = UIButton(type: .system)
            bttn.translatesAutoresizingMaskIntoConstraints = false
            bttn.backgroundColor = UIColor(named: "mediumPurple")
            bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            bttn.setTitle("     Preview Classes", for: .normal)
            bttn.setTitleColor(.systemBackground, for: .normal)
            
            var imag = UIImage(systemName: "house")
            let c = UIColor.white
            let largeFont = UIFont.systemFont(ofSize: 30)
            let configuration = UIImage.SymbolConfiguration(font: largeFont)
            imag = UIImage(systemName: "person.circle.fill", withConfiguration: configuration)?.withTintColor(c, renderingMode: .alwaysOriginal)
            bttn.setImage(imag, for: .normal)
            bttn.imageView?.contentMode = .scaleAspectFit
            bttn.tintColor = .white
            bttn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            bttn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
            bttn.layer.cornerRadius = 10
            bttn.addTarget( self, action: #selector(previewClassesPressed), for: .touchUpInside)
            return bttn
            
        }()
        
    
        var assigningTeacher : UIButton = {
            let bttn = UIButton(type: .system)
            bttn.translatesAutoresizingMaskIntoConstraints = false
            bttn.backgroundColor = UIColor(named: "mediumPurple")
            bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            bttn.setTitle("     Assigning Teacher", for: .normal)
            bttn.setTitleColor(.white, for: .normal)
            
            
            var imag = UIImage(systemName: "house")
            let c = UIColor.white
            let largeFont = UIFont.systemFont(ofSize: 30)
            let configuration = UIImage.SymbolConfiguration(font: largeFont)
            imag = UIImage(systemName: "person.circle.fill", withConfiguration: configuration)?.withTintColor(c, renderingMode: .alwaysOriginal)
            bttn.setImage(imag, for: .normal)
            bttn.tintColor = .white
            bttn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            bttn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
            bttn.layer.cornerRadius = 10
            bttn.layer.shadowColor = UIColor.black.cgColor
            bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
            bttn.layer.shadowOpacity = 0.1
            bttn.layer.shadowRadius = 2
            bttn.layer.masksToBounds = false
            bttn.addTarget( self, action: #selector(assigningTeacherPressed), for: .touchUpInside)
            return bttn
            
        }()
    
    
    var removeStudentButton : UIButton = {
        let bttn = UIButton(type: .system)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = UIColor(named: "mediumPurple")
        bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        bttn.setTitle("     Remove Student", for: .normal)
        bttn.setTitleColor(.white, for: .normal)
        
        
        var imag = UIImage(systemName: "house")
        let c = UIColor.white
        let largeFont = UIFont.systemFont(ofSize: 30)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        imag = UIImage(systemName: "person.circle.fill", withConfiguration: configuration)?.withTintColor(c, renderingMode: .alwaysOriginal)
        bttn.setImage(imag, for: .normal)
        bttn.tintColor = .white
        bttn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        bttn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        bttn.layer.cornerRadius = 10
        bttn.layer.shadowColor = UIColor.black.cgColor
        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        bttn.layer.shadowOpacity = 0.1
        bttn.layer.shadowRadius = 2
        bttn.layer.masksToBounds = false
        bttn.addTarget( self, action: #selector(removeStudentButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
    
    
    var searchStudentButton : UIButton = {
        let bttn = UIButton(type: .system)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = UIColor(named: "mediumPurple")
        bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        bttn.setTitle("     Search Student", for: .normal)
        bttn.setTitleColor(.white, for: .normal)
        
        
        var imag = UIImage(systemName: "house")
        let c = UIColor.white
        let largeFont = UIFont.systemFont(ofSize: 30)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        imag = UIImage(systemName: "person.circle.fill", withConfiguration: configuration)?.withTintColor(c, renderingMode: .alwaysOriginal)
        bttn.setImage(imag, for: .normal)
        bttn.tintColor = .white
        bttn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        bttn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        bttn.layer.cornerRadius = 10
        bttn.layer.shadowColor = UIColor.black.cgColor
        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        bttn.layer.shadowOpacity = 0.1
        bttn.layer.shadowRadius = 2
        bttn.layer.masksToBounds = false
        bttn.addTarget( self, action: #selector(searchStudentButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
   
    
    var nextButton : UIButton = {
        let bttn = UIButton(type: .system)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = UIColor(named: "mediumPurple")
        bttn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        bttn.setTitle("NEXT", for: .normal)
        bttn.titleLabel?.textAlignment = .center
        bttn.setTitleColor(.white, for: .normal)
        bttn.tintColor = .white
        bttn.layer.cornerRadius = 10
        bttn.layer.shadowColor = UIColor.black.cgColor
        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        bttn.layer.shadowOpacity = 0.25
        bttn.layer.shadowRadius = 2
        bttn.layer.masksToBounds = false
//        bttn.addTarget( self, action: #selector(nextButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
    
    var navBarBackButton : UIButton = {
        var backButton = UIButton(type: .custom)
        backButton.setImage( UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.setTitle(" Back", for: .normal)
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
        backButton.sizeToFit()
        backButton.isUserInteractionEnabled = true
        return backButton
    }()

    private var selectedOption : String = "register"


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Management"
        ConfigureUI()
    
    }
    
    func ConfigureUI ()
    {
        //setting navBar
//        navBarBackButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navBarBackButton)
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        navigationController?.navigationBar.tintColor = .white
//        navigationController?.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        view.backgroundColor = .systemBackground
       
//        view.addSubview(topView)
//        topView.addSubview(studentManagementLabel)
//        topView.addSubview(previewClasses)
//        topView.addSubview(assigningTeacher)
//        topView.addSubview(removeStudentButton)
//        topView.addSubview(searchStudentButton)
//        topView.addSubview(nextButton)
        view.addSubview(studentManagementContainerView)
        studentManagementContainerView.addSubview(studentManagementBackgroundView)
        studentManagementBackgroundView.addSubview(studentManagementLabel)
        studentManagementBackgroundView.addSubview(managementOptionBackgroundView)
        
//        managementOptionBackgroundView.addSubview(previewClasses)
//        managementOptionBackgroundView.addSubview(assigningTeacher)
//        managementOptionBackgroundView.addSubview(assigningTeacher)
//        managementOptionBackgroundView.addSubview(searchStudentButton)
        managementOptionBackgroundView.addSubview(managementOptionsStackView)
//
        managementOptionsStackView.addArrangedSubview(previewClasses)
        managementOptionsStackView.addArrangedSubview(assigningTeacher)
//        managementOptionsStackView.addArrangedSubview(removeStudentButton)
//        managementOptionsStackView.addArrangedSubview(searchStudentButton)

        NSLayoutConstraint.activate([
            
            studentManagementContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            studentManagementContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            studentManagementContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            studentManagementContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor ),
            
            studentManagementBackgroundView.topAnchor.constraint(equalTo: studentManagementContainerView.safeAreaLayoutGuide.topAnchor),
            studentManagementBackgroundView.leadingAnchor.constraint(equalTo: studentManagementContainerView.leadingAnchor),
            studentManagementBackgroundView.trailingAnchor.constraint(equalTo: studentManagementContainerView.trailingAnchor),
            studentManagementBackgroundView.bottomAnchor.constraint(equalTo: studentManagementContainerView.bottomAnchor),
            
            studentManagementLabel.bottomAnchor.constraint(equalTo: managementOptionBackgroundView.topAnchor , constant: -40),
            studentManagementLabel.centerXAnchor.constraint(equalTo: studentManagementBackgroundView.centerXAnchor),
            
            managementOptionBackgroundView.heightAnchor.constraint(equalTo: studentManagementBackgroundView.heightAnchor, multiplier: 0.3),
            managementOptionBackgroundView.widthAnchor.constraint(equalTo: studentManagementBackgroundView.widthAnchor, multiplier: 1),
            managementOptionBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            managementOptionBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
//            previewClasses.topAnchor.constraint(equalTo: managementOptionBackgroundView.topAnchor , constant: 30),
//            previewClasses.leadingAnchor.constraint(equalTo: managementOptionBackgroundView.leadingAnchor , constant: 40),
//            previewClasses.trailingAnchor.constraint(equalTo: managementOptionBackgroundView.trailingAnchor , constant: -40),
//            previewClasses.heightAnchor.constraint(equalTo: managementOptionBackgroundView.heightAnchor , multiplier: 0.1),
//
//            assigningTeacher.topAnchor.constraint(equalTo: previewClasses.bottomAnchor , constant: 30),
//            assigningTeacher.leadingAnchor.constraint(equalTo: managementOptionBackgroundView.leadingAnchor , constant: 40),
//            assigningTeacher.trailingAnchor.constraint(equalTo: managementOptionBackgroundView.trailingAnchor , constant: -40),
//            assigningTeacher.heightAnchor.constraint(equalTo: managementOptionBackgroundView.heightAnchor , multiplier: 0.1),
//
//            removeStudentButton.topAnchor.constraint(equalTo: assigningTeacher.bottomAnchor , constant: 30),
//            removeStudentButton.leadingAnchor.constraint(equalTo: managementOptionBackgroundView.leadingAnchor , constant: 40),
//            removeStudentButton.trailingAnchor.constraint(equalTo: managementOptionBackgroundView.trailingAnchor , constant: -40),
//            removeStudentButton.heightAnchor.constraint(equalTo: managementOptionBackgroundView.heightAnchor , multiplier: 0.1),
//
//            searchStudentButton.topAnchor.constraint(equalTo: removeStudentButton.bottomAnchor , constant: 30),
//            searchStudentButton.leadingAnchor.constraint(equalTo: managementOptionBackgroundView.leadingAnchor , constant: 40),
//            searchStudentButton.trailingAnchor.constraint(equalTo: managementOptionBackgroundView.trailingAnchor , constant: -40),
//            searchStudentButton.heightAnchor.constraint(equalTo: managementOptionBackgroundView.heightAnchor , multiplier: 0.1),
            
            managementOptionsStackView.topAnchor.constraint(equalTo: managementOptionBackgroundView.topAnchor , constant: 30),
            managementOptionsStackView.leadingAnchor.constraint(equalTo: managementOptionBackgroundView.leadingAnchor , constant: 40),
            managementOptionsStackView.trailingAnchor.constraint(equalTo: managementOptionBackgroundView.trailingAnchor , constant: -40),
            managementOptionsStackView.bottomAnchor.constraint(equalTo: managementOptionBackgroundView.bottomAnchor , constant: -10),
            //            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
//            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            topView.heightAnchor.constraint(equalTo: view.heightAnchor),
//
//            studentManagementLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
//            studentManagementLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//
//
//            previewClasses.topAnchor.constraint(equalTo: studentManagementLabel.bottomAnchor, constant: 50),
//            previewClasses.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
//            previewClasses.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -40),
//            previewClasses.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
//
//            assigningTeacher.topAnchor.constraint(equalTo: previewClasses.bottomAnchor, constant: 30),
//            assigningTeacher.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
//            assigningTeacher.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -40),
//            assigningTeacher.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
//
//            removeStudentButton.topAnchor.constraint(equalTo: assigningTeacher.bottomAnchor, constant: 30),
//            removeStudentButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
//            removeStudentButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -40),
//            removeStudentButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
//
//            searchStudentButton.topAnchor.constraint(equalTo: removeStudentButton.bottomAnchor, constant: 30),
//            searchStudentButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
//            searchStudentButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -40),
//            searchStudentButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
//
//
//            nextButton.topAnchor.constraint(equalTo: searchStudentButton.bottomAnchor, constant: 50),
//            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
//            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -60),
//            nextButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
//
            
        ])
    }

    //Functions
    @objc func backButtonPressed(){
        navigationController?.popViewController(animated: true)
    }
    @objc func previewClassesPressed(){
        let vc = PreviewClassesViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
        
    }
        @objc func assigningTeacherPressed(){
            
            let vc = classesListViewController()
            vc.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(vc, animated: true)
        }
    @objc func removeStudentButtonPressed(){
        
//        if(assigningTeacher.backgroundColor == .black || previewClasses.backgroundColor == .black || searchStudentButton.backgroundColor == .black)
//        {
//            removeStudentButton.backgroundColor = .black
//            assigningTeacher.backgroundColor = UIColor(named: "mediumPurple")
//            previewClasses.backgroundColor = UIColor(named: "mediumPurple")
//            searchStudentButton.backgroundColor = UIColor(named: "mediumPurple")
//        }
//        selectedOption = "remove"
//        print("remove")
//        let vc = RemoveStudentViewController()
//        vc.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func searchStudentButtonPressed(){
        
//        if(assigningTeacher.backgroundColor == .black || removeStudentButton.backgroundColor == .black || previewClasses.backgroundColor == .black)
//        {
//           searchStudentButton.backgroundColor = .black
//            assigningTeacher.backgroundColor = UIColor(named: "mediumPurple")
//            removeStudentButton.backgroundColor = UIColor(named: "mediumPurple")
//            previewClasses.backgroundColor = UIColor(named: "mediumPurple")
//        }
//        selectedOption = "search"
//        print("search")
//        let vc = SearchStudentViewController()
//        vc.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(vc, animated: true)
    }
    
//    @objc func nextButtonPressed(){
//        if selectedOption == "register"{
//            print("register")
//            let vc = RegisterStudentViewController()
//            vc.modalPresentationStyle = .fullScreen
//            navigationController?.pushViewController(vc, animated: true)
//        }else if selectedOption == "update"{
//            print("update")
//            let vc = UpdateStudentViewController()
//            vc.modalPresentationStyle = .fullScreen
//            navigationController?.pushViewController(vc, animated: true)
//        }else if selectedOption == "remove"{
//            print("remove")
//            let vc = RemoveStudentViewController()
//            vc.modalPresentationStyle = .fullScreen
//            navigationController?.pushViewController(vc, animated: true)
//        }else{
//            print("search")
//            let vc = SearchStudentViewController()
//            vc.modalPresentationStyle = .fullScreen
//            navigationController?.pushViewController(vc, animated: true)
//        }
//
//    }

}


//
//  TeacherManagementViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 15/04/2023.
//

import Foundation
import UIKit

class TeacherManagementViewController: UIViewController {
    
    
    
    var teacherManagementContainerView : UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var teacherManagementBackgroundView : UIView = {
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
    var teacherManagementLabel : UILabel = {
       
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Teacher Managment"
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

    

    
    //    Button
        var registerTeacherButton : UIButton = {
            let bttn = UIButton(type: .system)
            bttn.translatesAutoresizingMaskIntoConstraints = false
            bttn.backgroundColor = UIColor(named: "darkPurple")
            bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            bttn.setTitle("     register Teacher", for: .normal)
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
            bttn.addTarget( self, action: #selector(registerTeacherButtonPressed), for: .touchUpInside)
            return bttn
            
        }()
     
    
        var updateTeacherButton : UIButton = {
            let bttn = UIButton(type: .system)
            bttn.translatesAutoresizingMaskIntoConstraints = false
            bttn.backgroundColor = UIColor(named: "mediumPurple")
            bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            bttn.setTitle("     Update Teacher", for: .normal)
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
            bttn.addTarget( self, action: #selector(updateTeacherButtonPressed), for: .touchUpInside)
            return bttn
            
        }()
    
    var removeTeacherButton : UIButton = {
        let bttn = UIButton(type: .system)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = UIColor(named: "mediumPurple")
        bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        bttn.setTitle("     Remove Teacher", for: .normal)
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
        bttn.addTarget( self, action: #selector(removeTeacherButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
    
    var previewTeacherButton : UIButton = {
        let bttn = UIButton(type: .system)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = UIColor(named: "mediumPurple")
        bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        bttn.setTitle("     Preview Teachers", for: .normal)
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
        bttn.addTarget( self, action: #selector(previewTeacherButtonPressed), for: .touchUpInside)
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
    
//    var navBarBackButton : UIButton = {
//        var backButton = UIButton(type: .custom)
//        backButton.setImage( UIImage(systemName: "chevron.backward"), for: .normal)
//        backButton.setTitle(" Back", for: .normal)
//        backButton.setTitleColor(UIColor.white, for: .normal)
//        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
//        backButton.sizeToFit()
//        backButton.isUserInteractionEnabled = true
//        return backButton
//    }()
    
    private var selectedOption : String = "register"

   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Teacher Management"


        ConfigureUI()
    
    }
    
    func ConfigureUI ()
    {
        view.backgroundColor = UIColor(named: "darkPurple")
//        navBarBackButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navBarBackButton)
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

//        navigationController?.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
//        view.backgroundColor = .systemBackground
//        view.addSubview(topView)
//        topView.addSubview(teacherManagementLabel)
//        topView.addSubview(registerTeacherButton)
//        topView.addSubview(updateTeacherButton)
//        topView.addSubview(removeTeacherButton)
//        topView.addSubview(previewTeacherButton)
//        topView.addSubview(nextButton)
        view.addSubview(teacherManagementContainerView)
        
        teacherManagementContainerView.addSubview(teacherManagementLabel)
        teacherManagementContainerView.addSubview(managementOptionBackgroundView)

        managementOptionBackgroundView.addSubview(managementOptionsStackView)
//
        managementOptionsStackView.addArrangedSubview(registerTeacherButton)
        managementOptionsStackView.addArrangedSubview(updateTeacherButton)
        managementOptionsStackView.addArrangedSubview(removeTeacherButton)
        managementOptionsStackView.addArrangedSubview(previewTeacherButton)
        
        NSLayoutConstraint.activate([
            
            teacherManagementContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            teacherManagementContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            teacherManagementContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            teacherManagementContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            
            teacherManagementLabel.topAnchor.constraint(equalTo: teacherManagementContainerView.topAnchor , constant: 30),
            teacherManagementLabel.centerXAnchor.constraint(equalTo: teacherManagementContainerView.centerXAnchor),
            
            managementOptionBackgroundView.heightAnchor.constraint(equalTo: teacherManagementContainerView.heightAnchor, multiplier: 0.6),
            managementOptionBackgroundView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            managementOptionBackgroundView.centerXAnchor.constraint(equalTo: teacherManagementContainerView.centerXAnchor),
            managementOptionBackgroundView.centerYAnchor.constraint(equalTo: teacherManagementContainerView.centerYAnchor),
            
            managementOptionsStackView.topAnchor.constraint(equalTo: managementOptionBackgroundView.topAnchor , constant: 30),
            managementOptionsStackView.leadingAnchor.constraint(equalTo: managementOptionBackgroundView.leadingAnchor , constant: 40),
            managementOptionsStackView.trailingAnchor.constraint(equalTo: managementOptionBackgroundView.trailingAnchor , constant: -40),
            managementOptionsStackView.bottomAnchor.constraint(equalTo: managementOptionBackgroundView.bottomAnchor , constant: -10),
            
//            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            topView.heightAnchor.constraint(equalTo: view.heightAnchor),
//
//            teacherManagementLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
//            teacherManagementLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//
//
//            registerTeacherButton.topAnchor.constraint(equalTo: teacherManagementLabel.bottomAnchor, constant: 50),
//            registerTeacherButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
//            registerTeacherButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -40),
//            registerTeacherButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
//
//            updateTeacherButton.topAnchor.constraint(equalTo: registerTeacherButton.bottomAnchor, constant: 30),
//            updateTeacherButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
//            updateTeacherButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -40),
//            updateTeacherButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
//
//            removeTeacherButton.topAnchor.constraint(equalTo: updateTeacherButton.bottomAnchor, constant: 30),
//            removeTeacherButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
//            removeTeacherButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -40),
//            removeTeacherButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
//
//            previewTeacherButton.topAnchor.constraint(equalTo: removeTeacherButton.bottomAnchor, constant: 30),
//            previewTeacherButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
//            previewTeacherButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -40),
//            previewTeacherButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
//
//
//            nextButton.topAnchor.constraint(equalTo: previewTeacherButton.bottomAnchor, constant: 50),
//            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
//            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -60),
//            nextButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            
            
        ])
    }

    //Functions
    @objc func registerTeacherButtonPressed(){
        
//        if(updateTeacherButton.backgroundColor == .black || removeTeacherButton.backgroundColor == .black || previewTeacherButton.backgroundColor == .black)
//        {
//            registerTeacherButton.backgroundColor = .black
//            updateTeacherButton.backgroundColor = UIColor(named: "mediumPurple")
//            removeTeacherButton.backgroundColor = UIColor(named: "mediumPurple")
//            previewTeacherButton.backgroundColor = UIColor(named: "mediumPurple")
//        }
//        selectedOption = "register"
        print("register")
        let vc = RegisterTeacherViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)

    }
        @objc func updateTeacherButtonPressed(){
//            
//            if(registerTeacherButton.backgroundColor == .black || removeTeacherButton.backgroundColor == .black || previewTeacherButton.backgroundColor == .black)
//            {
//                updateTeacherButton.backgroundColor = .black
//                registerTeacherButton.backgroundColor = UIColor(named: "mediumPurple")
//                removeTeacherButton.backgroundColor = UIColor(named: "mediumPurple")
//                previewTeacherButton.backgroundColor = UIColor(named: "mediumPurple")
//            }
//            selectedOption = "update"
            print("update")
            let vc = TeacherListViewController()
            vc.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(vc, animated: true)
            
        }
    @objc func removeTeacherButtonPressed(){
        
//        if(updateTeacherButton.backgroundColor == .black || registerTeacherButton.backgroundColor == .black || previewTeacherButton.backgroundColor == .black)
//        {
//            removeTeacherButton.backgroundColor = .black
//            updateTeacherButton.backgroundColor = UIColor(named: "mediumPurple")
//            registerTeacherButton.backgroundColor = UIColor(named: "mediumPurple")
//            previewTeacherButton.backgroundColor = UIColor(named: "mediumPurple")
//        }
//        selectedOption = "remove"
        print("remove")
        let vc = RemoveTeacherViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func previewTeacherButtonPressed(){
        
//        if(updateTeacherButton.backgroundColor == .black || removeTeacherButton.backgroundColor == .black || registerTeacherButton.backgroundColor == .black)
//        {
//           previewTeacherButton.backgroundColor = .black
//            updateTeacherButton.backgroundColor = UIColor(named: "mediumPurple")
//            removeTeacherButton.backgroundColor = UIColor(named: "mediumPurple")
//            registerTeacherButton.backgroundColor = UIColor(named: "mediumPurple")
//        }
//        selectedOption = "search"
        print("Preview")
        let vc = PreviewTeacherListViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
//    @objc func backButtonPressed(){
//        print("Runn")
//        navigationController?.popViewController(animated: true)
//    }
//    @objc func nextButtonPressed(){
//        if selectedOption == "register"{
//            print("register")
//            let vc = RegisterTeacherViewController()
//            vc.modalPresentationStyle = .fullScreen
//            navigationController?.pushViewController(vc, animated: true)
//        }else if selectedOption == "update"{
//            print("update")
//            let vc = TeacherListViewController()
//            vc.modalPresentationStyle = .fullScreen
//            navigationController?.pushViewController(vc, animated: true)
//        }else if selectedOption == "remove"{
//            print("remove")
//            let vc = RemoveTeacherViewController()
//            vc.modalPresentationStyle = .fullScreen
//            navigationController?.pushViewController(vc, animated: true)
//        }else{
//            print("Preview")
//            let vc = PreviewTeacherListViewController()
//            vc.modalPresentationStyle = .fullScreen
////            vc.setpurpose(purpose: "Preview")
//            navigationController?.pushViewController(vc, animated: true)
//        }
//    }
   

}


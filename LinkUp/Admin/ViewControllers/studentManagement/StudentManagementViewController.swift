//
//  StudentManagementViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 14/04/2023.
//

import Foundation
import UIKit

class StudentManagementViewController: UIViewController {
    
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
        lbl.text = "Student Managment"
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
    
    //    Button
        var registerStudentButton : UIButton = {
            let bttn = UIButton(type: .system)
            bttn.translatesAutoresizingMaskIntoConstraints = false
            bttn.backgroundColor = UIColor(named: "mediumPurple")
            bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            bttn.setTitle("     register Student", for: .normal)
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
            bttn.addTarget( self, action: #selector(registerStudentButtonPressed), for: .touchUpInside)
            return bttn
            
        }()
        
    
        var updateStudentButton : UIButton = {
            let bttn = UIButton(type: .system)
            bttn.translatesAutoresizingMaskIntoConstraints = false
            bttn.backgroundColor = UIColor(named: "mediumPurple")
            bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            bttn.setTitle("     Update Student", for: .normal)
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
            bttn.addTarget( self, action: #selector(updateStudentButtonPressed), for: .touchUpInside)
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
   
    



    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Management"
        ConfigureUI()
    
    }
    
    func ConfigureUI ()
    {

        view.backgroundColor = .systemBackground
       
        view.addSubview(studentManagementContainerView)
        studentManagementContainerView.addSubview(studentManagementBackgroundView)
        studentManagementBackgroundView.addSubview(studentManagementLabel)
        studentManagementBackgroundView.addSubview(managementOptionBackgroundView)
        
//        managementOptionBackgroundView.addSubview(registerStudentButton)
//        managementOptionBackgroundView.addSubview(updateStudentButton)
//        managementOptionBackgroundView.addSubview(updateStudentButton)
//        managementOptionBackgroundView.addSubview(searchStudentButton)
        managementOptionBackgroundView.addSubview(managementOptionsStackView)
//
        managementOptionsStackView.addArrangedSubview(registerStudentButton)
        managementOptionsStackView.addArrangedSubview(updateStudentButton)
        managementOptionsStackView.addArrangedSubview(removeStudentButton)
        managementOptionsStackView.addArrangedSubview(searchStudentButton)

        NSLayoutConstraint.activate([
            
            studentManagementContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            studentManagementContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            studentManagementContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            studentManagementContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor ),
            
            studentManagementBackgroundView.topAnchor.constraint(equalTo: studentManagementContainerView.safeAreaLayoutGuide.topAnchor),
            studentManagementBackgroundView.leadingAnchor.constraint(equalTo: studentManagementContainerView.leadingAnchor),
            studentManagementBackgroundView.trailingAnchor.constraint(equalTo: studentManagementContainerView.trailingAnchor),
            studentManagementBackgroundView.bottomAnchor.constraint(equalTo: studentManagementContainerView.bottomAnchor),
            
            studentManagementLabel.topAnchor.constraint(equalTo: studentManagementBackgroundView.topAnchor , constant: 30),
            studentManagementLabel.centerXAnchor.constraint(equalTo: studentManagementBackgroundView.centerXAnchor),
            
            managementOptionBackgroundView.heightAnchor.constraint(equalTo: studentManagementBackgroundView.heightAnchor, multiplier: 0.6),
            managementOptionBackgroundView.widthAnchor.constraint(equalTo: studentManagementBackgroundView.widthAnchor, multiplier: 1),
            managementOptionBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            managementOptionBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            managementOptionsStackView.topAnchor.constraint(equalTo: managementOptionBackgroundView.topAnchor , constant: 30),
            managementOptionsStackView.leadingAnchor.constraint(equalTo: managementOptionBackgroundView.leadingAnchor , constant: 40),
            managementOptionsStackView.trailingAnchor.constraint(equalTo: managementOptionBackgroundView.trailingAnchor , constant: -40),
            managementOptionsStackView.bottomAnchor.constraint(equalTo: managementOptionBackgroundView.bottomAnchor , constant: -10),
            
        ])
    }

    //Functions
    @objc func backButtonPressed(){
        navigationController?.popViewController(animated: true)
    }
    @objc func registerStudentButtonPressed(){
        print("register")
        let vc = RegisterStudentViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
        
    }
        @objc func updateStudentButtonPressed(){
            
            print("update")
            let vc = UpdateStudentViewController()
            vc.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(vc, animated: true)
        }
    @objc func removeStudentButtonPressed(){
        print("remove")
        let vc = RemoveStudentViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func searchStudentButtonPressed(){
        print("search")
        let vc = SearchStudentViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }

}


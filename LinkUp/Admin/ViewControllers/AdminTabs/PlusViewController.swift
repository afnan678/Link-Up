//
//  PlusViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 14/04/2023.
//

import Foundation
import UIKit

class PlusVC : UIViewController {
    
    var n = 0

    let topView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    
    
    //    lable
        var pageTitle : UILabel = {
           
            var lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.text = "Create New pageTitle"
            lbl.textColor = UIColor(named: "mediumPurple")
            lbl.font = UIFont.boldSystemFont(ofSize: 25.0)
            return lbl
        }()
    

    
    //    Button
        var registerTeacherButton : UIButton = {
            let bttn = UIButton(type: .system)
            bttn.translatesAutoresizingMaskIntoConstraints = false
            bttn.backgroundColor = .black
            bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            bttn.setTitle("  Register Teacher", for: .normal)
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
        @objc func registerTeacherButtonPressed(){
            
            n = 0
            
            if(registerStudentButton.backgroundColor == .black)
            {
                registerTeacherButton.backgroundColor = .black
                registerStudentButton.backgroundColor = UIColor(named: "mediumPurple")
            }
            
            
        }
    
        var registerStudentButton : UIButton = {
            let bttn = UIButton(type: .system)
            bttn.translatesAutoresizingMaskIntoConstraints = false
            bttn.backgroundColor = UIColor(named: "mediumPurple")
            bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            bttn.setTitle("  Register Student", for: .normal)
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
            bttn.addTarget( self, action: #selector(registerStudentButtonPressed), for: .touchUpInside)
            return bttn
            
        }()
        @objc func registerStudentButtonPressed(){
            
            n = 1
            
            if(registerTeacherButton.backgroundColor == .black)
            {
                registerTeacherButton.backgroundColor =  UIColor(named: "mediumPurple")
                registerStudentButton.backgroundColor = .black
                
                
            }
            
        }
    
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
        bttn.addTarget( self, action: #selector(nextButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
    @objc func nextButtonPressed(){
        var rootvc = UIViewController()
        
        if n == 0
        {
//            rootvc = Teacher_Registration()
        }
        else if n == 1
        {
//            rootvc = Studnt_Registration()
        }
        
        let navVC = UINavigationController(rootViewController: rootvc)
//            navVC.modalPresentationStyle = .fullScreen
        present(navVC,animated: true)
        
//            navigationController?.pushViewController(rootvc, animated: true)
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureUI()
        // Do any additional setup after loading the view.
    }
    
    func ConfigureUI ()
    {
        view.addSubview(topView)
        topView.addSubview(pageTitle)
        topView.addSubview(registerTeacherButton)
        topView.addSubview(registerStudentButton)
        topView.addSubview(nextButton)
        NSLayoutConstraint.activate([
            
            //            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            
            registerTeacherButton.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 50),
            registerTeacherButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            registerTeacherButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -40),
            registerTeacherButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
            
            
            registerStudentButton.topAnchor.constraint(equalTo: registerTeacherButton.bottomAnchor, constant: 50),
            registerStudentButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            registerStudentButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -40),
            registerStudentButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
            
            nextButton.topAnchor.constraint(equalTo: registerStudentButton.bottomAnchor, constant: 70),
            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -60),
            nextButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            
            
        ])
    }


}



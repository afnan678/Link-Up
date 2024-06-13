//
//  AnnouncementManagementViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 14/04/2023.
//

import Foundation
import UIKit

class AnnouncementManagementViewController : UIViewController {
    
    let announcementManagementContainerView: UIView = {
        let view = UIView()
//        view.backgroundColor = .orange
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var announcementManagementBackgroundView : UIView = {
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
    
    //    lable
        var announcementManagementLabel : UILabel = {
            var lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.text = "Announcement Management"
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
    
    //    Button
        var registerAnnouncementButton : UIButton = {
            let bttn = UIButton(type: .system)
            bttn.translatesAutoresizingMaskIntoConstraints = false
            bttn.backgroundColor = UIColor(named: "darkPurple")
            bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            bttn.setTitle("     New Announcement", for: .normal)
            bttn.setTitleColor(.systemBackground, for: .normal)
            var imag = UIImage(systemName: "house")
            let c = UIColor.white
            let largeFont = UIFont.systemFont(ofSize: 30)
            let configuration = UIImage.SymbolConfiguration(font: largeFont)
            imag = UIImage(systemName: "square.and.pencil.circle.fill", withConfiguration: configuration)?.withTintColor(c, renderingMode: .alwaysOriginal)
            bttn.setImage(imag, for: .normal)
            bttn.imageView?.contentMode = .scaleAspectFit
            bttn.tintColor = .white
            bttn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            bttn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
            bttn.layer.cornerRadius = 10
            bttn.addTarget( self, action: #selector(registerAnnouncementButtonPressed), for: .touchUpInside)
            return bttn
            
        }()
        
        var updateAnnouncementButton : UIButton = {
            let bttn = UIButton(type: .system)
            bttn.translatesAutoresizingMaskIntoConstraints = false
            bttn.backgroundColor = UIColor(named: "mediumPurple")
            bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            bttn.setTitle("     Update Announcement", for: .normal)
            bttn.setTitleColor(.white, for: .normal)
            var imag = UIImage(systemName: "house")
            let c = UIColor.white
            let largeFont = UIFont.systemFont(ofSize: 30)
            let configuration = UIImage.SymbolConfiguration(font: largeFont)
            imag = UIImage(systemName: "square.and.pencil.circle.fill", withConfiguration: configuration)?.withTintColor(c, renderingMode: .alwaysOriginal)
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
            bttn.addTarget( self, action: #selector(updateAnnouncementButtonPressed), for: .touchUpInside)
            return bttn
            
        }()
    
    var removeAnnouncementButton : UIButton = {
        let bttn = UIButton(type: .system)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = UIColor(named: "mediumPurple")
        bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        bttn.setTitle("     Remove Announcment", for: .normal)
        bttn.setTitleColor(.white, for: .normal)
        var imag = UIImage(systemName: "house")
        let c = UIColor.white
        let largeFont = UIFont.systemFont(ofSize: 30)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        imag = UIImage(systemName: "square.and.pencil.circle.fill", withConfiguration: configuration)?.withTintColor(c, renderingMode: .alwaysOriginal)
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
        bttn.addTarget( self, action: #selector(removeAnnouncementButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
    
    
    var previewAnnouncementButton : UIButton = {
        let bttn = UIButton(type: .system)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = UIColor(named: "mediumPurple")
        bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        bttn.setTitle("     Preview Announcment", for: .normal)
        bttn.setTitleColor(.white, for: .normal)
        var imag = UIImage(systemName: "house")
        let c = UIColor.white
        let largeFont = UIFont.systemFont(ofSize: 30)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        imag = UIImage(systemName: "square.and.pencil.circle.fill", withConfiguration: configuration)?.withTintColor(c, renderingMode: .alwaysOriginal)
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
        bttn.addTarget( self, action: #selector(previewAnnouncementButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
   
    
//    var nextButton : UIButton = {
//        let bttn = UIButton(type: .system)
//        bttn.translatesAutoresizingMaskIntoConstraints = false
//        bttn.backgroundColor = UIColor(named: "mediumPurple")
//        bttn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
//        bttn.setTitle("NEXT", for: .normal)
//        bttn.titleLabel?.textAlignment = .center
//        bttn.setTitleColor(.white, for: .normal)
//        bttn.tintColor = .white
//        bttn.layer.cornerRadius = 10
//        bttn.layer.shadowColor = UIColor.black.cgColor
//        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
//        bttn.layer.shadowOpacity = 0.25
//        bttn.layer.shadowRadius = 2
//        bttn.layer.masksToBounds = false
//        bttn.addTarget( self, action: #selector(nextButtonPressed), for: .touchUpInside)
//        return bttn
//
//    }()
//
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
//
//    private var selectedOption : String = "register"


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

//        navigationController?.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        view.backgroundColor = UIColor(named: "darkPurple")
//        view.addSubview(topView)
//        view.addSubview(announcementManagementContainerView)
//        announcementManagementContainerView.addSubview(announcementManagementLabel)
//        announcementManagementContainerView.addSubview(registerAnnouncementButton)
//        announcementManagementContainerView.addSubview(updateAnnouncementButton)
//        announcementManagementContainerView.addSubview(removeAnnouncementButton)
//        announcementManagementContainerView.addSubview(previewAnnouncementButton)
//        announcementManagementContainerView.addSubview(nextButton)
//        
        view.addSubview(announcementManagementContainerView)
        announcementManagementContainerView.addSubview(announcementManagementBackgroundView)
        announcementManagementBackgroundView.addSubview(announcementManagementLabel)
        announcementManagementBackgroundView.addSubview(managementOptionBackgroundView)
        
//        managementOptionBackgroundView.addSubview(registerStudentButton)
//        managementOptionBackgroundView.addSubview(updateStudentButton)
//        managementOptionBackgroundView.addSubview(updateStudentButton)
//        managementOptionBackgroundView.addSubview(searchStudentButton)
        managementOptionBackgroundView.addSubview(managementOptionsStackView)
//
        managementOptionsStackView.addArrangedSubview(registerAnnouncementButton)
        managementOptionsStackView.addArrangedSubview(updateAnnouncementButton)
        managementOptionsStackView.addArrangedSubview(removeAnnouncementButton)
        managementOptionsStackView.addArrangedSubview(previewAnnouncementButton)
        
        NSLayoutConstraint.activate([
            
            announcementManagementContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            announcementManagementContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            announcementManagementContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            announcementManagementContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
//            announcementManagementLabel.topAnchor.constraint(equalTo: announcementManagementContainerView.topAnchor, constant: 100),
//            announcementManagementLabel.centerXAnchor.constraint(equalTo: announcementManagementContainerView.centerXAnchor),
//
//            registerAnnouncementButton.topAnchor.constraint(equalTo: announcementManagementLabel.bottomAnchor, constant: 50),
//            registerAnnouncementButton.leadingAnchor.constraint(equalTo: announcementManagementContainerView.leadingAnchor, constant: 40),
//            registerAnnouncementButton.trailingAnchor.constraint(equalTo: announcementManagementContainerView.trailingAnchor,constant: -40),
//            registerAnnouncementButton.heightAnchor.constraint(equalTo: announcementManagementContainerView.heightAnchor, multiplier: 0.08),
//
//            updateAnnouncementButton.topAnchor.constraint(equalTo: registerAnnouncementButton.bottomAnchor, constant: 30),
//            updateAnnouncementButton.leadingAnchor.constraint(equalTo: announcementManagementContainerView.leadingAnchor, constant: 40),
//            updateAnnouncementButton.trailingAnchor.constraint(equalTo: announcementManagementContainerView.trailingAnchor,constant: -40),
//            updateAnnouncementButton.heightAnchor.constraint(equalTo: announcementManagementContainerView.heightAnchor, multiplier: 0.08),
//
//            removeAnnouncementButton.topAnchor.constraint(equalTo: updateAnnouncementButton.bottomAnchor, constant: 30),
//            removeAnnouncementButton.leadingAnchor.constraint(equalTo: announcementManagementContainerView.leadingAnchor, constant: 40),
//            removeAnnouncementButton.trailingAnchor.constraint(equalTo: announcementManagementContainerView.trailingAnchor,constant: -40),
//            removeAnnouncementButton.heightAnchor.constraint(equalTo: announcementManagementContainerView.heightAnchor, multiplier: 0.08),
//
//            previewAnnouncementButton.topAnchor.constraint(equalTo: removeAnnouncementButton.bottomAnchor, constant: 30),
//            previewAnnouncementButton.leadingAnchor.constraint(equalTo: announcementManagementContainerView.leadingAnchor, constant: 40),
//            previewAnnouncementButton.trailingAnchor.constraint(equalTo: announcementManagementContainerView.trailingAnchor,constant: -40),
//            previewAnnouncementButton.heightAnchor.constraint(equalTo: announcementManagementContainerView.heightAnchor, multiplier: 0.08),
//
//
//            nextButton.topAnchor.constraint(equalTo: previewAnnouncementButton.bottomAnchor, constant: 50),
//            nextButton.leadingAnchor.constraint(equalTo: announcementManagementContainerView.leadingAnchor, constant: 60),
//            nextButton.trailingAnchor.constraint(equalTo: announcementManagementContainerView.trailingAnchor,constant: -60),
//            nextButton.heightAnchor.constraint(equalTo: announcementManagementContainerView.heightAnchor, multiplier: 0.06),
            announcementManagementBackgroundView.topAnchor.constraint(equalTo: announcementManagementContainerView.safeAreaLayoutGuide.topAnchor),
            announcementManagementBackgroundView.leadingAnchor.constraint(equalTo: announcementManagementContainerView.leadingAnchor),
            announcementManagementBackgroundView.trailingAnchor.constraint(equalTo: announcementManagementContainerView.trailingAnchor),
            announcementManagementBackgroundView.bottomAnchor.constraint(equalTo: announcementManagementContainerView.bottomAnchor),
            
            announcementManagementLabel.topAnchor.constraint(equalTo: announcementManagementBackgroundView.topAnchor , constant: 30),
            announcementManagementLabel.centerXAnchor.constraint(equalTo: announcementManagementBackgroundView.centerXAnchor),
            
            managementOptionBackgroundView.heightAnchor.constraint(equalTo: announcementManagementBackgroundView.heightAnchor, multiplier: 0.6),
            managementOptionBackgroundView.widthAnchor.constraint(equalTo: announcementManagementBackgroundView.widthAnchor, multiplier: 1),
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
    @objc func registerAnnouncementButtonPressed(){
        let vc = MakeAnnouncementViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
        @objc func updateAnnouncementButtonPressed(){
            let vc = AnnouncementListViewController()
            vc.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(vc, animated: true)
        }
    @objc func removeAnnouncementButtonPressed(){
        let vc = RemoveAnnouncementViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func previewAnnouncementButtonPressed(){
        let vc = DisplayAnnouncementViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    @objc func nextButtonPressed(){
//        if selectedOption == "register"{
//            print("register")
//            let vc = MakeAnnouncementViewController()
//            vc.modalPresentationStyle = .fullScreen
//            navigationController?.pushViewController(vc, animated: true)
//        }else if selectedOption == "update"{
//            print("update")
//            let vc = AnnouncementListViewController()
//            vc.modalPresentationStyle = .fullScreen
//            navigationController?.pushViewController(vc, animated: true)
//        }else if selectedOption == "remove"{
//            print("remove")
//            let vc = RemoveAnnouncementViewController()
//            vc.modalPresentationStyle = .fullScreen
//            navigationController?.pushViewController(vc, animated: true)
//        }else{
//            print("preview")
//            let vc = DisplayAnnouncementViewController()
//            vc.modalPresentationStyle = .fullScreen
//            navigationController?.pushViewController(vc, animated: true)
//        }
//
//    }
}


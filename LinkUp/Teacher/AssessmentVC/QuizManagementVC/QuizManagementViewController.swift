//
//  QuizManagementViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 12/06/2023.
//

import Foundation
import UIKit

class QuizManagementViewController : UIViewController {
    
    let assessmentManagementContainerView: UIView = {
        let view = UIView()
//        view.backgroundColor = .orange
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    var announcementManagementBackgroundView : UIView = {
//       let view = UIView()
//        view.backgroundColor = .systemBackground
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    var managementOptionBackgroundView : UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //    lable
        var assessmentManagementLabel : UILabel = {
            var lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.text = "Quiz Management"
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
        var addQuizezButton : UIButton = {
            let bttn = UIButton(type: .system)
            bttn.translatesAutoresizingMaskIntoConstraints = false
            bttn.backgroundColor = UIColor(named: "darkPurple")
            bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            bttn.setTitle("     Add Quiz", for: .normal)
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
            bttn.addTarget( self, action: #selector(addQuizezButtonPressed), for: .touchUpInside)
            return bttn
            
        }()
        
        var updateQuizButton : UIButton = {
            let bttn = UIButton(type: .system)
            bttn.translatesAutoresizingMaskIntoConstraints = false
            bttn.backgroundColor = UIColor(named: "mediumPurple")
            bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            bttn.setTitle("     Update Quiz", for: .normal)
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
            bttn.addTarget( self, action: #selector(updateQuizButtonPressed), for: .touchUpInside)
            return bttn
            
        }()
    
    var removeQuizButton : UIButton = {
        let bttn = UIButton(type: .system)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = UIColor(named: "mediumPurple")
        bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        bttn.setTitle("     Remove Quiz", for: .normal)
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
        bttn.addTarget( self, action: #selector(removeQuizButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
    
    
//    var previewAnnouncementButton : UIButton = {
//        let bttn = UIButton(type: .system)
//        bttn.translatesAutoresizingMaskIntoConstraints = false
//        bttn.backgroundColor = UIColor(named: "mediumPurple")
//        bttn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        bttn.setTitle("     Preview Announcment", for: .normal)
//        bttn.setTitleColor(.white, for: .normal)
//        var imag = UIImage(systemName: "house")
//        let c = UIColor.white
//        let largeFont = UIFont.systemFont(ofSize: 30)
//        let configuration = UIImage.SymbolConfiguration(font: largeFont)
//        imag = UIImage(systemName: "square.and.pencil.circle.fill", withConfiguration: configuration)?.withTintColor(c, renderingMode: .alwaysOriginal)
//        bttn.setImage(imag, for: .normal)
//        bttn.tintColor = .white
//        bttn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
//        bttn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
//        bttn.layer.cornerRadius = 10
//        bttn.layer.shadowColor = UIColor.black.cgColor
//        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
//        bttn.layer.shadowOpacity = 0.1
//        bttn.layer.shadowRadius = 2
//        bttn.layer.masksToBounds = false
//        bttn.addTarget( self, action: #selector(previewAnnouncementButtonPressed), for: .touchUpInside)
//        return bttn
//
//    }()
   
    
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
//        view.addSubview(assessmentManagementContainerView)
//        assessmentManagementContainerView.addSubview(assessmentManagementLabel)
//        assessmentManagementContainerView.addSubview(addQuizezButton)
//        assessmentManagementContainerView.addSubview(updateQuizButton)
//        assessmentManagementContainerView.addSubview(removeQuizButton)
//        assessmentManagementContainerView.addSubview(previewAnnouncementButton)
//        assessmentManagementContainerView.addSubview(nextButton)
//
        view.addSubview(assessmentManagementContainerView)
//        assessmentManagementContainerView.addSubview(announcementManagementBackgroundView)
        assessmentManagementContainerView.addSubview(assessmentManagementLabel)
        assessmentManagementContainerView.addSubview(managementOptionBackgroundView)
        
//        managementOptionBackgroundView.addSubview(registerStudentButton)
//        managementOptionBackgroundView.addSubview(updateStudentButton)
//        managementOptionBackgroundView.addSubview(updateStudentButton)
//        managementOptionBackgroundView.addSubview(searchStudentButton)
        managementOptionBackgroundView.addSubview(managementOptionsStackView)
//
        managementOptionsStackView.addArrangedSubview(addQuizezButton)
        managementOptionsStackView.addArrangedSubview(updateQuizButton)
        managementOptionsStackView.addArrangedSubview(removeQuizButton)
//        managementOptionsStackView.addArrangedSubview(previewAnnouncementButton)
        
        NSLayoutConstraint.activate([
            
            assessmentManagementContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            assessmentManagementContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            assessmentManagementContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            assessmentManagementContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
//            assessmentManagementLabel.topAnchor.constraint(equalTo: assessmentManagementContainerView.topAnchor, constant: 100),
//            assessmentManagementLabel.centerXAnchor.constraint(equalTo: assessmentManagementContainerView.centerXAnchor),
//
//            addQuizezButton.topAnchor.constraint(equalTo: assessmentManagementLabel.bottomAnchor, constant: 50),
//            addQuizezButton.leadingAnchor.constraint(equalTo: assessmentManagementContainerView.leadingAnchor, constant: 40),
//            addQuizezButton.trailingAnchor.constraint(equalTo: assessmentManagementContainerView.trailingAnchor,constant: -40),
//            addQuizezButton.heightAnchor.constraint(equalTo: assessmentManagementContainerView.heightAnchor, multiplier: 0.08),
//
//            updateQuizButton.topAnchor.constraint(equalTo: addQuizezButton.bottomAnchor, constant: 30),
//            updateQuizButton.leadingAnchor.constraint(equalTo: assessmentManagementContainerView.leadingAnchor, constant: 40),
//            updateQuizButton.trailingAnchor.constraint(equalTo: assessmentManagementContainerView.trailingAnchor,constant: -40),
//            updateQuizButton.heightAnchor.constraint(equalTo: assessmentManagementContainerView.heightAnchor, multiplier: 0.08),
//
//            removeQuizButton.topAnchor.constraint(equalTo: updateQuizButton.bottomAnchor, constant: 30),
//            removeQuizButton.leadingAnchor.constraint(equalTo: assessmentManagementContainerView.leadingAnchor, constant: 40),
//            removeQuizButton.trailingAnchor.constraint(equalTo: assessmentManagementContainerView.trailingAnchor,constant: -40),
//            removeQuizButton.heightAnchor.constraint(equalTo: assessmentManagementContainerView.heightAnchor, multiplier: 0.08),
//
//            previewAnnouncementButton.topAnchor.constraint(equalTo: removeQuizButton.bottomAnchor, constant: 30),
//            previewAnnouncementButton.leadingAnchor.constraint(equalTo: assessmentManagementContainerView.leadingAnchor, constant: 40),
//            previewAnnouncementButton.trailingAnchor.constraint(equalTo: assessmentManagementContainerView.trailingAnchor,constant: -40),
//            previewAnnouncementButton.heightAnchor.constraint(equalTo: assessmentManagementContainerView.heightAnchor, multiplier: 0.08),
//
//
//            nextButton.topAnchor.constraint(equalTo: previewAnnouncementButton.bottomAnchor, constant: 50),
//            nextButton.leadingAnchor.constraint(equalTo: assessmentManagementContainerView.leadingAnchor, constant: 60),
//            nextButton.trailingAnchor.constraint(equalTo: assessmentManagementContainerView.trailingAnchor,constant: -60),
//            nextButton.heightAnchor.constraint(equalTo: assessmentManagementContainerView.heightAnchor, multiplier: 0.06),
//            announcementManagementBackgroundView.topAnchor.constraint(equalTo: assessmentManagementContainerView.safeAreaLayoutGuide.topAnchor),
//            announcementManagementBackgroundView.leadingAnchor.constraint(equalTo: assessmentManagementContainerView.leadingAnchor),
//            announcementManagementBackgroundView.trailingAnchor.constraint(equalTo: assessmentManagementContainerView.trailingAnchor),
//            announcementManagementBackgroundView.bottomAnchor.constraint(equalTo: assessmentManagementContainerView.bottomAnchor),
            
            assessmentManagementLabel.topAnchor.constraint(equalTo: assessmentManagementContainerView.topAnchor , constant: 30),
            assessmentManagementLabel.centerXAnchor.constraint(equalTo: assessmentManagementContainerView.centerXAnchor),
            
            managementOptionBackgroundView.heightAnchor.constraint(equalTo: assessmentManagementContainerView.heightAnchor, multiplier: 0.4),
            managementOptionBackgroundView.widthAnchor.constraint(equalTo: assessmentManagementContainerView.widthAnchor, multiplier: 1),
            managementOptionBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            managementOptionBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            managementOptionsStackView.topAnchor.constraint(equalTo: managementOptionBackgroundView.topAnchor , constant: 30),
            managementOptionsStackView.leadingAnchor.constraint(equalTo: managementOptionBackgroundView.leadingAnchor , constant: 40),
            managementOptionsStackView.trailingAnchor.constraint(equalTo: managementOptionBackgroundView.trailingAnchor , constant: -40),
            managementOptionsStackView.bottomAnchor.constraint(equalTo: managementOptionBackgroundView.bottomAnchor , constant: -10),
            
            
        ])
    }

    //Functions
//    @objc func backButtonPressed(){
//        navigationController?.popViewController(animated: true)
//    }
    @objc func addQuizezButtonPressed(){
        let vc = AddQuizPortailViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
        @objc func updateQuizButtonPressed(){

        }
    @objc func removeQuizButtonPressed(){

    }
    @objc func previewAnnouncementButtonPressed(){
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


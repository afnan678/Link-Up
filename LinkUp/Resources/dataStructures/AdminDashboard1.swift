//
//  AdminDashboard.swift
//  LinkUp
//
//  Created by Hamza Malik on 26/05/2023.
//

//
//  AdminDashboard.swift
//  LinkUp
//
//  Created by Mac on 13/02/2023.
//
//
//  AdminDashboard.swift
//  LinkUp
//
//  Created by Mac on 13/02/2023.
//

import Foundation
import UIKit

class AdminDashboard1 : UIViewController{
    
    var titleBackgroundLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = UIColor(named: "darkPurple")
    
        return lbl
    }()

    var studentManagementLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "STUDENT MANAGMENT"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
        return lbl
    }()
    
    var teacherManagementLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "TEACHER MANAGMENT"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
        return lbl
    }()
    
    var classesLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "CLASSES"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
        return lbl
    }()
    
    var calenderLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "CALENDER"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
        return lbl
    }()
    
    var complaintLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "CAPLAINT"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
        return lbl
    }()
    
    var noticeBoardLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "NOTICE BOARD"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
        return lbl
    }()

    var slider : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "school")
//       img.backgroundColor = .black
//        img.contentMode = .scaleToFill
        img.contentMode = .scaleAspectFill
        return img
        
    }()
    
    

    var notificationButton : UIButton {
        var btn = UIButton()
        btn.backgroundColor = .white
        btn.setImage (UIImage(systemName: "bell.badge.circle.fill"), for: .normal)
        btn.tintColor = .systemBackground
        btn.contentVerticalAlignment = .fill
        btn.contentHorizontalAlignment = .fill
        btn.imageView?.contentMode = .scaleAspectFit
//        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        btn.layer.cornerRadius = 100
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowRadius = 2
        btn.layer.masksToBounds = false
        btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn.addTarget(self, action: #selector(notificationButtonPressed), for: .touchUpInside)
        return btn
    }
    
    var studentManagementButton : UIButton = {
        let bttn = UIButton()
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = .white
        bttn.setImage(UIImage(systemName: "person.crop.circle"), for: .normal)
        bttn.tintColor = UIColor(named: "darkPurple")
        bttn.contentVerticalAlignment = .fill
        bttn.contentHorizontalAlignment = .fill
        bttn.imageView?.contentMode = .scaleAspectFit
        bttn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 20)
        bttn.layer.cornerRadius = 20
        bttn.layer.shadowColor = UIColor.black.cgColor
        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        bttn.layer.shadowOpacity = 0.2
        bttn.layer.shadowRadius = 2
        bttn.layer.masksToBounds = false
        bttn.addTarget( self, action: #selector(studentManagementButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
   
    
    
    var teacherManagementButton : UIButton = {
        let bttn = UIButton()
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = .white
        bttn.setImage(UIImage(systemName: "rectangle.inset.filled.and.person.filled"), for: .normal)
        bttn.tintColor = UIColor(named: "darkPurple")
        bttn.contentVerticalAlignment = .fill
        bttn.contentHorizontalAlignment = .fill
        bttn.imageView?.contentMode = .scaleAspectFit
        bttn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 20)
        bttn.layer.cornerRadius = 20
        bttn.layer.shadowColor = UIColor.black.cgColor
        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        bttn.layer.shadowOpacity = 0.2
        bttn.layer.shadowRadius = 2
        bttn.layer.masksToBounds = false
        bttn.addTarget(self, action: #selector(teacherManagementButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
    
    
    var classesButton : UIButton = {
        let bttn = UIButton(type: .system)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = .white
        bttn.setImage(UIImage(systemName: "studentdesk"), for: .normal)
        bttn.tintColor = UIColor(named: "darkPurple")
        bttn.contentVerticalAlignment = .fill
        bttn.contentHorizontalAlignment = .fill
        bttn.imageView?.contentMode = .scaleAspectFit
        bttn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 20)
        bttn.layer.cornerRadius = 20
        bttn.layer.shadowColor = UIColor.black.cgColor
        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        bttn.layer.shadowOpacity = 0.2
        bttn.layer.shadowRadius = 2
        bttn.layer.masksToBounds = false
        bttn.addTarget( self, action: #selector(classesButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
    
    
    var calenderButton : UIButton = {
        let bttn = UIButton(type: .detailDisclosure)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = .white
        bttn.setImage(UIImage(systemName: "calendar"), for: .normal)
        bttn.tintColor = UIColor(named: "darkPurple")
        bttn.contentVerticalAlignment = .fill
        bttn.contentHorizontalAlignment = .fill
        bttn.imageView?.contentMode = .scaleAspectFit
        bttn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 20)
        bttn.layer.cornerRadius = 20
        bttn.layer.shadowColor = UIColor.black.cgColor
        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        bttn.layer.shadowOpacity = 0.2
        bttn.layer.shadowRadius = 2
        bttn.layer.masksToBounds = false
        bttn.addTarget( self, action: #selector(calenderButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
    
    
    var complaintButton : UIButton = {
        let bttn = UIButton(type: .detailDisclosure)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = .white
        bttn.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        bttn.tintColor = UIColor(named: "darkPurple")
        bttn.contentVerticalAlignment = .fill
        bttn.contentHorizontalAlignment = .fill
        bttn.imageView?.contentMode = .scaleAspectFit
        bttn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 25)
        bttn.layer.cornerRadius = 20
        bttn.layer.shadowColor = UIColor.black.cgColor
        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        bttn.layer.shadowOpacity = 0.2
        bttn.layer.shadowRadius = 2
        bttn.layer.masksToBounds = false
        bttn.addTarget( self, action: #selector(complaintButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
        var noticeBoardButton : UIButton = {
        let bttn = UIButton(type: .detailDisclosure)
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = .white
        bttn.setImage(UIImage(systemName: "list.clipboard"), for: .normal)
        bttn.tintColor = UIColor(named: "darkPurple")
        bttn.contentVerticalAlignment = .fill
        bttn.contentHorizontalAlignment = .fill
        bttn.imageView?.contentMode = .scaleAspectFit
        bttn.imageEdgeInsets = UIEdgeInsets(top: 25, left: 20, bottom: 20, right: 30)
        bttn.layer.cornerRadius = 20
        bttn.layer.shadowColor = UIColor.black.cgColor
        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        bttn.layer.shadowOpacity = 0.2
        bttn.layer.shadowRadius = 2
        bttn.layer.masksToBounds = false
        bttn.addTarget( self, action: #selector(noticeBoardButtonPressed), for: .touchUpInside)
        return bttn
        
    }()
    
    var backGroundContainerView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: "darkPurple")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var dashboardButtonsStackView : UIStackView = {
       let obj = UIStackView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.axis = .vertical
        obj.distribution = .fillEqually
        obj.backgroundColor = .red
//        obj.alignment = .center
//        obj.distribution = .equalSpacing
        return obj
    }()
    var studentAndTeacherStackView : UIStackView = {
        let obj = UIStackView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.axis = .horizontal
        obj.distribution = .fillEqually
//        obj.alignment = .fill
        obj.backgroundColor = .blue
//        obj.spacing = 130
        return obj
    }()
    var tacherManagementBackgroundView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemPink
        return view
    }()
    var studentManagementView : TopImageBottomLabelView = {
        let obj = TopImageBottomLabelView(text: "STUDENT MANAGEMENT", image: "person.crop.circle")
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .gray
        obj.isUserInteractionEnabled = true
        return obj
    }()
    var teacherManagementView : TopImageBottomLabelView = {
        let obj = TopImageBottomLabelView(text: "TEACHER MANAGEMENT", image: "rectangle.inset.filled.and.person.filled")
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .orange
        return obj
    }()
    var classesAndCalenderStackView : UIStackView = {
        let obj = UIStackView()
        obj.axis = .horizontal
        obj.distribution = .fillEqually
//        obj.alignment = .center
        obj.backgroundColor = .green
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    var classesView : TopImageBottomLabelView = {
        let obj = TopImageBottomLabelView(text: "CLASSES", image: "studentdesk")
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    var calenderView : TopImageBottomLabelView = {
        let obj = TopImageBottomLabelView(text: "CALENDER", image: "calendar")
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    var complainAndNoticeBoardStackView : UIStackView = {
        let obj = UIStackView()
        obj.axis = .horizontal
        obj.distribution = .fillEqually
        obj.backgroundColor = .orange
//        obj.alignment = .center
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    var complaintView : TopImageBottomLabelView = {
        let obj = TopImageBottomLabelView(text: "Complaint", image: "square.and.pencil")
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    var noticeBoardView : TopImageBottomLabelView = {
        let obj = TopImageBottomLabelView(text: "NOTICE BOARD", image: "list.clipboard")
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Dashboard"
        

        configureUI()
    }
    
//    var dashboardButtonsHorizontalStackView : UIStackView = {
//       let view = UIStackView()
//        view.axis = .horizontal
//        view.backgroundColor = .red
//        view.distribution = .fillEqually
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    var column1ButtonsStackView : UIStackView = {
        let view = UIStackView()
         view.axis = .vertical
         view.backgroundColor = .red
         view.distribution = .fillEqually
//        view.alignment = .center
//        view.clipsToBounds = true
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
    var studentManagementBackView : UIView = {
       let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var classesBackView : UIView = {
       let view = UIView()
        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var complaintBackView : UIView = {
       let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var column2ButtonsStackView : UIStackView = {
        let view = UIStackView()
         view.axis = .vertical
         view.backgroundColor = .red
         view.distribution = .fillEqually
//        view.alignment = .center
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
    var teacherManagementBackView : UIView = {
       let view = UIView()
        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var calenderBackView : UIView = {
       let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var noticeBoardBackView : UIView = {
       let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    private func configureUI(){
        
        //setting NavBar
        view.backgroundColor = .systemBackground
//        navigationController?.navigationBar.backgroundColor = UIColor(named: "darkPurple")
////        navigationController?.navigationBar.barTintColor = UIColor(named: "darkPurple")
//        navigationItem.title = "Dashboard"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = UIColor(named: "darkPurple")
//        let notificationItem = UIBarButtonItem(customView: notificationButton)
//        self.navigationItem.rightBarButtonItem = notificationItem
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(notificationButtonPressed))


        view.addSubview(backGroundContainerView)

        backGroundContainerView.addSubview(slider)

        
        backGroundContainerView.addSubview(column1ButtonsStackView)
        backGroundContainerView.addSubview(column2ButtonsStackView)
        
        column1ButtonsStackView.addArrangedSubview(studentManagementBackView)
        column1ButtonsStackView.addArrangedSubview(classesBackView)
        column1ButtonsStackView.addArrangedSubview(complaintBackView)
        
        studentManagementBackView.addSubview(studentManagementView)
        classesBackView.addSubview(classesView)
        complaintBackView.addSubview(complaintView)
        
        column2ButtonsStackView.addArrangedSubview(teacherManagementBackView)
        column2ButtonsStackView.addArrangedSubview(calenderBackView)
        column2ButtonsStackView.addArrangedSubview(noticeBoardBackView)
        
        teacherManagementBackView.addSubview(teacherManagementView)
        calenderBackView.addSubview(calenderView)
        noticeBoardBackView.addSubview(noticeBoardView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(studentManagementButtonPressed))
        studentManagementView.addGestureRecognizer(tapGesture)

        studentManagementView.addGestureRecognizer(tapGesture)
                
        NSLayoutConstraint.activate([
            
            backGroundContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            backGroundContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGroundContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backGroundContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            slider.topAnchor.constraint(equalTo: backGroundContainerView.safeAreaLayoutGuide.topAnchor),
            slider.leadingAnchor.constraint(equalTo: backGroundContainerView.leadingAnchor, constant: 0),
            slider.trailingAnchor.constraint(equalTo: backGroundContainerView.trailingAnchor,constant: 0),
            slider.heightAnchor.constraint(equalToConstant: 180),
            
            column1ButtonsStackView.topAnchor.constraint(equalTo: slider.bottomAnchor , constant: 15),
            column1ButtonsStackView.leadingAnchor.constraint(equalTo: backGroundContainerView.leadingAnchor , constant: 20),
            column1ButtonsStackView.widthAnchor.constraint(equalToConstant: 150),
            column1ButtonsStackView.bottomAnchor.constraint(equalTo: backGroundContainerView.bottomAnchor),
            
//            studentManagementView.leadingAnchor.constraint(equalTo: studentManagementBackView.leadingAnchor , constant: 30),
//            studentManagementView.topAnchor.constraint(equalTo: studentManagementBackView.topAnchor , constant: 5),
            studentManagementView.centerXAnchor.constraint(equalTo: studentManagementBackView.centerXAnchor , constant: -45),
            studentManagementView.centerYAnchor.constraint(equalTo: studentManagementBackView.centerYAnchor , constant: -45),

//            classesView.leadingAnchor.constraint(equalTo: classesBackView.leadingAnchor , constant: 30),
//            classesView.topAnchor.constraint(equalTo: classesBackView.topAnchor , constant: 5),
            
            classesView.centerXAnchor.constraint(equalTo: classesBackView.centerXAnchor , constant: -45),
            classesView.centerYAnchor.constraint(equalTo: classesBackView.centerYAnchor , constant: -45),
            
            complaintView.leadingAnchor.constraint(equalTo: complaintBackView.leadingAnchor , constant: 30),
            complaintView.topAnchor.constraint(equalTo: complaintBackView.topAnchor , constant: 5),
            
            column2ButtonsStackView.topAnchor.constraint(equalTo: slider.bottomAnchor , constant: 15),
            column2ButtonsStackView.trailingAnchor.constraint(equalTo: backGroundContainerView.trailingAnchor , constant: -20 ),
            column2ButtonsStackView.widthAnchor.constraint(equalToConstant: 150),
            column2ButtonsStackView.bottomAnchor.constraint(equalTo: backGroundContainerView.bottomAnchor),
            
            teacherManagementView.leadingAnchor.constraint(equalTo: teacherManagementBackView.leadingAnchor , constant: 30),
            teacherManagementView.topAnchor.constraint(equalTo: teacherManagementBackView.topAnchor , constant: 5),
            
            calenderView.leadingAnchor.constraint(equalTo: calenderBackView.leadingAnchor , constant: 30),
            calenderView.topAnchor.constraint(equalTo: calenderBackView.topAnchor , constant: 5),
            
            noticeBoardView.leadingAnchor.constraint(equalTo: noticeBoardBackView.leadingAnchor , constant: 30),
            noticeBoardView.topAnchor.constraint(equalTo: noticeBoardBackView.topAnchor , constant: 5),
        ])
//        print(tacherManagementBackgroundView.bounds.width)

    }
    
    //  Functions
  
    @objc func registerStudentButtonPressed() {
        
                
    }
    @objc func registerTeacherButtonPressed() {
        let registerVC = RegisterTeacherViewController()
        print("registerTeacher")
        registerVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(registerVC, animated: true)
    }
    @objc func notificationButtonPressed(){
        print("Notification")

    }
    @objc func studentManagementButtonPressed(){
        print("studentManagementButton")
        if let _ = self.navigationController {
            // The current view controller is in a navigation stack
            print("added")
            let registerVC = StudentManagementViewController()
            registerVC.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(registerVC, animated: true)
        } else {
            print("Not added")
            // The current view controller is not in a navigation stack
        }
        
    }
    @objc func teacherManagementButtonPressed(){
        print("TeacherManagementButton")
        let vc = TeacherManagementViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func classesButtonPressed(){
        print("classes button")
    }
    @objc func calenderButtonPressed(){
        print("calender button")
    }
    @objc func complaintButtonPressed(){
        print("Complaint button")
    }

    @objc func noticeBoardButtonPressed(){
       print("Notice Board")
        let vc = AnnouncementManagementViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
}


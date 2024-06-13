//
//  AdminDashboard.swift
//  LinkUp
//
//  Created by Mac on 13/02/2023.
//

import Foundation
import UIKit

class AdminDashboard : UIViewController{
    
//    var titleBackgroundLabel : UILabel = {
//
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.backgroundColor = UIColor(named: "darkPurple")
//
//        return lbl
//    }()
//
//    var studentManagementLabel : UILabel = {
//
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "STUDENT MANAGMENT"
//        lbl.textColor = .black
//        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
//        return lbl
//    }()
//
//    var teacherManagementLabel : UILabel = {
//
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "TEACHER MANAGMENT"
//        lbl.textColor = .black
//        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
//        return lbl
//    }()
//
//    var classesLabel : UILabel = {
//
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "CLASSES"
//        lbl.textColor = .black
//        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
//        return lbl
//    }()
//
//    var calenderLabel : UILabel = {
//
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "CALENDER"
//        lbl.textColor = .black
//        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
//        return lbl
//    }()
//
//    var complaintLabel : UILabel = {
//
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "CAPLAINT"
//        lbl.textColor = .black
//        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
//        return lbl
//    }()
//
//    var noticeBoardLabel : UILabel = {
//
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "NOTICE BOARD"
//        lbl.textColor = .black
//        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
//        return lbl
//    }()
//

//
//
//
//    var notificationButton : UIButton {
//        var btn = UIButton()
//        btn.backgroundColor = .white
//        btn.setImage (UIImage(systemName: "bell.badge.circle.fill"), for: .normal)
//        btn.tintColor = .systemBackground
//        btn.contentVerticalAlignment = .fill
//        btn.contentHorizontalAlignment = .fill
//        btn.imageView?.contentMode = .scaleAspectFit
////        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        btn.layer.cornerRadius = 100
//        btn.layer.shadowColor = UIColor.black.cgColor
//        btn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
//        btn.layer.shadowOpacity = 0.5
//        btn.layer.shadowRadius = 2
//        btn.layer.masksToBounds = false
//        btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        btn.addTarget(self, action: #selector(notificationButtonPressed), for: .touchUpInside)
//        return btn
//    }
//
//    var studentManagementButton : UIButton = {
//        let bttn = UIButton()
//        bttn.translatesAutoresizingMaskIntoConstraints = false
//        bttn.backgroundColor = .white
//        bttn.setImage(UIImage(systemName: "person.crop.circle"), for: .normal)
//        bttn.tintColor = UIColor(named: "darkPurple")
//        bttn.contentVerticalAlignment = .fill
//        bttn.contentHorizontalAlignment = .fill
//        bttn.imageView?.contentMode = .scaleAspectFit
//        bttn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 20)
//        bttn.layer.cornerRadius = 20
//        bttn.layer.shadowColor = UIColor.black.cgColor
//        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
//        bttn.layer.shadowOpacity = 0.2
//        bttn.layer.shadowRadius = 2
//        bttn.layer.masksToBounds = false
//        bttn.addTarget( self, action: #selector(studentManagementButtonPressed), for: .touchUpInside)
//        return bttn
//
//    }()
//
//
//
//    var teacherManagementButton : UIButton = {
//        let bttn = UIButton()
//        bttn.translatesAutoresizingMaskIntoConstraints = false
//        bttn.backgroundColor = .white
//        bttn.setImage(UIImage(systemName: "rectangle.inset.filled.and.person.filled"), for: .normal)
//        bttn.tintColor = UIColor(named: "darkPurple")
//        bttn.contentVerticalAlignment = .fill
//        bttn.contentHorizontalAlignment = .fill
//        bttn.imageView?.contentMode = .scaleAspectFit
//        bttn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 20)
//        bttn.layer.cornerRadius = 20
//        bttn.layer.shadowColor = UIColor.black.cgColor
//        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
//        bttn.layer.shadowOpacity = 0.2
//        bttn.layer.shadowRadius = 2
//        bttn.layer.masksToBounds = false
//        bttn.addTarget(self, action: #selector(teacherManagementButtonPressed), for: .touchUpInside)
//        return bttn
//
//    }()
//
//
//    var classesButton : UIButton = {
//        let bttn = UIButton(type: .system)
//        bttn.translatesAutoresizingMaskIntoConstraints = false
//        bttn.backgroundColor = .white
//        bttn.setImage(UIImage(systemName: "studentdesk"), for: .normal)
//        bttn.tintColor = UIColor(named: "darkPurple")
//        bttn.contentVerticalAlignment = .fill
//        bttn.contentHorizontalAlignment = .fill
//        bttn.imageView?.contentMode = .scaleAspectFit
//        bttn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 20)
//        bttn.layer.cornerRadius = 20
//        bttn.layer.shadowColor = UIColor.black.cgColor
//        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
//        bttn.layer.shadowOpacity = 0.2
//        bttn.layer.shadowRadius = 2
//        bttn.layer.masksToBounds = false
//        bttn.addTarget( self, action: #selector(classesButtonPressed), for: .touchUpInside)
//        return bttn
//
//    }()
//
//
//    var calenderButton : UIButton = {
//        let bttn = UIButton(type: .detailDisclosure)
//        bttn.translatesAutoresizingMaskIntoConstraints = false
//        bttn.backgroundColor = .white
//        bttn.setImage(UIImage(systemName: "calendar"), for: .normal)
//        bttn.tintColor = UIColor(named: "darkPurple")
//        bttn.contentVerticalAlignment = .fill
//        bttn.contentHorizontalAlignment = .fill
//        bttn.imageView?.contentMode = .scaleAspectFit
//        bttn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 20)
//        bttn.layer.cornerRadius = 20
//        bttn.layer.shadowColor = UIColor.black.cgColor
//        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
//        bttn.layer.shadowOpacity = 0.2
//        bttn.layer.shadowRadius = 2
//        bttn.layer.masksToBounds = false
//        bttn.addTarget( self, action: #selector(calenderButtonPressed), for: .touchUpInside)
//        return bttn
//
//    }()
//
//
//    var complaintButton : UIButton = {
//        let bttn = UIButton(type: .detailDisclosure)
//        bttn.translatesAutoresizingMaskIntoConstraints = false
//        bttn.backgroundColor = .white
//        bttn.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
//        bttn.tintColor = UIColor(named: "darkPurple")
//        bttn.contentVerticalAlignment = .fill
//        bttn.contentHorizontalAlignment = .fill
//        bttn.imageView?.contentMode = .scaleAspectFit
//        bttn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 25)
//        bttn.layer.cornerRadius = 20
//        bttn.layer.shadowColor = UIColor.black.cgColor
//        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
//        bttn.layer.shadowOpacity = 0.2
//        bttn.layer.shadowRadius = 2
//        bttn.layer.masksToBounds = false
//        bttn.addTarget( self, action: #selector(complaintButtonPressed), for: .touchUpInside)
//        return bttn
//
//    }()
//        var noticeBoardButton : UIButton = {
//        let bttn = UIButton(type: .detailDisclosure)
//        bttn.translatesAutoresizingMaskIntoConstraints = false
//        bttn.backgroundColor = .white
//        bttn.setImage(UIImage(systemName: "list.clipboard"), for: .normal)
//        bttn.tintColor = UIColor(named: "darkPurple")
//        bttn.contentVerticalAlignment = .fill
//        bttn.contentHorizontalAlignment = .fill
//        bttn.imageView?.contentMode = .scaleAspectFit
//        bttn.imageEdgeInsets = UIEdgeInsets(top: 25, left: 20, bottom: 20, right: 30)
//        bttn.layer.cornerRadius = 20
//        bttn.layer.shadowColor = UIColor.black.cgColor
//        bttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
//        bttn.layer.shadowOpacity = 0.2
//        bttn.layer.shadowRadius = 2
//        bttn.layer.masksToBounds = false
//        bttn.addTarget( self, action: #selector(noticeBoardButtonPressed), for: .touchUpInside)
//        return bttn
//
//    }()
//
    var backGroundContainerView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: "darkPurple")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var slider : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "school")
//       img.backgroundColor = .black
//        img.contentMode = .scaleToFill
//        img.clipsToBounds = true
        img.contentMode = .scaleToFill
        return img

    }()
    
    var dashboardButtonsStackView : UIStackView = {
       let obj = UIStackView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.axis = .vertical
        obj.distribution = .fillEqually
//        obj.backgroundColor = .red
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
    var studentManagementBackView : UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var studentManagementView : TopImageBottomLabelView = {
        let obj = TopImageBottomLabelView(text: "STUDENT MANAGEMENT", image: "person.crop.circle")
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.isUserInteractionEnabled = true
        return obj
    }()
    var teacherManagementBackView : UIView = {
       let view = UIView()
//        view.backgroundColor = .orange
        view.backgroundColor = .systemBackground

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var teacherManagementView : TopImageBottomLabelView = {
        let obj = TopImageBottomLabelView(text: "TEACHER MANAGEMENT", image: "rectangle.inset.filled.and.person.filled")
        obj.translatesAutoresizingMaskIntoConstraints = false
//        obj.backgroundColor = .orange
        obj.backgroundColor = .systemBackground

        return obj
    }()
    var classesAndCalenderStackView : UIStackView = {
        let obj = UIStackView()
        obj.axis = .horizontal
        obj.distribution = .fillEqually
//        obj.alignment = .center
//        obj.backgroundColor = .green
        obj.backgroundColor = .systemBackground

        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    var classesBackView : UIView = {
       let view = UIView()
//        view.backgroundColor = .orange
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var classesView : TopImageBottomLabelView = {
        let obj = TopImageBottomLabelView(text: "CLASSES", image: "studentdesk")
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    var calenderBackView : UIView = {
       let view = UIView()
//        view.backgroundColor = .red
        view.backgroundColor = .systemBackground

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
//        obj.backgroundColor = .orange
        obj.backgroundColor = .systemBackground

//        obj.alignment = .center
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    var complaintBackView : UIView = {
       let view = UIView()
//        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var complaintView : TopImageBottomLabelView = {
        let obj = TopImageBottomLabelView(text: "Complaint", image: "square.and.pencil")
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    var noticeBoardBackView : UIView = {
       let view = UIView()
//        view.backgroundColor = .yellow
        view.backgroundColor = .systemBackground

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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

    private func configureUI(){
        
        let uiViewHeight = CGFloat(60)
        let uiviewWidth = CGFloat(60)
        
        //setting NavBar
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = UIColor(named: "darkPurple")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(notificationButtonPressed))

        let studentGesture = UITapGestureRecognizer(target: self, action: #selector(studentManagementButtonPressed))
        studentManagementView.addGestureRecognizer(studentGesture)
        
        let teacherGesture = UITapGestureRecognizer(target: self, action: #selector(teacherManagementButtonPressed))
        teacherManagementView.addGestureRecognizer(teacherGesture)
        
        let classesGesture = UITapGestureRecognizer(target: self, action: #selector(classesButtonPressed))
        classesView.addGestureRecognizer(classesGesture)
        
        let calenderGesture = UITapGestureRecognizer(target: self, action: #selector(calenderButtonPressed))
        calenderView.addGestureRecognizer(calenderGesture)
        
        let complaintGesture = UITapGestureRecognizer(target: self, action: #selector(complaintButtonPressed))
        complaintView.addGestureRecognizer(complaintGesture)
        
        let noticeBoardGesture = UITapGestureRecognizer(target: self, action: #selector(noticeBoardButtonPressed))
        noticeBoardBackView.addGestureRecognizer(noticeBoardGesture)
        
        view.addSubview(backGroundContainerView)
        backGroundContainerView.addSubview(slider)
        backGroundContainerView.addSubview(dashboardButtonsStackView)
        
//        studentManagementBackView.addSubview(studentManagementView)
        
        
        dashboardButtonsStackView.addArrangedSubview(studentAndTeacherStackView)
        dashboardButtonsStackView.addArrangedSubview(classesAndCalenderStackView)
        dashboardButtonsStackView.addArrangedSubview(complainAndNoticeBoardStackView)


        studentAndTeacherStackView.addArrangedSubview(studentManagementBackView)
        studentAndTeacherStackView.addArrangedSubview(teacherManagementBackView)
        
        classesAndCalenderStackView.addArrangedSubview(classesBackView)
        classesAndCalenderStackView.addArrangedSubview(calenderBackView)
        
        complainAndNoticeBoardStackView.addArrangedSubview(complaintBackView)
        complainAndNoticeBoardStackView.addArrangedSubview(noticeBoardBackView)
        
        studentManagementBackView.addSubview(studentManagementView)
        teacherManagementBackView.addSubview(teacherManagementView)
        
        classesBackView.addSubview(classesView)
        calenderBackView.addSubview(calenderView)
        
        complaintBackView.addSubview(complaintView)
        noticeBoardBackView.addSubview(noticeBoardView)
        
      
        NSLayoutConstraint.activate([
            
            backGroundContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            backGroundContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGroundContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backGroundContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -20),
            
            slider.topAnchor.constraint(equalTo: backGroundContainerView.safeAreaLayoutGuide.topAnchor),
            slider.leadingAnchor.constraint(equalTo: backGroundContainerView.leadingAnchor, constant: 0),
            slider.trailingAnchor.constraint(equalTo: backGroundContainerView.trailingAnchor,constant: 0),
//            slider.heightAnchor.constraint(equalToConstant: 250),
            slider.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            
            dashboardButtonsStackView.topAnchor.constraint(equalTo: slider.bottomAnchor),
            dashboardButtonsStackView.leadingAnchor.constraint(equalTo: backGroundContainerView.leadingAnchor),
            dashboardButtonsStackView.trailingAnchor.constraint(equalTo: backGroundContainerView.trailingAnchor),
            dashboardButtonsStackView.bottomAnchor.constraint(equalTo: backGroundContainerView.bottomAnchor ),

            studentManagementView.centerXAnchor.constraint(equalTo: studentManagementBackView.centerXAnchor ),
            studentManagementView.centerYAnchor.constraint(equalTo: studentManagementBackView.centerYAnchor ),
            studentManagementView.heightAnchor.constraint(equalToConstant: uiviewWidth),
            studentManagementView.widthAnchor.constraint(equalToConstant: uiViewHeight),

            teacherManagementView.centerXAnchor.constraint(equalTo: teacherManagementBackView.centerXAnchor ),
            teacherManagementView.centerYAnchor.constraint(equalTo: teacherManagementBackView.centerYAnchor),
            teacherManagementView.heightAnchor.constraint(equalToConstant: uiviewWidth),
            teacherManagementView.widthAnchor.constraint(equalToConstant: uiViewHeight),
            
            classesView.centerXAnchor.constraint(equalTo: classesBackView.centerXAnchor),
            classesView.centerYAnchor.constraint(equalTo: classesBackView.centerYAnchor),
            classesView.heightAnchor.constraint(equalToConstant: uiviewWidth),
            classesView.widthAnchor.constraint(equalToConstant: uiViewHeight),
            
            calenderView.centerXAnchor.constraint(equalTo: calenderBackView.centerXAnchor),
            calenderView.centerYAnchor.constraint(equalTo: calenderBackView.centerYAnchor),
            calenderView.heightAnchor.constraint(equalToConstant: uiviewWidth),
            calenderView.widthAnchor.constraint(equalToConstant: uiViewHeight),
            
            complaintView.centerXAnchor.constraint(equalTo: complaintBackView.centerXAnchor),
            complaintView.centerYAnchor.constraint(equalTo: complaintBackView.centerYAnchor ),
            complaintView.heightAnchor.constraint(equalToConstant: uiviewWidth),
            complaintView.widthAnchor.constraint(equalToConstant: uiViewHeight),
            
            noticeBoardView.centerXAnchor.constraint(equalTo: noticeBoardBackView.centerXAnchor ),
            noticeBoardView.centerYAnchor.constraint(equalTo: noticeBoardBackView.centerYAnchor ),
            noticeBoardView.heightAnchor.constraint(equalToConstant: uiviewWidth),
            noticeBoardView.widthAnchor.constraint(equalToConstant: uiViewHeight),

        ])
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
        let vc = ClassesManagementViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
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


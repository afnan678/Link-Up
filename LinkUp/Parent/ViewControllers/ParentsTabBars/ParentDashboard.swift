//
//  ParentDashboard.swift
//  LinkUp
//
//  Created by Hamza Malik on 31/05/2023.
//

import Foundation
import UIKit


class ParentDashboard: UIViewController {
    
//    var titleBackgroundLabel : UILabel = {
//
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.backgroundColor = UIColor(named: "darkPurple")
//
//        return lbl
//    }()
//
//    var studentProfileLabel : UILabel = {
//
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "STUDENT PROFILE"
//        lbl.textColor = .black
//        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
//        return lbl
//    }()
//
//    var attendenceLabel : UILabel = {
//
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "ATTENDENCE"
//        lbl.textColor = .black
//        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
//        return lbl
//    }()
//
//    var AssessmentLabel : UILabel = {
//
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "ASSESSMENT"
//        lbl.textColor = .black
//        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
//        return lbl
//    }()
//
//    var classRoomLabel : UILabel = {
//
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "CLASSROOM"
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
//    var noticeBoardLabel : UILabel = {
//
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "NOTICEBOARD"
//        lbl.textColor = .black
//        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
//        return lbl
//    }()
//
//    var slider : UIImageView = {
//        let img = UIImageView()
//        img.translatesAutoresizingMaskIntoConstraints = false
//        img.image = UIImage.init(named: "school.png")
//        img.contentMode = .scaleAspectFill
//        return img
//
//    }()
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
//    var studentProfileButton : UIButton = {
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
//        bttn.addTarget( self, action: #selector(studentProfileButtonPressed), for: .touchUpInside)
//        return bttn
//
//    }()
//
//
//
//    var attendenceButton : UIButton = {
//        let bttn = UIButton()
//        bttn.translatesAutoresizingMaskIntoConstraints = false
//        bttn.backgroundColor = .white
//        bttn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
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
//        bttn.addTarget(self, action: #selector(attendenceButtonPressed), for: .touchUpInside)
//        return bttn
//
//    }()
//
//
//    var assessmentButton : UIButton = {
//        let bttn = UIButton(type: .system)
//        bttn.translatesAutoresizingMaskIntoConstraints = false
//        bttn.backgroundColor = .white
//        bttn.setImage(UIImage(systemName: "app.badge.checkmark.fill"), for: .normal)
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
//        bttn.addTarget( self, action: #selector(assessmentButtonPressed), for: .touchUpInside)
//        return bttn
//
//    }()
//
//
//    var classroomButton : UIButton = {
//        let bttn = UIButton(type: .detailDisclosure)
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
//        bttn.addTarget( self, action: #selector(classroomButtonPressed), for: .touchUpInside)
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
//        bttn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 25)
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
    var studentProfileAndAttendenceStackView : UIStackView = {
        let obj = UIStackView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.axis = .horizontal
        obj.distribution = .fillEqually
//        obj.alignment = .fill
        obj.backgroundColor = .blue
//        obj.spacing = 130
        return obj
    }()
    var studentProfileBackView : UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var studentProfileView : TopImageBottomLabelView = {
        let obj = TopImageBottomLabelView(text: "STUDENT PROFILE", image: "person.crop.circle")
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.isUserInteractionEnabled = true
        return obj
    }()
    var attendenceBackView : UIView = {
       let view = UIView()
//        view.backgroundColor = .orange
        view.backgroundColor = .systemBackground

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var attendenceView : TopImageBottomLabelView = {
        let obj = TopImageBottomLabelView(text: "ATTENDENCE", image: "checkmark.circle.fill")
        obj.translatesAutoresizingMaskIntoConstraints = false
//        obj.backgroundColor = .orange
        obj.backgroundColor = .systemBackground

        return obj
    }()
    var assessmentAndClassRoomStackView : UIStackView = {
        let obj = UIStackView()
        obj.axis = .horizontal
        obj.distribution = .fillEqually
//        obj.alignment = .center
//        obj.backgroundColor = .green
        obj.backgroundColor = .systemBackground

        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    var assessmentBackView : UIView = {
       let view = UIView()
//        view.backgroundColor = .orange
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var assessmentView : TopImageBottomLabelView = {
        let obj = TopImageBottomLabelView(text: "ASSESSMENT", image: "app.badge.checkmark.fill")
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    var classRoomBackView : UIView = {
       let view = UIView()
//        view.backgroundColor = .red
        view.backgroundColor = .systemBackground

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var classRoomView : TopImageBottomLabelView = {
        let obj = TopImageBottomLabelView(text: "CLASSROOM", image: "studentdesk")
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    var calenderAndNoticeBoardStackView : UIStackView = {
        let obj = UIStackView()
        obj.axis = .horizontal
        obj.distribution = .fillEqually
//        obj.backgroundColor = .orange
        obj.backgroundColor = .systemBackground

//        obj.alignment = .center
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    var calenderBackView : UIView = {
       let view = UIView()
//        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var calenderView : TopImageBottomLabelView = {
        let obj = TopImageBottomLabelView(text: "CALENDER", image: "calendar")
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
        
//        //setting NavBar
//        view.backgroundColor = .systemBackground
//        navigationController?.navigationBar.backgroundColor = UIColor(named: "darkPurple")
////        navigationController?.navigationBar.barTintColor = UIColor(named: "darkPurple")
//        navigationItem.title = "Dashboard"
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        let notificationItem = UIBarButtonItem(customView: notificationButton)
//        self.navigationItem.rightBarButtonItem = notificationItem

//
        let uiViewHeight = CGFloat(60)
        let uiviewWidth = CGFloat(60)
        
        //setting NavBar
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = UIColor(named: "darkPurple")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(notificationButtonPressed))
        
//        view.addSubview(titleBackgroundLabel)
//        view.addSubview(studentProfileLabel)
//        view.addSubview(attendenceLabel)
//        view.addSubview(AssessmentLabel)
//        view.addSubview(classRoomLabel)
//        view.addSubview(calenderLabel)
//        view.addSubview(noticeBoardLabel)
//        view.addSubview(slider)
//        view.addSubview(studentProfileButton)
//        view.addSubview(assessmentButton)
//        view.addSubview(classroomButton)
//        view.addSubview(calenderButton)
//        view.addSubview(noticeBoardButton)
//        view.addSubview(attendenceButton)
        
        let profileGesture = UITapGestureRecognizer(target: self, action: #selector(studentProfileButtonPressed))
        studentProfileView.addGestureRecognizer(profileGesture)
        
        let attendenceGesture = UITapGestureRecognizer(target: self, action: #selector(attendenceButtonPressed))
        attendenceView.addGestureRecognizer(attendenceGesture)
        
        let assessmentGesture = UITapGestureRecognizer(target: self, action: #selector(assessmentButtonPressed))
        assessmentView.addGestureRecognizer(assessmentGesture)
        
        let classRoomGesture = UITapGestureRecognizer(target: self, action: #selector(classroomButtonPressed))
        classRoomView.addGestureRecognizer(classRoomGesture)
        
        let calenderGesture = UITapGestureRecognizer(target: self, action: #selector(calenderButtonPressed))
        calenderView.addGestureRecognizer(calenderGesture)
        
        let noticeBoardGesture = UITapGestureRecognizer(target: self, action: #selector(noticeBoardButtonPressed))
        noticeBoardBackView.addGestureRecognizer(noticeBoardGesture)
        
        view.addSubview(backGroundContainerView)
        backGroundContainerView.addSubview(slider)
        backGroundContainerView.addSubview(dashboardButtonsStackView)
        
//        studentProfileBackView.addSubview(studentProfileView)
        
        
        dashboardButtonsStackView.addArrangedSubview(studentProfileAndAttendenceStackView)
        dashboardButtonsStackView.addArrangedSubview(assessmentAndClassRoomStackView)
        dashboardButtonsStackView.addArrangedSubview(calenderAndNoticeBoardStackView)


        studentProfileAndAttendenceStackView.addArrangedSubview(studentProfileBackView)
        studentProfileAndAttendenceStackView.addArrangedSubview(attendenceBackView)
        
        assessmentAndClassRoomStackView.addArrangedSubview(assessmentBackView)
        assessmentAndClassRoomStackView.addArrangedSubview(classRoomBackView)
        
        calenderAndNoticeBoardStackView.addArrangedSubview(calenderBackView)
        calenderAndNoticeBoardStackView.addArrangedSubview(noticeBoardBackView)
        
        studentProfileBackView.addSubview(studentProfileView)
        attendenceBackView.addSubview(attendenceView)
        
        assessmentBackView.addSubview(assessmentView)
        classRoomBackView.addSubview(classRoomView)
        
        calenderBackView.addSubview(calenderView)
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

            studentProfileView.centerXAnchor.constraint(equalTo: studentProfileBackView.centerXAnchor ),
            studentProfileView.centerYAnchor.constraint(equalTo: studentProfileBackView.centerYAnchor ),
            studentProfileView.heightAnchor.constraint(equalToConstant: uiviewWidth),
            studentProfileView.widthAnchor.constraint(equalToConstant: uiViewHeight),

            attendenceView.centerXAnchor.constraint(equalTo: attendenceBackView.centerXAnchor ),
            attendenceView.centerYAnchor.constraint(equalTo: attendenceBackView.centerYAnchor),
            attendenceView.heightAnchor.constraint(equalToConstant: uiviewWidth),
            attendenceView.widthAnchor.constraint(equalToConstant: uiViewHeight),
            
            assessmentView.centerXAnchor.constraint(equalTo: assessmentBackView.centerXAnchor),
            assessmentView.centerYAnchor.constraint(equalTo: assessmentBackView.centerYAnchor),
            assessmentView.heightAnchor.constraint(equalToConstant: uiviewWidth),
            assessmentView.widthAnchor.constraint(equalToConstant: uiViewHeight),
            
            classRoomView.centerXAnchor.constraint(equalTo: classRoomBackView.centerXAnchor),
            classRoomView.centerYAnchor.constraint(equalTo: classRoomBackView.centerYAnchor),
            classRoomView.heightAnchor.constraint(equalToConstant: uiviewWidth),
            classRoomView.widthAnchor.constraint(equalToConstant: uiViewHeight),
            
            calenderView.centerXAnchor.constraint(equalTo: calenderBackView.centerXAnchor),
            calenderView.centerYAnchor.constraint(equalTo: calenderBackView.centerYAnchor ),
            calenderView.heightAnchor.constraint(equalToConstant: uiviewWidth),
            calenderView.widthAnchor.constraint(equalToConstant: uiViewHeight),
            
            noticeBoardView.centerXAnchor.constraint(equalTo: noticeBoardBackView.centerXAnchor ),
            noticeBoardView.centerYAnchor.constraint(equalTo: noticeBoardBackView.centerYAnchor ),
            noticeBoardView.heightAnchor.constraint(equalToConstant: uiviewWidth),
            noticeBoardView.widthAnchor.constraint(equalToConstant: uiViewHeight),

            
//            slider.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 30),
//            slider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
//            slider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 0),
//            slider.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
//
//            studentProfileLabel.topAnchor.constraint(equalTo: studentProfileButton.bottomAnchor, constant: 10),
//            studentProfileLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 28),
//            attendenceLabel.topAnchor.constraint(equalTo: attendenceButton.bottomAnchor, constant: 10),
//            attendenceLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -28),
//
//            AssessmentLabel.topAnchor.constraint(equalTo: assessmentButton.bottomAnchor, constant: 10),
//            AssessmentLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 65),
//
//            classRoomLabel.topAnchor.constraint(equalTo: classroomButton.bottomAnchor, constant: 10),
//            classRoomLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -65),
//
//            calenderLabel.topAnchor.constraint(equalTo: calenderButton.bottomAnchor, constant: 10),
//            calenderLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 65),
//
//            noticeBoardLabel.topAnchor.constraint(equalTo: noticeBoardButton.bottomAnchor, constant: 10),
//            noticeBoardLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -53),
//
//            studentProfileButton.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 40),
//            studentProfileButton.heightAnchor.constraint(equalToConstant: 90),
//            studentProfileButton.widthAnchor.constraint(equalToConstant: 90),
//            studentProfileButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
//
//            attendenceButton.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 40),
//            attendenceButton.heightAnchor.constraint(equalToConstant: 90),
//            attendenceButton.widthAnchor.constraint(equalToConstant: 90),
//            attendenceButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -50),
//
//            assessmentButton.topAnchor.constraint(equalTo: studentProfileLabel.bottomAnchor, constant: 20),
//            assessmentButton.heightAnchor.constraint(equalToConstant: 90),
//            assessmentButton.widthAnchor.constraint(equalToConstant: 90),
//            assessmentButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
//
//            classroomButton.topAnchor.constraint(equalTo: attendenceLabel.bottomAnchor, constant: 20),
//            classroomButton.heightAnchor.constraint(equalToConstant: 90),
//            classroomButton.widthAnchor.constraint(equalToConstant: 90),
//            classroomButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -50),
//
//            calenderButton.topAnchor.constraint(equalTo: AssessmentLabel.bottomAnchor, constant: 20),
//            calenderButton.heightAnchor.constraint(equalToConstant: 90),
//            calenderButton.widthAnchor.constraint(equalToConstant: 90),
//            calenderButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
//
//            noticeBoardButton.topAnchor.constraint(equalTo: classRoomLabel.bottomAnchor, constant: 20),
//            noticeBoardButton.heightAnchor.constraint(equalToConstant: 90),
//            noticeBoardButton.widthAnchor.constraint(equalToConstant: 90),
//            noticeBoardButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -50),


        ])
    }
    
    //  Functions
  

    @objc func notificationButtonPressed(){
        print("Notification")

    }
    @objc func studentProfileButtonPressed(){
        print("profile")
        let vc = ParentProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func attendenceButtonPressed(){
        print("attendence")
        let vc = AttendenceReportViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func assessmentButtonPressed(){
        print("Assessment button")
    }
    @objc func classroomButtonPressed(){
        print("classroom button")
    }
    @objc func calenderButtonPressed(){
        print("calennder button")
        let vc = StudentReport_VS()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc func noticeBoardButtonPressed(){
        print("notice")
        let vc = DisplayParentAnnouncementViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }

}

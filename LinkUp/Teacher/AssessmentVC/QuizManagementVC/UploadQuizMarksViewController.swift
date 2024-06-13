//
//  QuizManagementVIewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 12/06/2023.
//

import Foundation
import UIKit

class UploadQuizMarksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let BackgroundView_StackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.backgroundColor = .purple
        view.distribution = .fillEqually
        return view
    }()
    
    let QuizNoBAackground_StackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.backgroundColor = .white
        view.distribution = .fillEqually
        return view
    }()
    
    var QuizNo_Label : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Quiz No"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 16.0)
        return lbl
    }()
    var QuizNoShow_Label : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Quiz 1"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 13.0)
        return lbl
    }()
    
    let SubjectBAackground_StackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.backgroundColor = .white
        view.distribution = .fillEqually
        return view
    }()
    
    var SubjectName_Label : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Subject Name"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 16.0)
        return lbl
    }()
    var SubjectNameShow_Label : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Science"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 13.0)
        return lbl
    }()
    
    
    let DateBAackground_StackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.backgroundColor = .white
        view.distribution = .fillEqually
        return view
    }()
    
    var DateName_Label : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Date"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 16.0)
        return lbl
    }()
    var DateShow_Label : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "2 May 2023"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 13.0)
        return lbl
    }()
    
    
    let StudentDetailsBackground_StackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.backgroundColor = .white
        view.distribution = .fillEqually
        return view
    }()
    
    var StudentRollNO_Label : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Roll NO"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 13.0)
        return lbl
    }()
    var StudentName_Label : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Name"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 13.0)
        return lbl
    }()
    
    var StudentTotalMarks_Label : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Total Marks"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 13.0)
        return lbl
    }()
    
    var StudentObtainMarks_Label : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Obtain Marks"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 13.0)
        return lbl
    }()
    
    let StudentTableBackGroundView: UIView = {
       
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
        
    }()
    
    
    
    var Quiz_name = "1"
    var Subject_marks = "1"
    var Quizdate = "1"
    var QuizTotalmarks = "10"
    
    let tableView = UITableView()
        var numberOfRows = 20

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tablea.dequeueReusableCell(withIdentifier: QuizMarksUploadCustomCell.identifier, for: indexPath) as? QuizMarksUploadCustomCell else {
            return UITableViewCell()
        }
        cell.configure(text: Quiz_name ,subject: Subject_marks ,obtainmarks: "8", TotalMarks: QuizTotalmarks, date: Quizdate)

        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    
    
    private let tablea: UITableView = {
        
        let tab = UITableView()
        tab.translatesAutoresizingMaskIntoConstraints = false
        tab.register(QuizMarksUploadCustomCell.self, forCellReuseIdentifier: QuizMarksUploadCustomCell.identifier)
        return tab
        
    }()
    
    
    
    
    
    let SaveCancelButtonBackground_StackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.backgroundColor = .white
        view.distribution = .fillEqually
        return view
    }()
    
    
    var extra1_Label : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //    button
        var SaveButton : UIButton = {

            let buttn = UIButton(type: .system)
            buttn.translatesAutoresizingMaskIntoConstraints = false
            buttn.translatesAutoresizingMaskIntoConstraints = false
            buttn.setTitle("Save", for: .normal)
            buttn.titleLabel?.font = UIFont (name: "Helvetica", size: 20)
            buttn.setTitleColor(.white, for: .normal)
            buttn.backgroundColor = UIColor(named: "UiColor")
            buttn.layer.cornerRadius = 10
            buttn.layer.shadowColor = UIColor.black.cgColor
            buttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
            buttn.layer.shadowOpacity = 0.1
            buttn.layer.shadowRadius = 0.0
            buttn.layer.masksToBounds = false
            buttn.addTarget( self, action: #selector(SaveButton_press), for: .touchUpInside)
            return buttn
        }()
        @objc func SaveButton_press(){
            

        }
    //    button
        var CancelButton : UIButton = {

            let buttn = UIButton(type: .system)
            buttn.translatesAutoresizingMaskIntoConstraints = false
            buttn.translatesAutoresizingMaskIntoConstraints = false
            buttn.setTitle("Cancel", for: .normal)
            buttn.titleLabel?.font = UIFont (name: "Helvetica", size: 20)
            buttn.setTitleColor(.white, for: .normal)
            buttn.backgroundColor = .gray
            buttn.layer.cornerRadius = 10
            buttn.layer.shadowColor = UIColor.black.cgColor
            buttn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
            buttn.layer.shadowOpacity = 0.1
            buttn.layer.shadowRadius = 0.0
            buttn.layer.masksToBounds = false
            buttn.addTarget( self, action: #selector(CancelButton_press), for: .touchUpInside)
            return buttn
        }()
        @objc func CancelButton_press(){
            
            
        }
    
    var extra2_Label : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        titleui()
        ConfigerUI()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tablea.dataSource = self
        tablea.delegate = self
        tablea.frame = view.bounds
    }
    
    func titleui()
    {
        title = "Upload Marks"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = UIColor(named: "darkPurple")
    }
    
    
    @objc func ConfigerUI()
    {
        view.addSubview(BackgroundView_StackView)
        
        BackgroundView_StackView.addArrangedSubview(QuizNoBAackground_StackView)
        QuizNoBAackground_StackView.addArrangedSubview(QuizNo_Label)
        QuizNoBAackground_StackView.addArrangedSubview(QuizNoShow_Label)
        
        BackgroundView_StackView.addArrangedSubview(SubjectBAackground_StackView)
        SubjectBAackground_StackView.addArrangedSubview(SubjectName_Label)
        SubjectBAackground_StackView.addArrangedSubview(SubjectNameShow_Label)
        
        BackgroundView_StackView.addArrangedSubview(DateBAackground_StackView)
        DateBAackground_StackView.addArrangedSubview(DateName_Label)
        DateBAackground_StackView.addArrangedSubview(DateShow_Label)
        
        BackgroundView_StackView.addArrangedSubview(StudentDetailsBackground_StackView)
        StudentDetailsBackground_StackView.addArrangedSubview(StudentRollNO_Label)
        StudentDetailsBackground_StackView.addArrangedSubview(StudentName_Label)
        StudentDetailsBackground_StackView.addArrangedSubview(StudentTotalMarks_Label)
        StudentDetailsBackground_StackView.addArrangedSubview(StudentObtainMarks_Label)



        
        BackgroundView_StackView.addArrangedSubview(StudentTableBackGroundView)
        StudentTableBackGroundView.addSubview(tablea)
        
        BackgroundView_StackView.addArrangedSubview(SaveCancelButtonBackground_StackView)
        SaveCancelButtonBackground_StackView.addArrangedSubview(CancelButton)
        SaveCancelButtonBackground_StackView.addArrangedSubview(extra2_Label)
        SaveCancelButtonBackground_StackView.addArrangedSubview(extra1_Label)
        SaveCancelButtonBackground_StackView.addArrangedSubview(SaveButton)

        
        NSLayoutConstraint.activate([
            
            BackgroundView_StackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            BackgroundView_StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            BackgroundView_StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            BackgroundView_StackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
            QuizNoBAackground_StackView.heightAnchor.constraint(equalTo: BackgroundView_StackView.heightAnchor, multiplier: 0.05),
            SubjectBAackground_StackView.heightAnchor.constraint(equalTo: BackgroundView_StackView.heightAnchor, multiplier: 0.05),
            DateBAackground_StackView.heightAnchor.constraint(equalTo: BackgroundView_StackView.heightAnchor, multiplier: 0.05),
            StudentDetailsBackground_StackView.heightAnchor.constraint(equalTo: BackgroundView_StackView.heightAnchor, multiplier: 0.05),
            StudentTableBackGroundView.heightAnchor.constraint(equalTo: BackgroundView_StackView.heightAnchor, multiplier: 0.75),
            SaveCancelButtonBackground_StackView.heightAnchor.constraint(equalTo: BackgroundView_StackView.heightAnchor, multiplier: 0.05),

        
        ])
    }
    
}

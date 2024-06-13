//
//  ProgressReportVC.swift
//  LinkUp
//
//  Created by Afnan Ahmed on 04/08/2023.
//

import Foundation
import UIKit
class StudentReport_VS: UIViewController {

    let backgroundview: UIScrollView = {
        
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    
    let topView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let bottonView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
        
    }()
    
    let AttendaceReportView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let AcadmicReportview1 : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let AcadmicReportview2 : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let AcadmicReportview3 : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let RemarksView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var stackView : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .red
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 5
        return view
        
    }()
    
    
    let stackview1: UIStackView = {
       
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.axis = .vertical
        view.spacing = 0
        return view
    }()
    
    let AttendanceReport_StackView: UIStackView = {
       
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "lightPurple")
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    let QuizMarks_BG_StackView: UIStackView = {
       
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "lightPurple")
        view.axis = .vertical
        view.distribution = .fill
        view.layer.cornerRadius = 8
        return view
    }()
    
    let QuizMarks_Lable_BG_StackView: UIStackView = {
       
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.layer.cornerRadius = 8
        return view
    }()
    
    
    let quizNo_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Quiz No"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    let quiz_Subject_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Subject"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    let quiz_Omarks_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Obtain Marks"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    let quiz_Tmarks_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Total Marks"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    
    
    let QuizMarks_TableView_BG_StackView: UIView = {
       
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 8
        return view
    }()
    
    
    
    
    private let quizMarksTable: UITableView = {

        let tab = UITableView()
        tab.translatesAutoresizingMaskIntoConstraints = false
        tab.register(QuizMarksTableCell.self, forCellReuseIdentifier: QuizMarksTableCell.identifier)
        return tab

    }()
    
    
    let QuizMarks_Wait_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Marks did not Upload"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    
    
    let Term1Marks_BG_StackView: UIStackView = {
       
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "lightPurple")
        view.axis = .vertical
        view.distribution = .fill
        view.layer.cornerRadius = 8
        return view
    }()
    
    let Term1Marks_Lable_BG_StackView: UIStackView = {
       
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.layer.cornerRadius = 8
        return view
    }()
    
    
    
    let Term1_Subject_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Subject"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    let Term1_Omarks_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Obtain Marks"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    let Term1_Tmarks_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Total Marks"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    
    
    let Term1Marks_TableView_BG_StackView: UIView = {
       
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 8
        return view
    }()
    
    
    
    private let Term1Marks_Table: UITableView = {

        let tab = UITableView()
        tab.translatesAutoresizingMaskIntoConstraints = false
        tab.register(Term1MarksTableCell.self, forCellReuseIdentifier: Term1MarksTableCell.identifier)
        return tab

    }()
    
    
    let Term1_Wait_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Marks did not Upload"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    
    
    
    
    let FinalMarks_BG_StackView: UIStackView = {
       
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "lightPurple")
        view.axis = .vertical
        view.distribution = .fill
        view.layer.cornerRadius = 8
        return view
    }()
    
    
    
    
    let FinalMarks_Lable_BG_StackView: UIStackView = {
       
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.layer.cornerRadius = 8
        return view
    }()
    
    
    
    let Final_Subject_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Subject"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    let Final_Omarks_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Obtain Marks"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    let Final_Tmarks_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Total Marks"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    
    
    let FinalMarks_TableView_BG_StackView: UIView = {
       
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let FinalMarks_Table: UITableView = {

        let tab = UITableView()
        tab.translatesAutoresizingMaskIntoConstraints = false
        tab.register(FinalMarksTableCell.self, forCellReuseIdentifier: FinalMarksTableCell.identifier)
        return tab

    }()
    
    let FinalMarks_Wait_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Marks did not Upload"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    
    
    
    
    let Remarks_StackView: UIStackView = {
       
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "lightPurple")
        view.layer.cornerRadius = 8
        return view
    }()
    
//    all table view managment in this code
    
    var Information_List: [String] = ["Roll No : ", "Date of Birth : ", "Father's Name : ", "Embergancy Contact : "]
    var Student_Name: [String] = ["\(ParentRecordModel.shared.studentRollNo)", "\(ParentRecordModel.shared.studentDOB)", "\(ParentRecordModel.shared.fatherName)", "\(ParentRecordModel.shared.fatherPhoneNo)"]
    

    
    private let StudentInfoTable: UITableView = {

        let tab = UITableView()
        tab.translatesAutoresizingMaskIntoConstraints = false
        tab.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tab

    }()
    
    let ProformanceProfile_lbl: BorderedLabel = {
        
        var lbl = BorderedLabel(frame: CGRect(x: 50, y: 50, width: 200, height: 50))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "PROFORMANCE PROFILE"
        lbl.textColor = UIColor(named: "UiColor")
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 17)
        return lbl
    }()

    let AttendaceReport_lbl: BorderedLabel = {
        
        var lbl = BorderedLabel(frame: CGRect(x: 50, y: 50, width: 200, height: 50))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "ATTENDANCE"
        lbl.textColor = UIColor(named: "UiColor")
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 17)
        return lbl
    }()
    
    let AcadmicReport_lbl: BorderedLabel = {
        
        var lbl = BorderedLabel(frame: CGRect(x: 50, y: 50, width: 200, height: 50))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "ACADMIN PROFORMANCE"
        lbl.textColor = UIColor(named: "UiColor")
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 17)
        return lbl
    }()
    

    let AttendaceReport1_lbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "0/0 Days" // Access properties from the instance
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 17)
        return lbl
    }()
    
    let AttendaceReport2_lbl: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Please Wait ....."
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    
    let TermI_lbl: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Quiz Marks"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    let TermII_lbl: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Term I"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    let FinalTerm_lbl: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Final Term"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    let RemarksBY_lbl: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Remarks By Teacher"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    let RemarksWrite_lbl: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Your child is able to take responsibility for her own actions both in and out of the classroom. She/He often checks her agenda and day planner to make sure she/he has all of the necessary materials to complete work at home before leaving. During indoor recess, she/He takes time to tidy up everything she was playing with."
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.numberOfLines = 10
        lbl.font = UIFont.systemFont(ofSize: 12)
        return lbl
    }()
    
    var profile_lable : UILabel = {
       
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.textColor = .white
        lbl.backgroundColor = .red
        lbl.font = UIFont.boldSystemFont(ofSize: 25.0)
        return lbl
    }()
    var Student_Profile_Name_lable : UILabel = {
       
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ParentRecordModel.shared.studentName
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        lbl.layer.shadowColor = UIColor.black.cgColor
        lbl.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        lbl.layer.shadowOpacity = 0.5
        lbl.layer.shadowRadius = 2
        lbl.layer.masksToBounds = false
        return lbl
    }()
    
    var Class_Name_Lable : UILabel = {
       
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Class : \(ParentRecordModel.shared.studentClass)"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 15.0)
        lbl.layer.shadowColor = UIColor.black.cgColor
        lbl.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        lbl.layer.shadowOpacity = 0.2
        lbl.layer.shadowRadius = 1
        lbl.layer.masksToBounds = false
        return lbl
    }()
    
    //image
    var image : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
//        img.layer.shadowColor = UIColor.black.cgColor
//        img.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
//        img.layer.shadowOpacity = 1
//        img.layer.shadowRadius = 2
        img.layer.masksToBounds = false
//        img.layer.cornerRadius = img.frame.size.width / 2
        img.layer.cornerRadius = 50
//        img.layer.borderWidth = 0.5
        img.layer.borderColor = UIColor.white.cgColor
        img.image = ParentRecordModel.shared.studentImage!
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Student Information"
        view.backgroundColor = .systemBackground
        title_bar()
        ConfigureUI()
        fetchQuizesDataFromFirebase2(Quiz: "Quizes"){ [self] sucsse in
                        
            if(QuizMarksData.records.count == 0)
            {
                MidTermMarksData.records.removeAll()
                quizMarksTable.reloadData()

            }
            else
            {
                QuizMarks_Wait_Lable.isHidden = true
                quizMarksTable.reloadData()
                
            }
        }
        
        
        fetchAttendenceDataFromFirebase3(Quiz: "Attendence"){ [self] sucsse in
            print(sucsse)
            AttendaceReport1_lbl.text = "\(totalPresennts)/\(totalAttendace) Days"
            var n = (totalPresennts*100)/totalAttendace
            AttendaceReport2_lbl.text = "\(n)% total attendance of the student"
        }
        fetchMidsMarksDataFromFirebase(Quiz: "Classes"){ [self] sucsse in
            
            print(sucsse)
            print("Mids")
            
            print(MidTermMarksData.records.count)
            if(MidTermMarksData.records.count == 1)
            {
                MidTermMarksData.records.removeAll()
                Term1Marks_Table.reloadData()

            }
            else
            {
                Term1_Wait_Lable.isHidden = true
                Term1Marks_Table.reloadData()
                
            }

            
        }
        fetchFinalMarksDataFromFirebase(Quiz: "Classes"){ [self] sucsse in
            
            print(sucsse)
            print("Final")
            
            print(FinalMarksData.records.count)
            if(FinalMarksData.records.count == 1)
            {
                FinalMarksData.records.removeAll()
                FinalMarks_Table.reloadData()

            }
            else
            {
                FinalMarks_Wait_Lable.isHidden = true
                FinalMarks_Table.reloadData()
            }
        }

    }
//    for table view
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        StudentInfoTable.dataSource = self
        StudentInfoTable.delegate = self
        StudentInfoTable.frame = view.bounds

        quizMarksTable.dataSource = self
        quizMarksTable.delegate = self
        quizMarksTable.frame = view.bounds
        
        Term1Marks_Table.dataSource = self
        Term1Marks_Table.delegate = self
        Term1Marks_Table.frame = view.bounds
        
        FinalMarks_Table.dataSource = self
        FinalMarks_Table.delegate = self
        FinalMarks_Table.frame = view.bounds

    }
    func title_bar ()
    {
        title = "Progress Report"
        view.backgroundColor = .white
        UINavigationBar.appearance().backgroundColor = UIColor(named: "UiColor")
        UINavigationBar.appearance().barTintColor = UIColor(named: "UiColor")  // solid color
        UIBarButtonItem.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        UITabBar.appearance().barTintColor = .white
        
        
    }
    
    func ConfigureUI ()
    {
        
        view.addSubview(backgroundview)
        backgroundview.addSubview(stackview1)
        stackview1.addArrangedSubview(topView)
        stackview1.addArrangedSubview(bottonView)
        stackview1.addArrangedSubview(AttendaceReportView)
        stackview1.addArrangedSubview(AcadmicReportview1)
        stackview1.addArrangedSubview(AcadmicReportview2)
        stackview1.addArrangedSubview(AcadmicReportview3)
        stackview1.addArrangedSubview(RemarksView)
        
        topView.addSubview(ProformanceProfile_lbl)
        topView.addSubview(Student_Profile_Name_lable)
        topView.addSubview(image)
        topView.addSubview(Class_Name_Lable)
        
        bottonView.addSubview(StudentInfoTable)

        AttendaceReportView.addSubview(AttendaceReport_lbl)
        AttendaceReportView.addSubview(AttendanceReport_StackView)
        AttendanceReport_StackView.addSubview(AttendaceReport1_lbl)
        AttendanceReport_StackView.addSubview(AttendaceReport2_lbl)

        
        AcadmicReportview1.addSubview(AcadmicReport_lbl)
        AcadmicReportview1.addSubview(TermI_lbl)
        AcadmicReportview1.addSubview(QuizMarks_BG_StackView)
        
        
        QuizMarks_BG_StackView.addArrangedSubview(QuizMarks_Lable_BG_StackView)
        
        QuizMarks_Lable_BG_StackView.addArrangedSubview(quizNo_Lable)
        QuizMarks_Lable_BG_StackView.addArrangedSubview(quiz_Subject_Lable)
        QuizMarks_Lable_BG_StackView.addArrangedSubview(quiz_Omarks_Lable)
        QuizMarks_Lable_BG_StackView.addArrangedSubview(quiz_Tmarks_Lable)

        QuizMarks_BG_StackView.addArrangedSubview(QuizMarks_TableView_BG_StackView)
        
        QuizMarks_TableView_BG_StackView.addSubview(quizMarksTable)
        QuizMarks_TableView_BG_StackView.addSubview(QuizMarks_Wait_Lable)

        
        
        AcadmicReportview2.addSubview(TermII_lbl)
        AcadmicReportview2.addSubview(Term1Marks_BG_StackView)
        
        Term1Marks_BG_StackView.addArrangedSubview(Term1Marks_Lable_BG_StackView)
        Term1Marks_Lable_BG_StackView.addArrangedSubview(Term1_Subject_Lable)
        Term1Marks_Lable_BG_StackView.addArrangedSubview(Term1_Omarks_Lable)
        Term1Marks_Lable_BG_StackView.addArrangedSubview(Term1_Tmarks_Lable)
        
        Term1Marks_BG_StackView.addArrangedSubview(Term1Marks_TableView_BG_StackView)
        Term1Marks_TableView_BG_StackView.addSubview(Term1Marks_Table)
        Term1Marks_TableView_BG_StackView.addSubview(Term1_Wait_Lable)

        
        
        AcadmicReportview3.addSubview(FinalTerm_lbl)
        AcadmicReportview3.addSubview(FinalMarks_BG_StackView)
        
        FinalMarks_BG_StackView.addArrangedSubview(FinalMarks_Lable_BG_StackView)
        FinalMarks_Lable_BG_StackView.addArrangedSubview(Final_Subject_Lable)
        FinalMarks_Lable_BG_StackView.addArrangedSubview(Final_Omarks_Lable)
        FinalMarks_Lable_BG_StackView.addArrangedSubview(Final_Tmarks_Lable)
        
        FinalMarks_BG_StackView.addArrangedSubview(FinalMarks_TableView_BG_StackView)
        FinalMarks_TableView_BG_StackView.addSubview(FinalMarks_Table)
        FinalMarks_TableView_BG_StackView.addSubview(FinalMarks_Wait_Lable)
        
        RemarksView.addSubview(RemarksBY_lbl)
        RemarksView.addSubview(Remarks_StackView)
        Remarks_StackView.addSubview(RemarksWrite_lbl)
        
        
        NSLayoutConstraint.activate([
            
            backgroundview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackview1.topAnchor.constraint(equalTo: backgroundview.topAnchor),
            stackview1.leadingAnchor.constraint(equalTo: backgroundview.leadingAnchor),
            stackview1.trailingAnchor.constraint(equalTo: backgroundview.trailingAnchor),
            stackview1.bottomAnchor.constraint(equalTo: backgroundview.bottomAnchor),
            stackview1.widthAnchor.constraint(equalTo: backgroundview.widthAnchor),
            
            topView.leadingAnchor.constraint(equalTo: stackview1.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: stackview1.trailingAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            
            bottonView.leadingAnchor.constraint(equalTo: stackview1.leadingAnchor),
            bottonView.trailingAnchor.constraint(equalTo: stackview1.trailingAnchor),
            bottonView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            AttendaceReportView.leadingAnchor.constraint(equalTo: stackview1.leadingAnchor),
            AttendaceReportView.trailingAnchor.constraint(equalTo: stackview1.trailingAnchor),
            AttendaceReportView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            
            AttendanceReport_StackView.topAnchor.constraint(equalTo: AttendaceReport_lbl.bottomAnchor,constant: 7),
            AttendanceReport_StackView.heightAnchor.constraint(equalTo: AttendaceReportView.heightAnchor, multiplier: 0.55),
            AttendanceReport_StackView.widthAnchor.constraint(equalTo: AttendaceReportView.widthAnchor, multiplier: 0.9),
            AttendanceReport_StackView.centerXAnchor.constraint(equalTo: AttendaceReportView.centerXAnchor),
            
            
            AcadmicReportview1.leadingAnchor.constraint(equalTo: stackview1.leadingAnchor),
            AcadmicReportview1.trailingAnchor.constraint(equalTo: stackview1.trailingAnchor),
            AcadmicReportview1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            
            AcadmicReportview2.leadingAnchor.constraint(equalTo: stackview1.leadingAnchor),
            AcadmicReportview2.trailingAnchor.constraint(equalTo: stackview1.trailingAnchor),
            AcadmicReportview2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            AcadmicReportview3.leadingAnchor.constraint(equalTo: stackview1.leadingAnchor),
            AcadmicReportview3.trailingAnchor.constraint(equalTo: stackview1.trailingAnchor),
            AcadmicReportview3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            RemarksView.leadingAnchor.constraint(equalTo: stackview1.leadingAnchor),
            RemarksView.trailingAnchor.constraint(equalTo: stackview1.trailingAnchor),
            RemarksView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            
            QuizMarks_BG_StackView.topAnchor.constraint(equalTo: TermI_lbl.bottomAnchor,constant: 7),
            QuizMarks_BG_StackView.heightAnchor.constraint(equalTo: AcadmicReportview1.heightAnchor, multiplier: 0.7),
            QuizMarks_BG_StackView.widthAnchor.constraint(equalTo: AcadmicReportview1.widthAnchor, multiplier: 0.9),
            QuizMarks_BG_StackView.centerXAnchor.constraint(equalTo: AcadmicReportview1.centerXAnchor),
            
            QuizMarks_Lable_BG_StackView.heightAnchor.constraint(equalTo: QuizMarks_BG_StackView.heightAnchor, multiplier: 0.1),
            
            quizMarksTable.topAnchor.constraint(equalTo: QuizMarks_TableView_BG_StackView.topAnchor),
            quizMarksTable.trailingAnchor.constraint(equalTo: QuizMarks_TableView_BG_StackView.trailingAnchor),
            quizMarksTable.leadingAnchor.constraint(equalTo: QuizMarks_TableView_BG_StackView.leadingAnchor),
            quizMarksTable.bottomAnchor.constraint(equalTo: QuizMarks_TableView_BG_StackView.bottomAnchor),

            QuizMarks_Wait_Lable.centerXAnchor.constraint(equalTo: QuizMarks_TableView_BG_StackView.centerXAnchor),
            QuizMarks_Wait_Lable.centerYAnchor.constraint(equalTo: QuizMarks_TableView_BG_StackView.centerYAnchor),
            
            
            Term1Marks_BG_StackView.topAnchor.constraint(equalTo: TermII_lbl.bottomAnchor),
            Term1Marks_BG_StackView.heightAnchor.constraint(equalTo: AcadmicReportview2.heightAnchor, multiplier: 0.85),
            Term1Marks_BG_StackView.widthAnchor.constraint(equalTo: AcadmicReportview2.widthAnchor, multiplier: 0.9),
            Term1Marks_BG_StackView.centerXAnchor.constraint(equalTo: AcadmicReportview2.centerXAnchor),
            
            Term1Marks_Lable_BG_StackView.heightAnchor.constraint(equalTo: Term1Marks_BG_StackView.heightAnchor, multiplier: 0.1),

            Term1Marks_Table.topAnchor.constraint(equalTo: Term1Marks_TableView_BG_StackView.topAnchor),
            Term1Marks_Table.trailingAnchor.constraint(equalTo: Term1Marks_TableView_BG_StackView.trailingAnchor),
            Term1Marks_Table.leadingAnchor.constraint(equalTo: Term1Marks_TableView_BG_StackView.leadingAnchor),
            Term1Marks_Table.bottomAnchor.constraint(equalTo: Term1Marks_TableView_BG_StackView.bottomAnchor),
            
            Term1_Wait_Lable.centerXAnchor.constraint(equalTo: Term1Marks_TableView_BG_StackView.centerXAnchor),
            Term1_Wait_Lable.centerYAnchor.constraint(equalTo: Term1Marks_TableView_BG_StackView.centerYAnchor),
            
            
            FinalMarks_BG_StackView.topAnchor.constraint(equalTo: FinalTerm_lbl.bottomAnchor),
            FinalMarks_BG_StackView.heightAnchor.constraint(equalTo: AcadmicReportview3.heightAnchor, multiplier: 0.85),
            FinalMarks_BG_StackView.widthAnchor.constraint(equalTo: AcadmicReportview3.widthAnchor, multiplier: 0.9),
            FinalMarks_BG_StackView.centerXAnchor.constraint(equalTo: AcadmicReportview3.centerXAnchor),
            
            FinalMarks_Lable_BG_StackView.heightAnchor.constraint(equalTo: FinalMarks_BG_StackView.heightAnchor, multiplier: 0.1),
            
            FinalMarks_Table.topAnchor.constraint(equalTo: FinalMarks_TableView_BG_StackView.topAnchor),
            FinalMarks_Table.trailingAnchor.constraint(equalTo: FinalMarks_TableView_BG_StackView.trailingAnchor),
            FinalMarks_Table.leadingAnchor.constraint(equalTo: FinalMarks_TableView_BG_StackView.leadingAnchor),
            FinalMarks_Table.bottomAnchor.constraint(equalTo: FinalMarks_TableView_BG_StackView.bottomAnchor),
            
            FinalMarks_Wait_Lable.centerXAnchor.constraint(equalTo: FinalMarks_TableView_BG_StackView.centerXAnchor),
            FinalMarks_Wait_Lable.centerYAnchor.constraint(equalTo: FinalMarks_TableView_BG_StackView.centerYAnchor),

            
            Remarks_StackView.topAnchor.constraint(equalTo: RemarksBY_lbl.bottomAnchor),
            Remarks_StackView.heightAnchor.constraint(equalTo: RemarksView.heightAnchor, multiplier: 0.6),
            Remarks_StackView.widthAnchor.constraint(equalTo: RemarksView.widthAnchor, multiplier: 0.9),
            Remarks_StackView.centerXAnchor.constraint(equalTo: RemarksView.centerXAnchor),
            
            
//            image
            
            image.topAnchor.constraint(equalTo: Class_Name_Lable.bottomAnchor,constant: 5),
            image.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 100),
            image.widthAnchor.constraint(equalToConstant: 100),
//            image.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.32),
//            image.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.49),
            
            
            
            
//            labels
            
            ProformanceProfile_lbl.topAnchor.constraint(equalTo: topView.topAnchor, constant: 5),
            ProformanceProfile_lbl.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            ProformanceProfile_lbl.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.15),
            ProformanceProfile_lbl.widthAnchor.constraint(equalTo: topView.widthAnchor,multiplier: 0.9),
            
            Student_Profile_Name_lable.topAnchor.constraint(equalTo: ProformanceProfile_lbl.bottomAnchor, constant: 10),
            Student_Profile_Name_lable.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            Student_Profile_Name_lable.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.1),
           
            Class_Name_Lable.topAnchor.constraint(equalTo: Student_Profile_Name_lable.bottomAnchor,constant: 4),
            Class_Name_Lable.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            Class_Name_Lable.heightAnchor.constraint(equalTo: topView.heightAnchor,multiplier: 0.1),
           
            
            AttendaceReport_lbl.topAnchor.constraint(equalTo: AttendaceReportView.topAnchor, constant: 0),
            AttendaceReport_lbl.centerXAnchor.constraint(equalTo: AttendaceReportView.centerXAnchor),
            AttendaceReport_lbl.heightAnchor.constraint(equalTo: AttendaceReportView.heightAnchor, multiplier: 0.25),
            AttendaceReport_lbl.widthAnchor.constraint(equalTo: AttendaceReportView.widthAnchor,multiplier: 0.9),
            
            AttendaceReport1_lbl.centerXAnchor.constraint(equalTo: AttendanceReport_StackView.centerXAnchor),
            AttendaceReport1_lbl.centerYAnchor.constraint(equalTo: AttendanceReport_StackView.centerYAnchor,constant: -10),
            AttendaceReport2_lbl.centerXAnchor.constraint(equalTo: AttendanceReport_StackView.centerXAnchor),
            AttendaceReport2_lbl.topAnchor.constraint(equalTo: AttendaceReport1_lbl.bottomAnchor),

            AcadmicReport_lbl.topAnchor.constraint(equalTo: AcadmicReportview1.topAnchor, constant: 5),
            AcadmicReport_lbl.centerXAnchor.constraint(equalTo: AcadmicReportview1.centerXAnchor),
            AcadmicReport_lbl.heightAnchor.constraint(equalTo: AcadmicReportview1.heightAnchor, multiplier: 0.1),
            AcadmicReport_lbl.widthAnchor.constraint(equalTo: AcadmicReportview1.widthAnchor,multiplier: 0.9),
            
            TermI_lbl.topAnchor.constraint(equalTo: AcadmicReport_lbl.bottomAnchor),
            TermI_lbl.leadingAnchor.constraint(equalTo: AcadmicReportview1.leadingAnchor,constant: 20),
            TermI_lbl.heightAnchor.constraint(equalTo: AcadmicReportview1.heightAnchor, multiplier: 0.1),
            
            TermII_lbl.topAnchor.constraint(equalTo: AcadmicReportview2.topAnchor),
            TermII_lbl.leadingAnchor.constraint(equalTo: AcadmicReportview2.leadingAnchor,constant: 20),
            TermII_lbl.heightAnchor.constraint(equalTo: AcadmicReportview2.heightAnchor, multiplier: 0.1),
            
            FinalTerm_lbl.topAnchor.constraint(equalTo: AcadmicReportview3.topAnchor),
            FinalTerm_lbl.leadingAnchor.constraint(equalTo: AcadmicReportview2.leadingAnchor,constant: 20),
            FinalTerm_lbl.heightAnchor.constraint(equalTo: AcadmicReportview2.heightAnchor, multiplier: 0.1),
            
            RemarksBY_lbl.topAnchor.constraint(equalTo: RemarksView.topAnchor),
            RemarksBY_lbl.leadingAnchor.constraint(equalTo: RemarksView.leadingAnchor,constant: 20),
            RemarksBY_lbl.heightAnchor.constraint(equalTo: RemarksView.heightAnchor, multiplier: 0.15),
            
            RemarksWrite_lbl.centerXAnchor.constraint(equalTo: Remarks_StackView.centerXAnchor),
            RemarksWrite_lbl.centerYAnchor.constraint(equalTo: Remarks_StackView.centerYAnchor),
            RemarksWrite_lbl.widthAnchor.constraint(equalTo: Remarks_StackView.widthAnchor),
            RemarksWrite_lbl.heightAnchor.constraint(equalTo: Remarks_StackView.heightAnchor),
        
        ])
        
        
    }


}



extension StudentReport_VS: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == StudentInfoTable {
            // Return the number of rows for the first table
            return 4
        } else if tableView == quizMarksTable {
            // Return the number of rows for the second table
            return QuizMarksData.records.count
        }
        else if tableView == Term1Marks_Table {
            // Return the number of rows for the second table
            return MidTermMarksData.records.count
        }
        else if tableView == FinalMarks_Table {
            // Return the number of rows for the second table
            return FinalMarksData.records.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if tableView == StudentInfoTable {
            // Return the number of rows for the first table
            guard let cell = StudentInfoTable.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(text: Information_List[indexPath.row] , class2: Student_Name[indexPath.row])
            return cell
 
        }
        
        else if tableView == quizMarksTable {
            // Return the number of rows for the second table
            guard let cell = quizMarksTable.dequeueReusableCell(withIdentifier: QuizMarksTableCell.identifier, for: indexPath) as? QuizMarksTableCell else {
                return UITableViewCell()
            }
            cell.configure2(QuizNo: QuizMarksData.records[indexPath.row].QuizNo ?? "", Subject: QuizMarksData.records[indexPath.row].SubjectName ?? "", Omarks: QuizMarksData.records[indexPath.row].ObtainMarks ?? "", Tmarks: QuizMarksData.records[indexPath.row].TotalMarks ?? "")
            return cell
        }
        
        else if tableView == Term1Marks_Table {
            // Return the number of rows for the second table
            guard let cell = Term1Marks_Table.dequeueReusableCell(withIdentifier: Term1MarksTableCell.identifier, for: indexPath) as? Term1MarksTableCell else {
                return UITableViewCell()
            }
            cell.configure(Subject: MidTermMarksData.records[indexPath.row].SubjectName ?? "", Omarks: MidTermMarksData.records[indexPath.row].ObtainMarks ?? "", Tmarks: MidTermMarksData.records[indexPath.row].TotalMarks ?? "")
            return cell
        }
        
        else if tableView == FinalMarks_Table {
            // Return the number of rows for the second table
            guard let cell = FinalMarks_Table.dequeueReusableCell(withIdentifier: FinalMarksTableCell.identifier, for: indexPath) as? FinalMarksTableCell else {
                return UITableViewCell()
            }
            cell.configure(Subject: FinalMarksData.records[indexPath.row].SubjectName ?? "", Omarks: FinalMarksData.records[indexPath.row].ObtainMarks ?? "", Tmarks: FinalMarksData.records[indexPath.row].TotalMarks ?? "")
            return cell
        }
        
        return UITableViewCell()

        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == StudentInfoTable {
            // Return the number of rows for the first table
            return 50
        }
        
        else if tableView == quizMarksTable {
            // Return the number of rows for the second table
            return 30
        }
        else if tableView == Term1Marks_Table {
            // Return the number of rows for the second table
            return 30
        }
        else if tableView == FinalMarks_Table {
            // Return the number of rows for the second table
            return 30
        }
        return 0
        
    }
    
}

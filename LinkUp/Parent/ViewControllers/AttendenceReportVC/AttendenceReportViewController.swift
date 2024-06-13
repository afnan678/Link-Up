//
//  AttendenceReportViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 01/06/2023.
//

import Foundation
import UIKit


var days = "l"

class AttendenceReportViewController: UIViewController {
    
    
    let calendar = Calendar.current
    let currentDate = Date()
    var startDate: Date!
    var endDate: Date!
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 25
        let collectionViewHeightMultiplier: CGFloat = 0.3 // Specify the desired multiplier for the height
        let collectionViewHeight = view.bounds.height * collectionViewHeightMultiplier
        let collectionViewFrame = CGRect(x: 0, y: 0, width: view.bounds.width, height: collectionViewHeight)
        let collectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AttendenceDateCustomCell.self, forCellWithReuseIdentifier: AttendenceDateCustomCell.identifier)
        return collectionView
    }()
    
    

    //    views

    let topView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    let topdata_stckview : UIStackView = {

        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 0.0
        view.layer.masksToBounds = false
        view.layer.borderColor = UIColor(named: "darkPurple")?.cgColor
        view.layer.borderWidth = 2
        return view
    }()

    let student_image_stckview : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 22
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 0.0
        view.layer.masksToBounds = false
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        return view
    }()

    let Calender_stckview : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()

//    let Present_stckview : UIStackView = {
//
//        let view = UIStackView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemGreen
//        view.layer.cornerRadius = 10
//        return view
//    }()

//    let Absent_stckview : UIStackView = {
//
//        let view = UIStackView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemPink
//        view.layer.cornerRadius = 10
//        return view
//    }()
//
//    let Leave_stckview : UIStackView = {
//
//        let view = UIStackView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemBlue
//        view.layer.cornerRadius = 10
//        return view
//    }()


    //    image


    let student_image : UIImageView = {

        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 22
        img.backgroundColor = .black
        img.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        img.layer.masksToBounds = true
        img.image = ParentRecordModel.shared.studentImage
        return img
    }()


//    lables

    let Days_Lable : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "20 Days"
        lbl.textColor = UIColor(named: "darkPurple")
        lbl.font = UIFont.boldSystemFont(ofSize: 30.0)
        return lbl

    }()

    let Missed_Days_Lable : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "3 days missed"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 10.0)
        return lbl

    }()

    let Holidays_Lable : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "2 days holiday"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 10.0)
        return lbl

    }()

    let RedColor_box_Lable : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.backgroundColor = .red
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 10.0)
        return lbl

    }()

    let YellowColor_box_Lable : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.backgroundColor = .yellow
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 10.0)
        return lbl

    }()

    let StudentName_Lable : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ParentRecordModel.shared.studentName
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
        return lbl

    }()

    let ClassName_Lable : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
//        var studentClass = ParentRecordModel.shared.studentClass
        lbl.text = "Class \(ParentRecordModel.shared.studentClass)"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
        return lbl

    }()
    
    
    let MonthName_Lable : UILabel = {
        let lbl = UILabel()
        let dateFormatter = DateFormatter()
        // uncomment to enforce the US locale
        // dateFormatter.locale = Locale(identifier: "en-US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMM")
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = dateFormatter.string(from: Date())
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        return lbl

    }()
    
    let Monday_Lable : UILabel = {
        let lbl = UILabel()
        let dateFormatter = DateFormatter()
        // uncomment to enforce the US locale
        // dateFormatter.locale = Locale(identifier: "en-US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMM")
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = dateFormatter.string(from: Date())
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
        return lbl

    }()
    
    let Tuesday_Lable : UILabel = {
        let lbl = UILabel()
        let dateFormatter = DateFormatter()
        // uncomment to enforce the US locale
        // dateFormatter.locale = Locale(identifier: "en-US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMM")
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = dateFormatter.string(from: Date())
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
        return lbl

    }()
    let Wednesday_Lable : UILabel = {
        let lbl = UILabel()
        let dateFormatter = DateFormatter()
        // uncomment to enforce the US locale
        // dateFormatter.locale = Locale(identifier: "en-US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMM")
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = dateFormatter.string(from: Date())
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
        return lbl

    }()
    let Thusday_Lable : UILabel = {
        let lbl = UILabel()
        let dateFormatter = DateFormatter()
        // uncomment to enforce the US locale
        // dateFormatter.locale = Locale(identifier: "en-US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMM")
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.text = dateFormatter.string(from: Date())
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
        return lbl

    }()
    let Friday_Lable : UILabel = {
        let lbl = UILabel()
        let dateFormatter = DateFormatter()
        // uncomment to enforce the US locale
        // dateFormatter.locale = Locale(identifier: "en-US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMM")
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = dateFormatter.string(from: Date())
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
        return lbl

    }()
    let Saturday_Lable : UILabel = {
        let lbl = UILabel()
        let dateFormatter = DateFormatter()
        // uncomment to enforce the US locale
        // dateFormatter.locale = Locale(identifier: "en-US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMM")
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = dateFormatter.string(from: Date())
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
        return lbl

    }()
    let Sunday_Lable : UILabel = {
        let lbl = UILabel()
        let dateFormatter = DateFormatter()
        // uncomment to enforce the US locale
        // dateFormatter.locale = Locale(identifier: "en-US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMM")
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = dateFormatter.string(from: Date())
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
        return lbl

    }()
    
    let attendenceReportStackView : UIStackView = {

        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemGreen
        view.distribution = .fillEqually
        view.layer.cornerRadius = 10
        view.spacing = 20
        return view
    }()
    
    let Presentdays_Lable : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
//        let str = NSAttributedString(string: "Hello, World", attributes: [
//            NSAttributedString.Key.foregroundColor : UIColor.white,
//            NSAttributedString.Key.strokeColor : UIColor.black,
//            NSAttributedString.Key.strokeWidth : -2,
//            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 60.0)
//               ])
//        lbl.attributedText = str
        lbl.text = "22 Present"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor(named: "darkGreen")
        lbl.layer.cornerRadius = 20
        lbl.clipsToBounds = true
        lbl.font = UIFont.boldSystemFont(ofSize: 18.0)
        return lbl

    }()

    let Absentdays_Lable : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
//        let str = NSAttributedString(string: "Hello, World", attributes: [
//            NSAttributedString.Key.foregroundColor : UIColor.white,
//            NSAttributedString.Key.strokeColor : UIColor.black,
//            NSAttributedString.Key.strokeWidth : -2,
//            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 60.0)
//               ])
//        lbl.attributedText = str
        lbl.text = "7 Absent"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.backgroundColor = .red
        lbl.layer.cornerRadius = 20
        lbl.clipsToBounds = true
        lbl.font = UIFont.boldSystemFont(ofSize: 18.0)
        return lbl

    }()

    let Leavedays_Lable : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
//        let str = NSAttributedString(string: "Hello, World", attributes: [
//            NSAttributedString.Key.foregroundColor : UIColor.white,
//            NSAttributedString.Key.strokeColor : UIColor.black,
//            NSAttributedString.Key.strokeWidth : -2,
//            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 60.0)
//               ])
//        lbl.attributedText = str
        lbl.text = "1 Leave"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.backgroundColor = .blue
        lbl.layer.cornerRadius = 20
        lbl.clipsToBounds = true
        lbl.font = UIFont.boldSystemFont(ofSize: 18.0)
        return lbl

    }()
    
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        title_bar()
        calenderconfigration()
        ConfigureUI()
        // Do any additional setup after loading the view.
        
    }

    //    title bar configration
    func title_bar ()
    {
        title = "Attendce Report"
        view.backgroundColor = .white
        UINavigationBar.appearance().backgroundColor = UIColor(named: "darkPurple")
        UINavigationBar.appearance().barTintColor = .white  // solid color
        UIBarButtonItem.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        UITabBar.appearance().barTintColor = .white
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "←", style: .plain, target: self, action: #selector(Cancel_Page_1))

    }
//    @objc func Cancel_Page_1(){
//        dismiss(animated: true, completion: nil)
//    }
    
    
    
//    this is the calender configration
    func calenderconfigration () {
        let currentDateComponents = calendar.dateComponents([.year, .month], from: currentDate)
        startDate = calendar.date(from: currentDateComponents)
        let endDateComponents = DateComponents(month: 1, day: -1)
        endDate = calendar.date(byAdding: endDateComponents, to: startDate)
        let dateFormatter = DateFormatter()
        // uncomment to enforce the US locale
        // dateFormatter.locale = Locale(identifier: "en-US")
        dateFormatter.setLocalizedDateFormatFromTemplate("EEE")
        var date = calendar.date(byAdding: .day, value: 0, to: startDate)!
        Monday_Lable.text = dateFormatter.string(from: date)
        date = calendar.date(byAdding: .day, value: 1, to: startDate)!
        Tuesday_Lable.text = dateFormatter.string(from: date)
        date = calendar.date(byAdding: .day, value: 2, to: startDate)!
        Wednesday_Lable.text = dateFormatter.string(from: date)
        date = calendar.date(byAdding: .day, value: 3, to: startDate)!
        Thusday_Lable.text = dateFormatter.string(from: date)
        date = calendar.date(byAdding: .day, value: 4, to: startDate)!
        Friday_Lable.text = dateFormatter.string(from: date)
        date = calendar.date(byAdding: .day, value: 5, to: startDate)!
        Saturday_Lable.text = dateFormatter.string(from: date)
        date = calendar.date(byAdding: .day, value: 6, to: startDate)!
        Sunday_Lable.text = dateFormatter.string(from: date)
    }
    
    
    
    

    //    all view configration
    func ConfigureUI(){

        view.addSubview(topView)
        topView.addSubview(topdata_stckview)
        topView.addSubview(student_image_stckview)
        student_image_stckview.addSubview(student_image)
        
        topView.addSubview(MonthName_Lable)
        topView.addSubview(Monday_Lable)
        topView.addSubview(Tuesday_Lable)
        topView.addSubview(Wednesday_Lable)
        topView.addSubview(Thusday_Lable)
        topView.addSubview(Friday_Lable)
        topView.addSubview(Saturday_Lable)
        topView.addSubview(Sunday_Lable)
        topView.addSubview(Calender_stckview)
        topView.addSubview(attendenceReportStackView)

//        topView.addSubview(Present_stckview)
//        topView.addSubview(Absent_stckview)
//        topView.addSubview(Leave_stckview)
        
        topdata_stckview.addSubview(Days_Lable)
        topdata_stckview.addSubview(Missed_Days_Lable)
        topdata_stckview.addSubview(Holidays_Lable)
        topdata_stckview.addSubview(RedColor_box_Lable)
        topdata_stckview.addSubview(YellowColor_box_Lable)
        topdata_stckview.addSubview(StudentName_Lable)
        topdata_stckview.addSubview(ClassName_Lable)
        Calender_stckview.addSubview(collectionView)

//
        attendenceReportStackView.addArrangedSubview(Presentdays_Lable)
        attendenceReportStackView.addArrangedSubview(Absentdays_Lable)
        attendenceReportStackView.addArrangedSubview(Leavedays_Lable)
        
//        Present_stckview.addSubview(Presentdays_Lable)
//        Absent_stckview.addSubview(Absentdays_Lable)
//        Leave_stckview.addSubview(Leavedays_Lable)


        NSLayoutConstraint.activate([

//            views
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor),

            topdata_stckview.topAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.topAnchor,constant: 50),
            topdata_stckview.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            topdata_stckview.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            topdata_stckview.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            
            //            image
            student_image.topAnchor.constraint(equalTo: student_image_stckview.topAnchor),
            student_image.trailingAnchor.constraint(equalTo: student_image_stckview.trailingAnchor),
            student_image.leadingAnchor.constraint(equalTo: student_image_stckview.leadingAnchor),
            student_image.bottomAnchor.constraint(equalTo: student_image_stckview.bottomAnchor),


             //       labal
            Days_Lable.topAnchor.constraint(equalTo: topdata_stckview.safeAreaLayoutGuide.topAnchor),
            Days_Lable.centerXAnchor.constraint(equalTo: topdata_stckview.centerXAnchor),
            Days_Lable.heightAnchor.constraint(equalTo: topdata_stckview.heightAnchor, multiplier: 0.55),

            RedColor_box_Lable.leadingAnchor.constraint(equalTo: topdata_stckview.leadingAnchor,constant: 30),
            RedColor_box_Lable.centerYAnchor.constraint(equalTo: Missed_Days_Lable.centerYAnchor),
            
            
            RedColor_box_Lable.widthAnchor.constraint(equalTo: topdata_stckview.widthAnchor, multiplier: 0.08),
            RedColor_box_Lable.heightAnchor.constraint(equalTo: topdata_stckview.heightAnchor, multiplier: 0.12),

            YellowColor_box_Lable.centerYAnchor.constraint(equalTo: Holidays_Lable.centerYAnchor),
            YellowColor_box_Lable.leadingAnchor.constraint(equalTo: topdata_stckview.leadingAnchor,constant: 30),
            YellowColor_box_Lable.widthAnchor.constraint(equalTo: topdata_stckview.widthAnchor, multiplier: 0.08),
            YellowColor_box_Lable.heightAnchor.constraint(equalTo: topdata_stckview.heightAnchor, multiplier: 0.12),



            Missed_Days_Lable.topAnchor.constraint(equalTo: Days_Lable.bottomAnchor),
            Missed_Days_Lable.leadingAnchor.constraint(equalTo: RedColor_box_Lable.trailingAnchor,constant: 7),
            Missed_Days_Lable.heightAnchor.constraint(equalTo: topdata_stckview.heightAnchor, multiplier: 0.1),

            Holidays_Lable.topAnchor.constraint(equalTo: Missed_Days_Lable.bottomAnchor , constant: 10),
            Holidays_Lable.leadingAnchor.constraint(equalTo: YellowColor_box_Lable.trailingAnchor,constant: 7),
            Holidays_Lable.heightAnchor.constraint(equalTo: topdata_stckview.heightAnchor, multiplier: 0.1),

            StudentName_Lable.topAnchor.constraint(equalTo: student_image_stckview.bottomAnchor,constant: 7),
            StudentName_Lable.centerXAnchor.constraint(equalTo: student_image_stckview.centerXAnchor),

            ClassName_Lable.topAnchor.constraint(equalTo: StudentName_Lable.bottomAnchor,constant: 3),
            ClassName_Lable.centerXAnchor.constraint(equalTo: student_image_stckview.centerXAnchor),

            
            student_image_stckview.topAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.topAnchor, constant: 50),
            student_image_stckview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            student_image_stckview.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.25),
            student_image_stckview.heightAnchor.constraint(equalTo: topView.heightAnchor,multiplier: 0.13),
            
            MonthName_Lable.topAnchor.constraint(equalTo: ClassName_Lable.bottomAnchor),
            MonthName_Lable.leadingAnchor.constraint(equalTo: topView.leadingAnchor,constant: 10),
            
            Monday_Lable.topAnchor.constraint(equalTo: MonthName_Lable.bottomAnchor),
            Monday_Lable.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            Monday_Lable.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.143),
            
            Tuesday_Lable.topAnchor.constraint(equalTo: MonthName_Lable.bottomAnchor),
            Tuesday_Lable.leadingAnchor.constraint(equalTo: Monday_Lable.trailingAnchor,constant: 0),
            Tuesday_Lable.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.143),

            
            Wednesday_Lable.topAnchor.constraint(equalTo: MonthName_Lable.bottomAnchor),
            Wednesday_Lable.leadingAnchor.constraint(equalTo: Tuesday_Lable.trailingAnchor),
            Wednesday_Lable.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.143),

            
            Thusday_Lable.topAnchor.constraint(equalTo: MonthName_Lable.bottomAnchor),
            Thusday_Lable.leadingAnchor.constraint(equalTo: Wednesday_Lable.trailingAnchor),
            Thusday_Lable.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.143),

            
            Friday_Lable.topAnchor.constraint(equalTo: MonthName_Lable.bottomAnchor),
            Friday_Lable.leadingAnchor.constraint(equalTo: Thusday_Lable.trailingAnchor),
            Friday_Lable.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.143),

            
            Saturday_Lable.topAnchor.constraint(equalTo: MonthName_Lable.bottomAnchor),
            Saturday_Lable.leadingAnchor.constraint(equalTo: Friday_Lable.trailingAnchor),
            Saturday_Lable.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.143),

            
            Sunday_Lable.topAnchor.constraint(equalTo: MonthName_Lable.bottomAnchor),
            Sunday_Lable.leadingAnchor.constraint(equalTo: Saturday_Lable.trailingAnchor),
            Sunday_Lable.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.143),
            
            
            Calender_stckview.topAnchor.constraint(equalTo: MonthName_Lable.bottomAnchor,constant: 25),
            Calender_stckview.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            Calender_stckview.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            Calender_stckview.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.3),
            
            
            
            attendenceReportStackView.topAnchor.constraint(equalTo: Calender_stckview.bottomAnchor , constant: 2),
            attendenceReportStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 20),
            attendenceReportStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -20),
            attendenceReportStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            

//            Present_stckview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -90),
//            Present_stckview.trailingAnchor.constraint(equalTo: Absent_stckview.leadingAnchor,constant: -10),
//            Present_stckview.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.3),
//            Present_stckview.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.07),
//
//            Absent_stckview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -90),
//            Absent_stckview.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
//            Absent_stckview.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.3),
//            Absent_stckview.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.07),
//
//            Leave_stckview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -90),
//            Leave_stckview.leadingAnchor.constraint(equalTo: Absent_stckview.trailingAnchor,constant: 10),
//            Leave_stckview.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.3),
//            Leave_stckview.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.07),


//            Presentdays_Lable.centerXAnchor.constraint(equalTo: Present_stckview.centerXAnchor),
//            Presentdays_Lable.centerYAnchor.constraint(equalTo: Present_stckview.centerYAnchor),
//
//            Absentdays_Lable.centerXAnchor.constraint(equalTo: Absent_stckview.centerXAnchor),
//            Absentdays_Lable.centerYAnchor.constraint(equalTo: Absent_stckview.centerYAnchor),
//
//            Leavedays_Lable.centerXAnchor.constraint(equalTo: Leave_stckview.centerXAnchor),
//            Leavedays_Lable.centerYAnchor.constraint(equalTo: Leave_stckview.centerYAnchor),
            
            

        ])
    }


}

extension AttendenceReportViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let dateRange = calendar.dateComponents([.day], from: startDate, to: endDate)
        return dateRange.day! + 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AttendenceDateCustomCell.identifier, for: indexPath) as! AttendenceDateCustomCell

        // Calculate the date for the current indexPath
        let date = calendar.date(byAdding: .day, value: indexPath.item, to: startDate)!
        cell.dateLabel.textColor = .green //this code use for color text for present
        // Customize the cell with the date information
        let dateFormatter = DateFormatter()
        
        
//        this code for sunday holidays color the text yellow
        dateFormatter.dateFormat = "EEE"
        if(dateFormatter.string(from: date) == "Sun")
        {
            cell.dateLabel.textColor = .yellow
        }
        
//        this color the text for any missing day
        dateFormatter.dateFormat = "d"
        if(dateFormatter.string(from: date) == "16")
        {
            cell.dateLabel.textColor = .red
        }
//        this code coler the txt for leave
        if(dateFormatter.string(from: date) == "19")
        {
            cell.dateLabel.textColor = .systemBlue
        }
        

        cell.dateLabel.text = dateFormatter.string(from: date)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 7
        let height = collectionView.frame.height / 15
        // Assuming there are always 6 rows
        return CGSize(width: width, height: height)
    }
}
//
//class DateCell: UICollectionViewCell {
//    let dateLabel: UILabel
//
//    override init(frame: CGRect) {
//
//        let str = NSAttributedString(string: "Hello, World", attributes: [
//            NSAttributedString.Key.foregroundColor : UIColor.white,
//            NSAttributedString.Key.strokeColor : UIColor.black,
//            NSAttributedString.Key.strokeWidth : -2,
//            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 60.0)
//               ])
//
//        dateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
//        dateLabel.textAlignment = .center
//        dateLabel.attributedText = str
//        dateLabel.font = UIFont.systemFont(ofSize: 16)
//
//        super.init(frame: frame)
//
//        contentView.addSubview(dateLabel)
//
//
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}

////
////  SchoolAnnouncementViewController.swift
////  LinkUp
////
////  Created by Hamza Malik on 17/04/2023.
////
//
//import Foundation
//import UIKit
//
//class SchoolAnnouncementViewController : UIViewController{
//    
//    var announcementTable : UITableView = {
//        var tble = UITableView()
//        tble.register(CustomStudentCell.self, forCellReuseIdentifier: CustomStudentCell.identifier)
//        tble.translatesAutoresizingMaskIntoConstraints = false
//        tble.backgroundColor = .white
//        return tble
//    }()
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        self.title = "Announcement List"
//        announcementTable.delegate = self
//        announcementTable.dataSource = self
//        configureUI()
//    }
//    
//    func configureUI(){
////        stdTable.frame = self.view.frame
//        view.addSubview(announcementTable)
//        
//        NSLayoutConstraint.activate([
//            announcementTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            announcementTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            announcementTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            announcementTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//        ])
//    }
//}
//extension SchoolAnnouncementViewController : UITableViewDelegate , UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        AnnouncementData.announcementList.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = announcementTable.dequeueReusableCell(withIdentifier: CustomStudentCell.identifier, for: indexPath) as! CustomStudentCell
//        let model = AnnouncementData.announcementList[indexPath.row]
//        cell.setAnnouncementData(data: model)
//        return cell
//    }
//}

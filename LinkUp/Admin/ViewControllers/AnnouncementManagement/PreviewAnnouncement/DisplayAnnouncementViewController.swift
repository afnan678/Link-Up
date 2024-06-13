//
//  DisplayAnnouncementViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 14/04/2023.
//

import Foundation
import UIKit

class DisplayAnnouncementViewController : UIViewController {
    
    var announcementTable : UITableView = {
        var tble = UITableView()
        tble.register(AnnouncementCustomCell.self, forCellReuseIdentifier: AnnouncementCustomCell.identifier)
        tble.translatesAutoresizingMaskIntoConstraints = false
        tble.backgroundColor = .white
        return tble
    }()
    private var activityIndicator: UIActivityIndicatorView = {
       var indicator = UIActivityIndicatorView()
        indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .gray
        return indicator
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Announcement List"
        announcementTable.delegate = self
        announcementTable.dataSource = self
        activityIndicator.startAnimating()
        self.configureUI()
        FirestoreManager.shared.reteriveAllAnnouncement(role: "admin") { success in
            if success {
                self.activityIndicator.stopAnimating()
                self.announcementTable.reloadData()
            }
            
            self.activityIndicator.stopAnimating()
        }
    }
    
    func configureUI(){
//        stdTable.frame = self.view.frame
        view.addSubview(announcementTable)
        view.addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            announcementTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            announcementTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            announcementTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            announcementTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
extension DisplayAnnouncementViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AnnouncementData.announcementList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = announcementTable.dequeueReusableCell(withIdentifier: AnnouncementCustomCell.identifier, for: indexPath) as! AnnouncementCustomCell
        let model = AnnouncementData.announcementList[indexPath.row]
        cell.setAnnouncementData(data: model)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
}

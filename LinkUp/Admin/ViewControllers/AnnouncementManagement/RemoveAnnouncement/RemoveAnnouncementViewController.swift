//
//  RemoveAnnouncementViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 27/05/2023.
//

import Foundation
import UIKit

class RemoveAnnouncementViewController : UIViewController {
    
    var announcementTable : UITableView = {
        var tble = UITableView()
        tble.register(CustomCellForRemoveAnnouncement.self, forCellReuseIdentifier: CustomCellForRemoveAnnouncement.identifier)
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
extension RemoveAnnouncementViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AnnouncementData.announcementList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = announcementTable.dequeueReusableCell(withIdentifier: CustomCellForRemoveAnnouncement.identifier, for: indexPath) as! CustomCellForRemoveAnnouncement
        cell.removeAnnouncementButton.tag = indexPath.row
        cell.removeAnnouncementButton.addTarget(self, action: #selector(removeAnnouncementButtonPressed(_: )), for: .touchUpInside)
        let model = AnnouncementData.announcementList[indexPath.row]
        cell.setAnnouncementData(data: model)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    @objc func removeAnnouncementButtonPressed( _ sender : UIButton ){
//        guard let cell = sender.superview?.superview as? RemoveStudentViewController,
        let rowIndex = sender.tag

        let indexPath = IndexPath.init(row: rowIndex, section: 0)
        print(indexPath.row)
        var alert = UIAlertController(title: "Remove Announcement", message: "Are you sure", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default , handler: { _ in
            print(AnnouncementData.announcementList[indexPath.row])
            FirestoreManager.shared.removeAnnouncement(announcementId: AnnouncementData.announcementList[indexPath.row].announcementId) { success in
                if success {
                    AnnouncementData.announcementList.remove(at: indexPath.row)
                    self.announcementTable.reloadData()
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert , animated: true)
        
    }
    
}

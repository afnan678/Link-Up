//
//  UpdateTeacherViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 20/05/2023.
//

import Foundation
import Firebase
import FirebaseStorage
import SDWebImage
import UIKit

class TeacherListViewController : UIViewController {
        
    private let teachersRecordLabel : UILabel = {
        let label = UILabel()
        label.text = "Teachers Record"
        label.font = .boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var teachersListTable : UITableView = {
       let table = UITableView()
        table.backgroundColor = .white
        table.register(TeacherListCustomCell.self, forCellReuseIdentifier: TeacherListCustomCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var activityIndicator : UIActivityIndicatorView = {
        var indicator = UIActivityIndicatorView()
        indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    var imageArray = [UIImage]()

    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        title = "Teacher Management"
        
//        loadRecord()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        loadRecord()
//        SDImageCache.shared.clearMemory()
//        SDImageCache.shared.clearDisk()
        teachersListTable.reloadData()
    }
    func loadRecord(){
//        TeacherDataModel.records.removeAll()
//        TeacherDataModel.teacherImageArray.removeAll()
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive  = true
//        loadTeacherReocrd { done in
//            if done {
//                self.downloadImagesInSequence { success in
//                    if success {
//                        self.configureUI()
//                        self.activityIndicator.stopAnimating()
//                    }
//                }
//            }
//        }
        if FirestoreManager.shared.isTeacherRecordLoaded {
            print(TeacherDataModelForAdmin.teacherImageArray.count)
            self.configureUI()
        }else{
            activityIndicator.startAnimating()
            FirestoreManager.shared.loadAllTeacheraReocrd { success in
                if success {
                    print(TeacherDataModelForAdmin.teacherImageArray.count)
                    self.configureUI()
                    self.activityIndicator.stopAnimating()
                }else{
                    print("Error loading files")
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
//    func downloadImagesInSequence( completion: @escaping (Bool) -> Void) {
//        var currentIndex = 0
//
//        func downloadImageAtIndex(index: Int) {
//            if index >= TeacherDataModel.records.count {
//                // All images downloaded
//                completion(true)
//                return
//            }
//
//            let urlString = TeacherDataModel.records[index].imageUrl
//
//            if let url = URL(string: urlString) {
//                SDWebImageDownloader.shared.downloadImage(with: url) { image, _, error, _ in
//                    if let error = error {
//                        print("Error downloading image: \(error)")
//                    } else if let image = image {
//                        // Handle the downloaded image
//                        // For example, you can add it to an image array
//                        TeacherDataModel.teacherImageArray.append(image)
//                    }
//
//                    currentIndex += 1
//                    downloadImageAtIndex(index: currentIndex) // Recursively download the next image
//                }
//            } else {
//                currentIndex += 1
//                downloadImageAtIndex(index: currentIndex) // Recursively download the next image
//            }
//        }
//
//        downloadImageAtIndex(index: currentIndex)
//    }
    func configureUI(){
        teachersListTable.delegate = self
        teachersListTable.dataSource = self
        view.addSubview(teachersRecordLabel)
        view.addSubview(teachersListTable)
        NSLayoutConstraint.activate([
            
            teachersRecordLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 15),
            teachersRecordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            teachersListTable.topAnchor.constraint(equalTo: teachersRecordLabel.bottomAnchor , constant: 15),
            teachersListTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            teachersListTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            teachersListTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
        ])
    }
//    func loadTeacherReocrd(completion : @escaping (Bool)-> Void){
//        let collectionRef = Firestore.firestore().collection("Teacher").order(by: "teacherID")
//        collectionRef.getDocuments { querySnapshot, error in
//            if error != nil {
//                return
//            }else{
//                for document in querySnapshot!.documents {
//                    let data = document.data()
//                    var teacherData = TeacherDataModel()
//                    teacherData.email = data["Email"] as? String ?? ""
//                    teacherData.cNIC = data["CNIC"] as? String ?? ""
//                    teacherData.imageUrl = data["ImageUrl"] as? String ?? ""
//                    teacherData.name = data["Name"] as? String ?? ""
//                    teacherData.phNo = data["Phone No"] as? String ?? ""
//                    teacherData.teacherId = data["teacherID"] as? Int ?? 0
//                    teacherData.qualification = data["Qualification"] as? String ?? ""
//                    TeacherDataModel.records.append(teacherData)
//                }
//                print(TeacherDataModel.records)
//                completion(true)
//            }
//        }
//    }

}
extension TeacherListViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TeacherDataModelForAdmin.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeacherListCustomCell.identifier , for: indexPath) as! TeacherListCustomCell
        let image = TeacherDataModelForAdmin.teacherImageArray[indexPath.row]
        let data = TeacherDataModelForAdmin.records[indexPath.row]

        cell.setTeacherDetails(teacherImage: image, teacherData: data)
        cell.updateTeacherButton.tag = indexPath.row
        cell.updateTeacherButton.addTarget(self, action: #selector(UpdateTeacherButtonPressed(_ : )), for: .touchUpInside)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    @objc func UpdateTeacherButtonPressed( _ sender : UIButton ){
//        guard let cell = sender.superview?.superview as? RemoveStudentViewController,
        let rowIndex = sender.tag

        let indexPath = IndexPath.init(row: rowIndex, section: 0)
        print(indexPath.row)
                let vc = UpdateTeacherViewController()
                vc.modalPresentationStyle = .fullScreen
        vc.setTeacherFieldsData(data: TeacherDataModelForAdmin.records[indexPath.row], image: TeacherDataModelForAdmin.teacherImageArray[indexPath.row] , rowIndex: indexPath.row)
                navigationController?.pushViewController(vc, animated: true)
        
    }
}

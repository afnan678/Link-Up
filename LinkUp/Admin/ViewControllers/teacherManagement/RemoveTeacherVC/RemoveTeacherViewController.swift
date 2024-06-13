////
////  RemoveTeacherViewController.swift
////  LinkUp
////
////  Created by Hamza Malik on 20/05/2023.
////
//

import Foundation
import Firebase
import FirebaseStorage
import SDWebImage
import UIKit

class RemoveTeacherViewController : UIViewController {
        
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
        table.register(RemoveTeacherCustomCell.self, forCellReuseIdentifier: RemoveTeacherCustomCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var activityIndicator : UIActivityIndicatorView = {
        var indicator = UIActivityIndicatorView()
        indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
//    var imageArray = [UIImage]()

    override func viewDidLoad() {
        
        view.backgroundColor = .systemBackground
        title = "Teacher Management"
        
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive  = true
        
        if FirestoreManager.shared.isTeacherRecordLoaded {
            print(TeacherDataModelForAdmin.teacherImageArray.count)
            self.configureUI()
        }else{
            activityIndicator.startAnimating()
            FirestoreManager.shared.loadAllTeacheraReocrd { success in
                if success {
                    self.configureUI()
                    self.activityIndicator.stopAnimating()
                }else{
                    print("Error loading files")
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
//        loadRecord()
        
    }
    func loadRecord(){
//        TeacherDataModel.records.removeAll()
//        imageArray.removeAll()
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive  = true
//        activityIndicator.startAnimating()
        
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
//        loadTeacherReocrd { success in
//            if success {
//                let group = DispatchGroup()  // Create a dispatch group to track the completion of all image downloads
//
//                for item in TeacherDataModel.records {
//                    group.enter()  // Enter the dispatch group before each image download
//
//                    if let imageURL = URL(string: item.imageUrl) {
//                        // Download the image asynchronously
//                        SDWebImageDownloader.shared.downloadImage(with: imageURL) { (image, _, _, _) in
//                            if let image = image {
//                                self.imageArray.append(image)  // Store the downloaded image in the array
//                            }
//
//                            group.leave()  // Leave the dispatch group once the image download is complete
//                        }
//                    }
//                }
//                group.notify(queue: .main) {
//                    // All image downloads are complete
//                    print("All images downloaded")
//                    // You can perform any further processing with the downloaded imageArray here
//                    print(self.imageArray.count)
//                    self.configureUI()
//                    self.activityIndicator.stopAnimating()
//
//                }
//            }
//        }
    }
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
//
//                }
//                print(TeacherDataModel.records)
//                completion(true)
//            }
//        }
//    }
//    func downloadImagesInSequence( completion: @escaping (Bool) -> Void) {
////        guard !urls.isEmpty else {
////            // No URLs to download
////            completion(true)
////            return
////        }
//
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

}
extension RemoveTeacherViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TeacherDataModelForAdmin.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RemoveTeacherCustomCell.identifier , for: indexPath) as! RemoveTeacherCustomCell
        let image = TeacherDataModelForAdmin.teacherImageArray[indexPath.row]
        let data = TeacherDataModelForAdmin.records[indexPath.row]
        cell.setTeacherDetails(teacherImage: image, teacherData: data)
        cell.removeTeacherButton.tag = indexPath.row
        cell.removeTeacherButton.addTarget(self, action: #selector(removeTeacherButtonPressed(_ : )), for: .touchUpInside)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    @objc func removeTeacherButtonPressed( _ sender : UIButton ){
//        guard let cell = sender.superview?.superview as? RemoveStudentViewController,
        let rowIndex = sender.tag

        let indexPath = IndexPath.init(row: rowIndex, section: 0)
        print(indexPath.row)
        var alert = UIAlertController(title: "Remove Teacher", message: "Are you sure", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default , handler: { _ in
            print(TeacherDataModelForAdmin.records[indexPath.row].teacherId)
            FirestoreManager.shared.removeTeacher(teacherId: TeacherDataModelForAdmin.records[indexPath.row].teacherId) { success in
                if success {
                    TeacherDataModelForAdmin.records.remove(at: indexPath.row)
                    TeacherDataModelForAdmin.teacherImageArray.remove(at: indexPath.row)
                    self.teachersListTable.reloadData()
                }
            }

            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert , animated: true)
        
    }

//    // This method will be called when a cell is tapped
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    // Get the tapped cell
//            if let tappedCell = tableView.cellForRow(at: indexPath) {
//        // You can access and use the tapped cell here
//        // For example, you can change the cell's background color
//
//            tappedCell.backgroundColor = UIColor.red
////                print(indexPath.row)
//                    let vc = TeacherRecordDetailViewController()
//                    vc.modalPresentationStyle = .fullScreen
//                    vc.setteacherDetail(data: TeacherDataModel.records[indexPath.row], image: imageArray[indexPath.row])
//                    navigationController?.pushViewController(vc, animated: true)
//        }
//    }
}

//
//  PreviewTeacherListViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 18/05/2023.
//

import Foundation
import Firebase
import FirebaseStorage
import SDWebImage
import UIKit

class PreviewTeacherListViewController : UIViewController {
        
    private let teachersRecordLabel : UILabel = {
        let label = UILabel()
        label.text = "Teachers Record"
        label.font = .boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let teachersListTable : UITableView = {
       let table = UITableView()
        table.backgroundColor = .white
        table.register(CustomTeacherRecordCell.self, forCellReuseIdentifier: CustomTeacherRecordCell.identifier)
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
        
//        TeacherDataModel.records.removeAll()
//        imageArray.removeAll()
        view.backgroundColor = .systemBackground
        title = "Teacher Management"
        
        loadRecord()
        
    }
    func loadRecord(){
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive  = true
        if FirestoreManager.shared.isTeacherRecordLoaded {
            self.activityIndicator.stopAnimating()
            self.configureUI()
        }else{
            activityIndicator.startAnimating()
            FirestoreManager.shared.loadAllTeacheraReocrd { success in
                if success {
                    self.activityIndicator.stopAnimating()
                    self.configureUI()
                    print(TeacherDataModelForAdmin.teacherImageArray.count)
                }else{
                    print("Error loading files")
                    self.activityIndicator.stopAnimating()
                }
            }
        }
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
//                        print(TeacherDataModel.teacherImageArray.count)
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
extension PreviewTeacherListViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TeacherDataModelForAdmin.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTeacherRecordCell.identifier , for: indexPath) as! CustomTeacherRecordCell
        print(indexPath.row)
        let image = TeacherDataModelForAdmin.teacherImageArray[indexPath.row]
        
        let data = TeacherDataModelForAdmin.records[indexPath.row]
        cell.setTeacherDetails(teacherImage: image, teacherData: data )
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    // This method will be called when a cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    // Get the tapped cell
            if let tappedCell = tableView.cellForRow(at: indexPath) {
        // You can access and use the tapped cell here
        // For example, you can change the cell's background color
                
            tappedCell.backgroundColor = UIColor.red
//                print(indexPath.row)
                    let vc = TeacherRecordDetailViewController()
                    vc.modalPresentationStyle = .fullScreen
                vc.setTeacherDetail(data: TeacherDataModelForAdmin.records[indexPath.row], image: TeacherDataModelForAdmin.teacherImageArray[indexPath.row])
                    navigationController?.pushViewController(vc, animated: true)
        }
    }
}

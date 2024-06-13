//
//  FirestoreManager.swift
//  LinkUp
//
//  Created by Mac on 16/02/2023.
//

import Foundation
import SDWebImage
import Firebase
import FirebaseStorage

final class FirestoreManager {
    static let shared = FirestoreManager()
    
    //Function to create a Admin User
    //    func createAdminUser(name: String , email: String ){
    //        Auth.auth().createUser(withEmail: name, password: "123456") { authResult, error in
    //            guard let user = authResult?.user, error == nil else {
    //                print("Error creating teacher user: \(error!.localizedDescription)")
    //                return
    //            }
    //
    //            // If user creation is successful, save teacher data in Firestore
    //            let db = Firestore.firestore()
    //            let adminRef = db.collection("Admin").document(user.uid)
    //            adminRef.setData([
    //                "role": "Admin",
    //                "Name": name,
    //                "Email": email,
    //                // Add more data fields as needed
    //            ]) { err in
    //                if let err = err {
    //                    print("Error saving teacher data: \(err.localizedDescription)")
    //                } else {
    //                    print("Teacher data saved successfully")
    //                }
    //            }
    //        }
    //    }
    
    func loadAdminRecord(){
        self.db.collection("Admin").getDocuments { snapshot, error in
            if let error = error {
                print("Error loading Admin Record \(error.localizedDescription)")
            }else{
                if let document = snapshot?.documents.first {
                    let data = document.data()
                    let name = data["Name"] as? String ?? ""
                    let email = data["Email"] as? String ?? ""
                    AdminData.shared.email = email
                    AdminData.shared.name = name
                }
            }
        }
    }
    
    let db = Firestore.firestore()
    private let storage = Storage.storage().reference()
    
    
    // Define a function to create a new teacher user
    
    func createTeacherUser( teacherImage : UIImage  , teacherImageData image : Data , name teacherName: String, qualification teacherQualification: String , email teacherEmail: String, cnic teacherCNIC: String, phNo teacherPhoneNo: String , completion: @escaping (Bool) -> Void) {
        
        Auth.auth().createUser(withEmail: teacherEmail, password: "123456") { authResult, error in
            guard let user = authResult?.user, error == nil else {
                print("Error creating teacher user: \(error!.localizedDescription)")
                completion(false)
                return
            }
            // If user creation is successful, save teacher data in Firestore
            let teacherRef = self.db.collection("Teacher")
            teacherRef.order(by: "teacherID", descending: true).limit(to: 1).getDocuments { (snapshot, error) in
                if let error = error {
                    print("Error getting last ID: \(error.localizedDescription)")
                } else if let document = snapshot?.documents.first {
                    
                    let lastId = document.data()["teacherID"] as? Int ?? 0
                    let newId = lastId + 1
                    let path = "teachers/\(newId).png"
                    print(path)
                    self.uploadPhoto(path: path, imageData: image) { imageUrl in
                        guard let urlString = imageUrl , !urlString.isEmpty else{
                            completion(false)
                            return
                        }
                        teacherRef.addDocument(data: [
                            "teacherID" : newId,
                            "ImageUrl" : urlString,
                            "Name": teacherName,
                            "Qualification": teacherQualification,
                            "Email": teacherEmail,
                            "CNIC": teacherCNIC,
                            "AssignedClass" : "Not Assigned",
                            "Phone No": teacherPhoneNo,
                        ]) { err in
                            if let err = err {
                                print("Error saving Student data: \(err.localizedDescription)")
                                completion(false)
                            } else {
                                print("Teacher data saved successfully")
                                var newRecord = TeacherDataModelForAdmin()
                                newRecord.name = teacherName
                                newRecord.qualification = teacherQualification
                                newRecord.email = teacherEmail
                                newRecord.cNIC = teacherCNIC
                                newRecord.phNo = teacherPhoneNo
                                newRecord.teacherId = newId
                                newRecord.assignedClass = "Not Assigned"
                                TeacherDataModelForAdmin.records.append(newRecord)
                                TeacherDataModelForAdmin.teacherImageArray.append(teacherImage)
                                completion(true)
                            }
                        }
                    }
                }else {
                    print("         Else Part        ")
                    // No documents in "Teacher" collection, so create a new document with studentID 1
                    let path = "teachers/1.png"
                    self.uploadPhoto(path: path, imageData: image) { imageUrl in
                        guard let urlString = imageUrl , !urlString.isEmpty else{
                            completion(false)
                            return
                        }
                        self.db.collection("Teacher").addDocument(data: [
                            "teacherID" : 1,
                            "ImageUrl" : urlString,
                            "Name": teacherName,
                            "Qualification": teacherQualification,
                            "Email": teacherEmail,
                            "CNIC": teacherCNIC,
                            "AssignedClass" : "Not Assigned",
                            "Phone No": teacherPhoneNo,
                        ]) { err in
                            if let err = err {
                                print("Error saving Teacher data: \(err.localizedDescription)")
                                completion(false)
                            } else {
                                print("Teacher data saved successfully")
                                var newRecord = TeacherDataModelForAdmin()
                                newRecord.name = teacherName
                                newRecord.qualification = teacherQualification
                                newRecord.email = teacherEmail
                                newRecord.cNIC = teacherCNIC
                                newRecord.phNo = teacherPhoneNo
                                newRecord.teacherId = 1
                                newRecord.assignedClass = "Not Assigned"
                                TeacherDataModelForAdmin.records.append(newRecord)
                                TeacherDataModelForAdmin.teacherImageArray.append(teacherImage)
                                completion(true)
                            }
                        }
                    }
                    
                }
            }
        }
    }

    func assignClassToTeacher(classId : String , teacherId : Int , completion : @escaping (Bool) -> Void){
        let classRef = db.collection("Classes")
        var teacherRef = db.collection("Teacher")
        
        for item in 0..<ClassDataModel.recordArray.count{
            
            if ClassDataModel.recordArray[item].assignedTeacher == String(teacherId) {
//                ClassDataModel.recordArray[item].assignedTeacher = "Not Assigned"
                print(ClassDataModel.recordArray[item].assignedTeacher)
                ClassDataModel.recordArray[item].assignedTeacher = "Not Assigned"
            }
        }
        for item in 0..<TeacherDataModelForAdmin.records.count{
            print(item)
            if TeacherDataModelForAdmin.records[item].assignedClass == classId {
//                ClassDataModel.recordArray[item].assignedTeacher = "Not Assigned"
                print(TeacherDataModelForAdmin.records[item].assignedClass)
                TeacherDataModelForAdmin.records[item].assignedClass = "Not Assigned"
            }
        }

        classRef.whereField("AssignedTeacher", isEqualTo: teacherId).getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
            }
            if let documents = snapshot?.documents  {
                    
                for document in documents{
                    document.reference.updateData([
                        "AssignedTeacher" : "Not Assigned"
                    ])
                }
            }
            teacherRef.whereField("AssignedClass", isEqualTo: classId).getDocuments { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                }
                if let documents = snapshot?.documents  {
                    
                    for document in documents{
                        print(document.data())
                        document.reference.updateData([
                            "AssignedClass" : "Not Assigned"
                        ])
                    }
                }
                
                teacherRef.whereField("teacherID", isEqualTo: teacherId).getDocuments { querySnapshot, error in
                    if let error = error {
                        print("error finding teacherId \(error.localizedDescription)")
                        completion(false)
                    }else{
                        guard let teacherDocument = querySnapshot?.documents.first else{
                            print("DId not find any record of that id")
                            completion(false)
                            return
                        }


                        classRef.whereField("id", isEqualTo: classId).getDocuments { querySnapshot, error in
                            if let error = error {
                                print("error finding class \(error.localizedDescription)")
                            }else{
                                guard let classDocument = querySnapshot?.documents.first else{
                                    print("DId not find any record of that class")
                                    completion(false)
                                    return
                                }

                                teacherDocument.reference.updateData([
                                    "AssignedClass" : classId
                                ])
                                classDocument.reference.updateData([
                                    "AssignedTeacher"  : teacherId
                                ])
                                
                                completion(true)
                            }
                        }
                    }
                }
            }
        }
//
//        teacherRef.whereField("teacherID", isEqualTo: teacherId).getDocuments { querySnapshot, error in
//            if let error = error {
//                print("error finding teacherId \(error.localizedDescription)")
//                completion(false)
//            }else{
//                guard let teacherDocument = querySnapshot?.documents.first else{
//                    print("DId not find any record of that id")
//                    completion(false)
//                    return
//                }
//
//
//                classRef.whereField("id", isEqualTo: classId).getDocuments { querySnapshot, error in
//                    if let error = error {
//                        print("error finding class \(error.localizedDescription)")
//                    }else{
//                        guard let classDocument = querySnapshot?.documents.first else{
//                            print("DId not find any record of that class")
//                            completion(false)
//                            return
//                        }
//                        print(classId)
//                        print(teacherId)
//                        teacherDocument.reference.updateData([
//                            "AssignedClass" : classId
//                        ])
//                        classDocument.reference.updateData([
//                            "AssignedTeacher"  : teacherId
//                        ])
//
//                        completion(true)
//                    }
//                }
//            }
//        }
    }
    func loadTeacherRecordDuringLogIn(){
        
    }
    
    var isTeacherRecordLoaded = false
    //Load TeacherRecord and images
    func loadAllTeacheraReocrd(completion : @escaping (Bool)-> Void){
        let collectionRef = Firestore.firestore().collection("Teacher").order(by: "teacherID")
        collectionRef.getDocuments { querySnapshot, error in
            if error != nil {
                return
            }else{
                for document in querySnapshot!.documents {
                    let data = document.data()
                    var teacherData = TeacherDataModelForAdmin()
                    teacherData.email = data["Email"] as? String ?? ""
                    teacherData.cNIC = data["CNIC"] as? String ?? ""
                    teacherData.imageUrl = data["ImageUrl"] as? String ?? ""
                    teacherData.name = data["Name"] as? String ?? ""
                    teacherData.phNo = data["Phone No"] as? String ?? ""
                    teacherData.teacherId = data["teacherID"] as? Int ?? 0
                    teacherData.qualification = data["Qualification"] as? String ?? ""
                    teacherData.assignedClass = data["AssignedClass"] as? String ?? ""
                    TeacherDataModelForAdmin.records.append(teacherData)

                }
                print(TeacherDataModelForAdmin.records)
                self.downloadImagesInSequence { success in
                    if success {
                        print("Images downloaded successfully")
//                        self.isTeacherRecordLoaded = true
                        completion(true)
                    }else{
                        print("Images downloaded error")
                        completion(false)
                    }
                }
            }
        }
    }
    func downloadImagesInSequence( completion: @escaping (Bool) -> Void) {

        var currentIndex = 0
        
        func downloadImageAtIndex(index: Int) {
            if index >= TeacherDataModelForAdmin.records.count {
                // All images downloaded
                self.isTeacherRecordLoaded = true
                completion(true)
                return
            }
            
            let urlString = TeacherDataModelForAdmin.records[index].imageUrl
            
            if let url = URL(string: urlString) {
                SDWebImageDownloader.shared.downloadImage(with: url) { image, _, error, _ in
                    if let error = error {
                        print("Error downloading image: \(error)")
                    } else if let image = image {
                        // Handle the downloaded image
                        // For example, you can add it to an image array
                        TeacherDataModelForAdmin.teacherImageArray.append(image)
                        print(TeacherDataModelForAdmin.teacherImageArray.count)
                    }
                    
                    currentIndex += 1
                    downloadImageAtIndex(index: currentIndex) // Recursively download the next image
                }
            } else {
                currentIndex += 1
                downloadImageAtIndex(index: currentIndex) // Recursively download the next image
            }
        }
        
        downloadImageAtIndex(index: currentIndex)
    }
    
    
    
    //Load TeacherRecord
    
//    func loadTeacherReocrd(completion : @escaping (Bool)-> Void){
//        let collectionRef = Firestore.firestore().collection("Teacher").order(by: "teacherID")
//        collectionRef.getDocuments { querySnapshot, error in
//            if error != nil {
//
//                print("Error loading records")
//                completion(false)
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
//                //                DispatchQueue.global(qos: .background).async {
//                for item in TeacherDataModel.records {
//                    if let imageUrl = URL(string: item.imageUrl){
//
//                        SDWebImageManager.shared.loadImage(with: imageUrl, progress: nil) { image, _, error , _, _, _ in
//                            if let error = error   {
//                                print("Error loading images \(error)")
//                                return
//                            }
//                            if let image = image {
//                                //                                self.imageArray.append(image)
//                                //                                print(self.imageArray.count)
//                                TeacherDataModel.teacherImageArray.append(image)
//                                print(TeacherDataModel.teacherImageArray.count)
//                            }
//                            if TeacherDataModel.records.count == TeacherDataModel.teacherImageArray.count{
//                                completion(true)
//                            }
//                        }
//                    }
//                    //                    }
//                }
//            }
//        }
//    }
    
    
    //    var records : [TeacherDataModel] = []
    //    func loadTeachersRecord( complition : @escaping (Bool)-> Void){
    //        let db = Firestore.firestore()
    //        let storageRef = Storage.storage().reference()
    //        let collectionRef = db.collection("Teacher").order(by: "teacherID")
    //
    //        collectionRef.getDocuments { querySnapshot, error in
    //            if error != nil {
    //                complition(false)
    //                return
    //            }else{
    //
    //                for document in querySnapshot!.documents {
    //                    let data = document.data()
    //                    var teacherData = TeacherDataModel()
    //                    teacherData.imageUrl = data["ImageUrl"] as? String ?? ""
    //                    teacherData.name = data["Name"] as? String ?? ""
    //                    teacherData.teacherId = data["teacherID"] as? Int ?? 0
    //                    teacherData.qualification = data["Qualification"] as? String ?? ""
    //                    teacherData.email = data["Email"] as? String ?? ""
    //                    teacherData.cNIC = data["CNIC"] as? String ?? ""
    //                    teacherData.imageUrl = data["Phone No"] as? String ?? ""
    //                    TeacherDataModel.records.append(teacherData)
    //
    //                }
    //                complition(true)
    //            }
    //        }
    //        DispatchQueue.global().async {
    //            for item in self.records {
    //                if let urlString = URL(string: item.imageUrl){
    //                    URLSession.shared.dataTask(with: urlString) { data, response, error in
    //                        if let imageData = data , let image = UIImage(data: imageData) {
    //                            self.imageArray.append(image)
    //                        }
    //                    }
    //                }
    //            }
    //            DispatchQueue.main.async {
    //                print(self.records)
    //                print(self.records.count)
    //                print(self.imageArray.count)
    //            }
    //        }
    
    //    }
    
    
    // function to update Teachers record
    
    func updateTeacher( teacherID teacherId : Int ,teacherImage newImageData : Data , previousImageURLString : String , isImageChanged : Bool , name teacherName: String, qualification teacherQualification: String , email teacherEmail: String, cnic teacherCNIC: String, phNo teacherPhoneNo: String , completion: @escaping (Bool) -> Void){
        
        let teacherRef = self.db.collection("Teacher").whereField("teacherID", isEqualTo: teacherId)
        teacherRef.getDocuments { [weak self] (querySnapshot, error) in
            guard let strongSelf = self else {
                return
            }
            if let error = error as NSError? {
                print("Error getting documents: \(error.localizedDescription)")
            }else{
                guard let documents = querySnapshot?.documents else {
                    completion(false)
                    print("No documents found")
                    return
                }
                if isImageChanged {
                    let storageRef = Storage.storage().reference(forURL: previousImageURLString)
                    let path = "teachers/\(teacherId).png"
                    print(path)
                    storageRef.delete { error in
                        if let error = error {
                            completion(false)
                            print("Error deleting image: \(error.localizedDescription)")
                        }else
                        {
                            print("Image deleted successfully")
                            strongSelf.uploadPhoto(path: path, imageData: newImageData) { imageUrl in
                                guard let urlString = imageUrl , !urlString.isEmpty else{
                                    completion(false)
                                    return
                                }
                                for document in documents {
                                    // Update the desired fields of the document
                                    document.reference.updateData([
                                        "ImageUrl" : urlString,
                                        "Name": teacherName,
                                        "Qualification": teacherQualification,
                                        "Email": teacherEmail,
                                        "CNIC": teacherCNIC,
                                        "Phone No": teacherPhoneNo,
                                    ]) { error in
                                        if let error = error {
                                            print("Error updating document: \(error)")
                                        } else {
                                            print("Document updated successfully")
                                            completion(true)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }else{
                    for document in documents {
                        // Update the desired fields of the document
                        document.reference.updateData([
                            "Name": teacherName,
                            "Qualification": teacherQualification,
                            "Email": teacherEmail,
                            "CNIC": teacherCNIC,
                            "Phone No": teacherPhoneNo,
                        ]) { error in
                            if let error = error {
                                print("Error updating document: \(error)")
                                completion(false)
                                
                            } else {
                                print("Document updated successfully")
                                completion(true)
                            }
                        }
                    }
                }
                
                
            }
        }
    }
    
    
    //RemoveTeacher
    func removeTeacher(teacherId : Int , completion: @escaping (Bool)-> Void){
        //        var urlString : String
        let teacherRef = self.db.collection("Teacher").whereField("teacherID", isEqualTo: teacherId)
        teacherRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error deleting teacher document: \(error.localizedDescription)")
                completion(false)
                return
            }
            guard let document = querySnapshot?.documents.first else {
                print("teacher document not found")
                completion(false)
                return
            }
            let data = document.data()
            print(data)
            guard let imageURL = data["ImageUrl"] as? String else {
                // ImageURL field is not available or not a string
                return
            }
            let storageRef = Storage.storage().reference(forURL: imageURL)
            print(imageURL)
            storageRef.delete { error in
                if let error = error {
                    
                    print("Error deleting image: \(error.localizedDescription)")
                    completion(false)
                } else {
                    document.reference.delete()
                    print("Image deleted successfully")
                    
                    print("Teacher removed from Teacher Collection")
                    completion(true)
                }
            }
        }
}
    
//              classses Section
    
    func loadClassesDetail(completion : @escaping (Bool)-> Void){
        var classRef = db.collection("Classes")
        classRef.getDocuments { querySnapshot, error in
            if let error = error {
                print("error loading data : \(error.localizedDescription)")
                completion(false)
            }else {
                guard let documents = querySnapshot?.documents else {
                    print("No documents found")
                    completion(false)
                    return
                }
                for document in documents {
                    var data = document.data()
                    var obj = ClassDataModel()
                    obj.className = data["id"] as? String ?? ""
                    var assignedTeacher =  data["AssignedTeacher"] as? Int ?? 0
                    if assignedTeacher == 0 {
                        obj.assignedTeacher = "Not Assigned"
                    }else{
                        obj.assignedTeacher = String(assignedTeacher)
                    }
                    obj.enrolledStudentsId = data["studentIds"] as? Array ?? []
                    
                    ClassDataModel.recordArray.append(obj)
                }
                completion(true)
            }
        }
    }
    
    
    
    
    
    // Function to register a new student and Parent account
    
    func registerStudent( image imageData : Data , name studentName: String, age studentAge: String , FName fatherName: String, FEmail fatherEmail: String, phNo fatherPhNo: String, address studentAddress : String, studentClass s_Class : String , completion: @escaping (Bool) -> Void) {
//        let fatherEmail = fatherPhNo + "@gmail.com"

        Auth.auth().createUser(withEmail: fatherEmail, password: "123456") { authResult, error in
            guard let user = authResult?.user, error == nil else {
                print("Error creating Parent user: \(error!.localizedDescription)")
                completion(false)
                return
            }
            print(user)
            let studentRef = self.db.collection("Students").whereField("Class", isEqualTo: s_Class)
            studentRef.order(by: "Roll_No", descending: true).limit(to: 1).getDocuments { (snapshot, error) in
                if let error = error {
                    print("Error getting last ID: \(error.localizedDescription)")
                } else if let document = snapshot?.documents.first {
                    print(document.data()["Roll_No"]!)
                    let lastId = document.data()["Roll_No"] as? Int ?? 0
                    let newId = lastId + 1
                    let path = "students/\(s_Class)/\(newId).png"
                    print("path value is \(path)")
                    print(document.data()["Roll_No"]!)
                    self.uploadPhoto(path: path, imageData: imageData) { imageURL in
                        guard let urlString = imageURL , !urlString.isEmpty else{
                            completion(false)
                            return
                    }
                        self.db.collection("Students").addDocument(data: [
                            "Roll_No": newId,
                            "ImageUrl": urlString,
                            "Name": studentName,
                            "Age": studentAge,
                            "Father Name": fatherName,
                            "Father Email": fatherEmail,
                            "Phone No": fatherPhNo,
                            "Address": studentAddress,
                            "Class": s_Class
                        ]) { err in
                            if let err = err {
                                print("Error saving Student data: \(err.localizedDescription)")
                                completion(false)
                            } else {
                                print("Student data saved successfully")
                                self.addStudentIdInClass(rollNo: newId, s_Class: s_Class)
                                completion(true)
                            }
                        }
                    }
                }else {
                    // No documents in "Students" collection, so create a new document with roll number 1
                    let path = "students/\(s_Class)/1.png"
                    self.uploadPhoto(path: path, imageData: imageData) { imageURL in
                        guard let urlString = imageURL , !urlString.isEmpty else{
                            completion(false)
                            return
                    }
                    self.db.collection("Students").addDocument(data: [
                            "Roll_No": 1,
                            "ImageUrl": urlString,
                            "Name": studentName,
                            "Age": studentAge,
                            "Father Name": fatherName,
                            "Father Email": fatherEmail,
                            "Phone No": fatherPhNo,
                            "Address": studentAddress,
                            "Class": s_Class
                        ]) { err in
                            if let err = err {
                                print("Error saving Student data: \(err.localizedDescription)")
                                completion(false)
                            } else {
                                print("Student data saved successfully")

                                //Adding studentRollNo in Class
                                self.addStudentIdInClass(rollNo: 1, s_Class: s_Class)
                                completion(true)
                            }
                        }
                    }
                }
            }
        }
    }

    private func uploadPhoto ( path : String , imageData : Data , completion: @escaping (String?) -> Void) {

        self.storage.child(path).putData(imageData) { _, error in
            guard error == nil else {
                print("Faild to upload")
                completion(nil)
                return
            }
            
            self.storage.child(path).downloadURL { url, error in
                guard let url = url , error == nil else{
                    completion(nil)
                    return
                }
                let urlString = url.absoluteString
                print("Image Uploaded")
                print("absolute url is \(urlString)")
                completion(urlString)
            }
        }
    }
    private func addStudentIdInClass( rollNo : Int , s_Class : String){
        let classesCollection = db.collection("Classes")
        classesCollection
            .whereField("id", isEqualTo: s_Class)
            .getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    for document in querySnapshot!.documents {
                        let documentRef = classesCollection.document(document.documentID)
                        documentRef.updateData([
                            "studentIds": FieldValue.arrayUnion([rollNo])
                        ]) { error in
                            if let error = error {
                                print("Error updating document(student id in class): \(error)")
                            } else {
                                print("Document(student id in class) updated successfully.")
                            }
                        }
                    }
                }
            }
    }
    
    //Update Student Record
    func updateStudent( studentRollNo rollNo : Int , studentClass s_Class : String , isImageChanged : Bool , previousImageURLString : String , newImage newImageData : Data , name studentName: String, age studentAge: String , FName fatherName: String, FEmail fatherEmail: String, phNo fatherPhNo: String, address studentAddress : String , completion: @escaping (Bool) -> Void){

        let studentRef = self.db.collection("Students").whereField("Class", isEqualTo: s_Class).whereField("Roll_No", isEqualTo: rollNo)
            studentRef.getDocuments { [weak self] (querySnapshot, error) in
            guard let strongSelf = self else {
                return
            }
            if let error = error as NSError? {
                print("Error getting documents: \(error.localizedDescription)")
            }else{
                guard let documents = querySnapshot?.documents else {
                    completion(false)
                    print("No documents found")
                            return
                        }
                if isImageChanged {
                    let storageRef = Storage.storage().reference(forURL: previousImageURLString)
                    let path = "students/\(s_Class)/\(rollNo).png"
                    storageRef.delete { error in
                        if let error = error {
                            completion(false)
                            print("Error deleting image: \(error.localizedDescription)")
                        }else
                        {
                            print("Image deleted successfully")
                            strongSelf.uploadPhoto(path: path, imageData: newImageData) { imageUrl in
                                guard let urlString = imageUrl , !urlString.isEmpty else{
                                    completion(false)
                                    return
                                }
                                for document in documents {
                                    // Update the desired fields of the document
                                    document.reference.updateData([
                                        "ImageUrl": urlString,
                                        "Name": studentName,
                                        "Age": studentAge,
                                        "Father Name": fatherName,
                                        "Father Email": fatherEmail,
                                        "Phone No": fatherPhNo,
                                        "Address": studentAddress,
                                    ]) { error in
                                        if let error = error {
                                            print("Error updating document: \(error)")
                                        } else {
                                            print("Document updated successfully")
                                            completion(true)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }else{
                    for document in documents {
                        // Update the desired fields of the document
                        document.reference.updateData([
                            "Name": studentName,
                            "Age": studentAge,
                            "Father Name": fatherName,
                            "Father Email": fatherEmail,
                            "Phone No": fatherPhNo,
                            "Address": studentAddress,
                        ]) { error in
                            if let error = error {
                                print("Error updating document: \(error)")
                                completion(false)

                            } else {
                                print("Document updated successfully")
                                completion(true)
                            }
                        }
                    }
                }
                
                        
//                storageRef.delete { error in
//                    if let error = error {
//                        print("Error deleting image: \(error.localizedDescription)")
//                    } else {
//                        strongSelf.uploadPhoto(path: path, imageData: newImageData) { imageUrl in
//                            guard let urlString = imageUrl , !urlString.isEmpty else{
//                                completion(false)
//                                return
//                            }
//                            for document in documents {
//                                // Update the desired fields of the document
//                                document.reference.updateData([
//                                    "ImageUrl": urlString,
//                                    "Name": studentName,
//                                    "Age": studentAge,
//                                    "Father Name": fatherName,
//                                    "Father Email": fatherEmail,
//                                    "Phone No": fatherPhNo,
//                                    "Address": studentAddress,
//                                ]) { error in
//                                    if let error = error {
//                                        print("Error updating document: \(error)")
//                                    } else {
//                                        print("Document updated successfully")
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//                    for document in documents {
//                               // Update the desired fields of the document
//                               document.reference.updateData([
//    //                            "ImageUrl": urlString,
//                                "Name": studentName,
//                                "Age": studentAge,
//                                "Father Name": fatherName,
//                                "Father Email": fatherEmail,
//                                "Phone No": fatherPhNo,
//                                "Address": studentAddress,
//    //                            "Class": s_Class
//                               ]) { error in
//                                   if let error = error {
//                                       print("Error updating document: \(error)")
//                                   } else {
//                                       print("Document updated successfully")
//                                   }
//                               }
//                           }
//                if let snapshot = snapshot {
//                    if !snapshot.isEmpty {
//                        for document in snapshot.documents {
//                            print("\(document.documentID) => \(document.data())")
//                            let data = document.data()
//                            // access data fields as needed
//                            let imgUrl = data["ImageUrl"] as? String ?? ""
//                            let name = data["Name"] as? String ?? "n"
//                            let rollNo = data["Roll_No"] as? Int ?? 00
//                            let age = data["Age"] as? String ?? "0"
//                            let fName = data["Father Name"] as? String ?? "_"
//                            let fatherEmail = data["Father Email"] as? String ?? "_"
//                            let phNo = data["Phone No"] as? String ?? "_"
//                            let address = data["Address"] as? String ?? "_"
                            
//                            strongSelf.searchedStudentData.imageUrl = imgUrl
//                            strongSelf.searchedStudentData.name = name
//                            strongSelf.searchedStudentData.rollNo = String(rollNo)
//                            strongSelf.searchedStudentData.age = age
//                            strongSelf.searchedStudentData.fName = fName
//                            strongSelf.searchedStudentData.fEmail = fatherEmail
//                            strongSelf.searchedStudentData.phNo = phNo
//                            strongSelf.searchedStudentData.address = address
                            
                            // etc.
                        }
                       
                        
//                    } else {
//                        print("No documents found")
//                    }
//                }
//            }
        }
        
        
//        let studentRef = self.db.collection("Students").whereField("Class", isEqualTo: s_Class)
//        studentRef.order(by: "Roll_No", descending: true).limit(to: 1).getDocuments { (snapshot, error) in
//            if let error = error {
//                print("Error getting last ID: \(error.localizedDescription)")
//            } else if let document = snapshot?.documents.first {
//                print(document.data()["Roll_No"]!)
//                let lastId = document.data()["Roll_No"] as? Int ?? 0
//                let newId = lastId + 1
//                let path = "students/\(s_Class)/\(newId).png"
//                print("path value is \(path)")
//                print(document.data()["Roll_No"]!)
//                self.uploadPhoto(path: path, imageData: imageData) { imageURL in
//                    guard let urlString = imageURL , !urlString.isEmpty else{
//                        completion(false)
//                        return
//                }
//                    self.db.collection("Students").addDocument(data: [
//                        "Roll_No": newId,
//                        "ImageUrl": urlString,
//                        "Name": studentName,
//                        "Age": studentAge,
//                        "Father Name": fatherName,
//                        "Father Email": fatherEmail,
//                        "Phone No": fatherPhNo,
//                        "Address": studentAddress,
//                        "Class": s_Class
//                    ]) { err in
//                        if let err = err {
//                            print("Error saving Student data: \(err.localizedDescription)")
//                            completion(false)
//                        } else {
//                            print("Student data saved successfully")
//                            self.addStudentIdInClass(rollNo: newId, s_Class: s_Class)
//                            completion(true)
//                        }
//                    }
//                }
//            }else {
//                // No documents in "Students" collection, so create a new document with roll number 1
//                let path = "students/\(s_Class)/1.png"
//                self.uploadPhoto(path: path, imageData: imageData) { imageURL in
//                    guard let urlString = imageURL , !urlString.isEmpty else{
//                        completion(false)
//                        return
//                }
//                self.db.collection("Students").addDocument(data: [
//                        "Roll_No": 1,
//                        "ImageUrl": urlString,
//                        "Name": studentName,
//                        "Age": studentAge,
//                        "Father Name": fatherName,
//                        "Father Email": fatherEmail,
//                        "Phone No": fatherPhNo,
//                        "Address": studentAddress,
//                        "Class": s_Class
//                    ]) { err in
//                        if let err = err {
//                            print("Error saving Student data: \(err.localizedDescription)")
//                            completion(false)
//                        } else {
//                            print("Student data saved successfully")
//
//                            //Adding studentRollNo in Class
//                            self.addStudentIdInClass(rollNo: 1, s_Class: s_Class)
//                            completion(true)
//                        }
//                    }
//                }
//            }
//        }
//    }
    }
    
    
    // Remove Student
    func removeStudent(classId : String , rollNo : Int){
//        var urlString : String
        let studentRef = self.db.collection("Students").whereField("Class", isEqualTo: classId).whereField("Roll_No", isEqualTo: rollNo)
        let classRef = self.db.collection("Classes").whereField("id", isEqualTo: classId)
        classRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting class document: \(error.localizedDescription)")
            } else {
                guard let document = querySnapshot?.documents.first else {
                    print("Class document not found")
                    return
                }
                var students = document.data()["studentIds"] as? [Int] ?? []
                print(students)
                if let index = students.firstIndex(of: rollNo) {
                    students.remove(at: index)
                    document.reference.updateData(["studentIds": students]) { error in
                        if let error = error {
                            print("Error updating class document: \(error.localizedDescription)")
                        } else {
                            print("Student removed from class document")
                        }
                    }
                    studentRef.getDocuments { (querySnapshot, error) in
                        if let error = error {
                            print("Error deleting student document: \(error.localizedDescription)")
                            return
                        }
                        guard let document = querySnapshot?.documents.first else {
                                print("Student document not found")
                                return
                            }
                        let data = document.data()
                        print(data)
                        guard let imageURL = data["ImageUrl"] as? String else {
                            // ImageURL field is not available or not a string
                            return
                        }
                        let storageRef = Storage.storage().reference(forURL: imageURL)
                        print(imageURL)
                        storageRef.delete { error in
                            if let error = error {
                                print("Error deleting image: \(error.localizedDescription)")
                            } else {
                                print("Image deleted successfully")
                                document.reference.delete()
                              
                                print("Student removed from Students Collection")
                            }
                        }
                    }
                    
                } else {
                    print("Student not found in class document")
                }
            }
        }

    }
    //Make announcement function
    func makeAnnouncement( title : String , desc : String , announcementRecevier receiver: String , completion : @escaping (Bool)-> Void){
        
        var announcementRef = db.collection("Announcement")
        announcementRef.order(by: "id" , descending: true).limit(to: 1).getDocuments(completion: { snapshot, error in
            
                if let error = error {
                    print("Error getting last ID: \(error.localizedDescription)")
                } else if let document = snapshot?.documents.first {
                    
                    let lastId = document.data()["id"] as? Int ?? 0
                    let newId = lastId + 1
                    announcementRef.addDocument(data: [
                        "id" : newId,
                        "sendTo": receiver,
                        "title": title,
                        "desc": desc,
                    ]) { err in
                        if let err = err {
                            print("Error saving Announcement data: \(err.localizedDescription)")
                            completion(false)
                        } else {
                            print("Announcement sent successfully")
                            completion(true)
                        }
                    }
                }else{
                    announcementRef.addDocument(data: [
                        "id" : 1,
                        "sendTo": receiver,
                        "title": title,
                        "desc": desc,
                    ]) { err in
                        if let err = err {
                            print("Error saving Announcement data: \(err.localizedDescription)")
                            completion(false)
                        } else {
                            print("Announcement sent successfully")
                            completion(true)
                        }
                    }
                }
        })
            
            
    }
    var announcementArray : [AnnouncementData] = []

    func reteriveAllAnnouncement( role : String , completion : @escaping (Bool) -> Void) {
        let announceRef = self.db.collection("Announcement")
        announceRef.getDocuments { snapshot, error in
            var record : AnnouncementData
            if let error = error {
                print("Error getting document: \(error.localizedDescription)")
                completion(false)
            } else {
                AnnouncementData.announcementList.removeAll()
                for document in snapshot!.documents {
                    let data = document.data()
                    let sendTo = data["sendTo"] as? String ?? ""
                    
                    if role == "admin"  {
                        let id = data["id"] as? Int ?? 0
                        let title = data["title"] as? String ?? ""
                        let desc = data["desc"] as? String ?? ""
                        let role = data["sendTo"] as? String ?? ""
                        record = AnnouncementData( announcementId: id , title: title, description: desc, announcementRole: role)
                        AnnouncementData.announcementList.append(record)
                        continue
                    }

                    
                    if role == sendTo || sendTo == "Everyone"  {
                        let id = data["id"] as? Int ?? 0
                        let title = data["title"] as? String ?? ""
                        let desc = data["desc"] as? String ?? ""
                        let role = data["sendTo"] as? String ?? ""
                        record = AnnouncementData( announcementId: id , title: title, description: desc, announcementRole: role)
                        AnnouncementData.announcementList.append(record)
                    }
                }
                completion(true)
            }
        }
    }
    
    func updateAnnouncement( updatedData : AnnouncementData , completion : @escaping (Bool) -> Void ){
        self.db.collection("Announcement").whereField("id", isEqualTo: updatedData.announcementId).getDocuments { snapshot, error in
            if let error = error {
                print("Error getting class document: \(error.localizedDescription)")
                completion(false)
            }else{
               guard let document = snapshot?.documents.first else {
                   print("Did not find any data")
                    completion(false)
                   return
                }
                document.reference.updateData([
                    "title" : updatedData.announcementTitle ,
                    "desc"  : updatedData.announcementDescription ,
                    "sendTo" : updatedData.announcementRole
                ])
                completion(true)
            }
        }
    }
    
    func removeAnnouncement(announcementId : Int , completion : @escaping (Bool) -> Void){
        self.db.collection("Announcement").whereField("id", isEqualTo: announcementId).getDocuments { snapshot, error in
            if let error = error {
                print("Error getting class document: \(error.localizedDescription)")
                completion(false)
            }else{
                guard let document = snapshot?.documents.first else {
                    print("Announcement not found")
                    completion(false)
                    return
                }
                document.reference.delete()
                print("Announcement deleted successfully")
                completion(true)
            }
        }
    }
    
    
    //                  Teacher Section
    
    func loadAllStudentsRecordForTeacher( classId : String , completion : @escaping (Bool) -> Void ){

        StudentDataModelForTeacher.studentArray.removeAll()
        var studentRef = db.collection("Students").whereField("Class", isEqualTo: classId)
        var classRef = db.collection("Classes").whereField("id", isEqualTo: classId).getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting documents \(error.localizedDescription)")
                completion(false)
            }
            else{
                guard let documents = querySnapshot?.documents else {
                    print("Did not find any documents")
                    completion(false)
                    return
                }
                if let document = documents.first {
                    let data = document.data()
                    var studentsIds : Array = []
                    studentsIds = data["studentIds"] as? Array ?? []
                    print("studentIds Count OutSide FUnction\(studentsIds.count)")
                    print("studentArray count\(StudentDataModelForTeacher.studentArray.count)")
                                // using recursion
                    func processStudentRecord(at index : Int){
                        print("studentArray count\(StudentDataModelForTeacher.studentArray.count)")

                        guard index < studentsIds.count else {
                            // All student records have been processed
                            print("studentIds Count\(studentsIds.count)")

                            completion(true)
                            return
                        }
                        studentRef.whereField("Roll_No", isEqualTo: studentsIds[index]).getDocuments { snapshot, error in
                            if let error = error {
                                print("Error downloading student Record \(error.localizedDescription)")
                                completion(false)
                            }else{
                                guard let documents = snapshot?.documents else {
                                    print("Did not find any student documents")
                                    completion(false)
                                    return
                                }
                                if let document = documents.first {
                                    let documentData = document.data()
                                    var studentRecord = StudentDataModelForTeacher()
                                    studentRecord.rollNo = documentData["Roll_No"] as? Int ?? 00
                                    studentRecord.studentName = documentData["Name"] as? String ?? ""
                                    studentRecord.age = documentData["Age"] as? String ?? ""
                                    studentRecord.fatherName = documentData["Father Name"] as? String ?? ""
                                    studentRecord.studentClass = documentData["Class"] as? String ?? ""
                                    studentRecord.fatherEmail = documentData["Father Email"] as? String ?? ""
                                    studentRecord.phoneNo = documentData["Phone No"] as? String ?? ""
                                    studentRecord.imageUrl = documentData["ImageUrl"] as? String ?? ""
                                    
//                                    print(studentRecord)
                                    StudentDataModelForTeacher.studentArray.append(studentRecord)
//                                    print(StudentDataModelForTeacher.studentArray)
                                }
                                processStudentRecord(at: index + 1)
//                                print("index \(index)")
//                                print(StudentDataModelForTeacher.studentArray.count)
                            }
                        }

                    }
                    processStudentRecord(at: 0)
                    
                                    //using dispatchGroup

//                    let dispatchGroup = DispatchGroup() // Create a dispatch group

//                    for items in studentsIds {
//                        print(items)
////                        dispatchGroup.enter()
//                        studentRef.whereField("Roll_No", isEqualTo: items).getDocuments { snapshot, error in
//
////                            defer {
////                                            dispatchGroup.leave() // Leave the dispatch group
////                                        }
//                            if let error = error {
//                                print("Error downloading student Record \(error.localizedDescription)")
//                                completion(false)
//                            }else{
//                                guard let documents = snapshot?.documents else {
//                                    print("Did not find any student documents")
//                                    completion(false)
//                                    return
//                                }
//                                if let document = documents.first {
//                                    let documentData = document.data()
//                                    var studentRecord = StudentDataModelForTeacher()
//                                    studentRecord.rollNo = documentData["Roll_No"] as? Int ?? 00
//                                    studentRecord.studentName = documentData["Name"] as? String ?? ""
//                                    studentRecord.age = documentData["Age"] as? String ?? ""
//                                    studentRecord.fatherName = documentData["Father Name"] as? String ?? ""
//                                    studentRecord.studentClass = documentData["Class"] as? String ?? ""
//                                    studentRecord.fatherEmail = documentData["Father Email"] as? String ?? ""
//                                    studentRecord.phoneNo = documentData["Phone No"] as? String ?? ""
//                                    studentRecord.imageUrl = documentData["ImageUrl"] as? String ?? ""
//
////                                    print(studentRecord)
//                                    StudentDataModelForTeacher.studentArray.append(studentRecord)
////                                    print(StudentDataModelForTeacher.studentArray)
//                                }
//                            }
//                        }
//                    }
//                    dispatchGroup.notify(queue: .main) {
//                        // This block will be executed when all the asynchronous tasks in the dispatch group have completed
//
//                        // Perform any final tasks or call completion(true) here
//                        completion(true)
//                    }
                    
                }
            }
        }
        
    }
    
}


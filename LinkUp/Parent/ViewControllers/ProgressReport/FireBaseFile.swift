//
//  FireBaseFile.swift
//  LinkUp
//
//  Created by Afnan Ahmed on 05/08/2023.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase
import SDWebImage

var totalAttendace = 0
var totalPresennts = 0
var totalMidsMarks = 0
var ObtaiMidsMarks = 0

let db = Firestore.firestore()
// Function to fetch data from Firebase
func fetchQuizesDataFromFirebase2(Quiz: String, completion: @escaping (Bool) -> Void) {
    // Replace "collectionName" with the name of your collection in Firebase.
    
    var QuizNo = ""
    var Subname = ""
    var obtMarks = ""
    var totMarks = ""
    
    QuizMarksData.records.removeAll()
    
    db.collection(Quiz).getDocuments { snapshot, error in
        if let error = error {
            print("Error fetching data: \(error)")
            return
        }
        
        guard let documents = snapshot?.documents else {
            print("No documents found.")
            return
        }
        
        for document in documents {
            //            print("Document data: \(document.data())")
            var data = document.data()
            
                        print("Document Data \(data) ")
            
            
            if((data["classId"]!) as! String == ParentRecordModel.shared.studentClass)
            {
                //                print("Document Data \(data["quizDetail"]!)")
                var quizDetailArray = data["quizDetail"] as? [[String: Any]]
            }
            //             Access and print individual fields from data dictionary
            if let quizId = data["quizId"] as? Int,
               let classId = data["classId"] as? String,
               let subjectname = data["subjectName"] as? String,
               let totalMarks = data["totalMarks"] as? String,
               let quizDetailArray = data["quizDetail"] as? [[String: Any]] {
                
                
                if((classId) == ParentRecordModel.shared.studentClass)
                {
                    
                    QuizNo = String(quizId)
                    Subname = subjectname
                    totMarks = totalMarks
                    
                    print("Quiz ID: \(quizId)")
                    print("Class ID: \(classId)")
                    print("Subject Name: \(subjectname)")
                    print("Total Marks: \(totalMarks)")
                    
                    
                    //                 Process quizDetailArray if needed
                                    for quizDetail in quizDetailArray {
                                        if let obtainMarks = quizDetail["obtainMarks"] as? String,
                                           let studentID = quizDetail["studentID"] as? String,
                                           let studentName = quizDetail["studentName"] as? String
                                        {
                                            if((studentID) == String(ParentRecordModel.shared.studentRollNo))
                                            {
                                                print("Obtain Marks: \(obtainMarks)")
                                                print("Student ID: \(studentID)")
                                                print("Student Name: \(studentName)")
                                                obtMarks = obtainMarks
                                            }
                                            
                                            
                                        }
                                        else {
                                            print("Error: Invalid quiz detail data")
                                        }
                                    }
                    
                    let quizData = QuizMarksData(QuizNo: QuizNo, Subject: Subname, ObtainMarks: obtMarks, TotalMarks: totMarks)
                    QuizMarksData.records.append(quizData)
                    print("after data ")
                }

            }
            else {
                print("Error: Invalid document data")
            }

        }
        
        completion(true)
        
    }

}



func fetchAttendenceDataFromFirebase3(Quiz: String, completion: @escaping (Bool) -> Void) {
    // Replace "collectionName" with the name of your collection in Firebase.
    
    totalAttendace = 0
    totalPresennts = 0
    
    db.collection(Quiz).getDocuments { snapshot, error in
        if let error = error {
            print("Error fetching data: \(error)")
            return
        }
        
        guard let documents = snapshot?.documents else {
            print("No documents found.")
            return
        }
        for document in documents {
            //            print("Document data: \(document.data())")
            var data = document.data()
                        print("Document Data \(data) ")
            //             Access and print individual fields from data dictionary
            if let classId = data["classId"] as? String,
//               let subjectname = data["subjectName"] as? String,
//               let totalMarks = data["totalMarks"] as? String,
               let AttendenceDetails = data["attendance"] as? [[String: Any]]
            {
////                 Process quizDetailArray if needed
                for quizDetail in AttendenceDetails {
                    if let studentID = quizDetail["id"] as? String,
                       let studentName = quizDetail["name"] as? String,
                       let status = quizDetail["status"] as? Int
                    {
                        if((studentID) == String(ParentRecordModel.shared.studentRollNo))
                        {
//                            print("Obtain Marks: \(obtainMarks)")
                            print("Student ID: \(studentID)")
                            print("Student Name: \(studentName)")
                            
                            if(status == 1)
                            {
                                totalPresennts = totalPresennts + status
                            }
                            
                            totalAttendace = totalAttendace + 1

                        }
                    }
                    else {
                        print("Error: Invalid quiz detail data")
                    }
                }
            }
            else {
                print("Error: Invalid document data")
            }
        }
        print("presents \(totalPresennts)")
        print("Total Atten \(totalAttendace)")
        completion(true)
    }

}


func fetchMidsMarksDataFromFirebase(Quiz: String, completion: @escaping (Bool) -> Void) {
    // Replace "collectionName" with the name of your collection in Firebase.
    
    totalMidsMarks = 0
    ObtaiMidsMarks = 0
    MidTermMarksData.records.removeAll()

    
    db.collection(Quiz).getDocuments { snapshot, error in
        if let error = error {
            print("Error fetching data: \(error)")
            return
        }
        
        guard let documents = snapshot?.documents else {
            print("No documents found.")
            return
        }
        
        for document in documents {
                        print("Document data: \(document.data())")
            var data = document.data()
            
//                        print("Document Data \(data) ")

            //             Access and print individual fields from data dictionary
            if let classId = data["id"] as? String,
//               let subjectname = data["subjectName"] as? String,
//               let totalMarks = data["totalMarks"] as? String,
                let MidTermResult = data["MidTermResult"] as? [[String: Any]]
            {
//                print(classId)
                if(classId == ParentRecordModel.shared.studentClass)
                {
                    print(classId)
//                    print(MidTermResult)
//                                     Process quizDetailArray if needed
                                    for Result in MidTermResult {
                                        if let studentID = Result["studentID"] as? String,
                                           let studentName = Result["studentName"] as? String,
                                           let StudentResult = Result["Result"] as? [String: Any]
                                        {
                                            if((studentID) == String(ParentRecordModel.shared.studentRollNo))
                                            {
                    //                            print("Obtain Marks: \(obtainMarks)")
                                                print("Student ID: \(studentID)")
                                                print("Student Name: \(studentName)")
//                                                print("Student Result: \(StudentResult)")
                                                for (subject, score) in StudentResult {
                                                    
                                                    
                                                    ObtaiMidsMarks = ObtaiMidsMarks + Int("\(score)")!
                                                    totalMidsMarks = totalMidsMarks + 50
                                                    
                                                    let Data = MidTermMarksData(Subject: subject,ObtainMarks: "\(score)",TotalMarks: "50")
                                                    MidTermMarksData.records.append(Data)
                                                    
                                                    print("\(subject): \(score)")
                                                }

                                            }
//                                            print(studentID)
//                                            print(studentName)
//                                            print(StudentResult)
                                        }
                                        else {
                                            print("Error: Invalid quiz detail data")
                                        }
                                    }
                }
            }
            else {
                print("Error: Invalid document data")
            }

        }
        let Data = MidTermMarksData(Subject: "Total Marks",ObtainMarks: "\(ObtaiMidsMarks)",TotalMarks: "\(totalMidsMarks)")
        MidTermMarksData.records.append(Data)
        print("presents \(totalMidsMarks)")
        print("Total Atten \(ObtaiMidsMarks)")
        
        completion(true)
        
    }

}


func fetchFinalMarksDataFromFirebase(Quiz: String, completion: @escaping (Bool) -> Void) {
    // Replace "collectionName" with the name of your collection in Firebase.
    
    totalMidsMarks = 0
    ObtaiMidsMarks = 0
    FinalMarksData.records.removeAll()

    
    db.collection(Quiz).getDocuments { snapshot, error in
        if let error = error {
            print("Error fetching data: \(error)")
            return
        }
        
        guard let documents = snapshot?.documents else {
            print("No documents found.")
            return
        }
        
        for document in documents {
                        print("Document data: \(document.data())")
            var data = document.data()
            
//                        print("Document Data \(data) ")

            //             Access and print individual fields from data dictionary
            if let classId = data["id"] as? String,
//               let subjectname = data["subjectName"] as? String,
//               let totalMarks = data["totalMarks"] as? String,
                let MidTermResult = data["FinalTermResult"] as? [[String: Any]]
            {
//                print(classId)
                if(classId == ParentRecordModel.shared.studentClass)
                {
                    print(classId)
//                    print(MidTermResult)
//                                     Process quizDetailArray if needed
                                    for Result in MidTermResult {
                                        if let studentID = Result["studentID"] as? String,
                                           let studentName = Result["studentName"] as? String,
                                           let StudentResult = Result["Result"] as? [String: Any]
                                        {
                                            if((studentID) == String(ParentRecordModel.shared.studentRollNo))
                                            {
                    //                            print("Obtain Marks: \(obtainMarks)")
                                                print("Student ID: \(studentID)")
                                                print("Student Name: \(studentName)")
//                                                print("Student Result: \(StudentResult)")
                                                for (subject, score) in StudentResult {
                                                    
                                                    
                                                    ObtaiMidsMarks = ObtaiMidsMarks + Int("\(score)")!
                                                    totalMidsMarks = totalMidsMarks + 100
                                                    
                                                    let Data = FinalMarksData(Subject: subject,ObtainMarks: "\(score)",TotalMarks: "100")
                                                    FinalMarksData.records.append(Data)
                                                    
                                                    print("\(subject): \(score)")
                                                }

                                            }
//                                            print(studentID)
//                                            print(studentName)
//                                            print(StudentResult)
                                        }
                                        else {
                                            print("Error: Invalid quiz detail data")
                                        }
                                    }
                }
            }
            else {
                print("Error: Invalid document data")
            }

        }
        let Data = FinalMarksData(Subject: "Total Marks",ObtainMarks: "\(ObtaiMidsMarks)",TotalMarks: "\(totalMidsMarks)")
        FinalMarksData.records.append(Data)
        print("presents \(totalMidsMarks)")
        print("Total Atten \(ObtaiMidsMarks)")
        
        completion(true)
        
    }

}

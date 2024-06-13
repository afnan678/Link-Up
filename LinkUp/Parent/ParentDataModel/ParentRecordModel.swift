//
//  ParentRecordModel.swift
//  LinkUp
//
//  Created by Hamza Malik on 01/06/2023.
//

import Foundation
import UIKit

struct ParentRecordModel {
    
    static var shared = ParentRecordModel(studentRollNo: 0 , studentName: "", studentDOB: "", studentClass: "", fatherName: "", fatherEmail: "", fatherPhoneNo: "", address: "", imageURL: "")
    
    var studentImage : UIImage?
    
    var studentRollNo : Int
    var studentName : String
    var studentDOB : String
    var studentClass : String
    var fatherName : String
    var fatherEmail : String
    var fatherPhoneNo : String
    var address : String
    var imageURL : String
    
    init(studentImage: UIImage? = nil, studentRollNo: Int, studentName: String, studentDOB: String, studentClass: String, fatherName: String, fatherEmail: String, fatherPhoneNo: String, address: String, imageURL: String) {
        self.studentImage = studentImage
        self.studentRollNo = studentRollNo
        self.studentName = studentName
        self.studentDOB = studentDOB
        self.studentClass = studentClass
        self.fatherName = fatherName
        self.fatherEmail = fatherEmail
        self.fatherPhoneNo = fatherPhoneNo
        self.address = address
        self.imageURL = imageURL
    }
}

//
//  studentDataModelForTeacher.swift
//  LinkUp
//
//  Created by Hamza Malik on 11/06/2023.
//

import Foundation

struct StudentDataModelForTeacher {
    
    static var studentArray : [StudentDataModelForTeacher] = []
    
    var rollNo : Int
    var studentName : String
    var age : String
    var fatherName : String
    var studentClass : String
    var fatherEmail : String
    var phoneNo : String
    var imageUrl : String
    
    init(rollNo: Int = 00 , studentName: String = "", age: String = "", fatherName: String = "", studentClass: String = "", fatherEmail: String = "" , phoneNo: String = "", imageUrl: String = "") {
        self.rollNo = rollNo
        self.studentName = studentName
        self.age = age
        self.fatherName = fatherName
        self.studentClass = studentClass
        self.fatherEmail = fatherEmail
        self.phoneNo = phoneNo
        self.imageUrl = imageUrl
    }
}

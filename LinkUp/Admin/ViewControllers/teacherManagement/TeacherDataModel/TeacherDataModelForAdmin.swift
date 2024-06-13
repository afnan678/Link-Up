//
//  TeacherDataMode.swift
//  LinkUp
//
//  Created by Hamza Malik on 19/05/2023.
//

import Foundation
import UIKit


struct TeacherDataModelForAdmin {

    
    static var records : [TeacherDataModelForAdmin] = []
    static var teacherImageArray : [UIImage] = []
    
    var imageUrl : String
    var name : String
    var teacherId : Int
    var qualification : String
    var email : String
    var cNIC : String
    var phNo : String
    var assignedClass : String

    
    init( imageUrl : String = "" , name: String = "", id : Int = 0 ,  qualification: String = "", email : String = "" , cnic : String = "", phNo : String = ""  , assignedClass : String = "") {
        self.imageUrl = imageUrl
        self.name = name
        self.teacherId = id
        self.qualification = qualification
        self.cNIC = cnic
        self.email = email
        self.phNo = phNo
        self.assignedClass = assignedClass
        }
}

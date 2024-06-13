//
//  TeacherData.swift
//  LinkUp
//
//  Created by Hamza Malik on 17/04/2023.
//

import Foundation
import UIKit
struct TeacherDataModel {
    
    static var shared = TeacherDataModel(name: "", teacherID: 0, cNIC: "", qualification: "", email: "", phoneNo: "", assignedClass : "" , imageUrl: "" , image: nil )
    
    var name : String
    var teacherID : Int
    var cNIC : String
    var qualification : String
    var email : String
    var phoneNo : String
    var imageUrl : String
    var assignedClass : String
    var image : UIImage?
    
    init(name: String, teacherID: Int, cNIC: String, qualification: String, email: String, phoneNo: String, assignedClass : String , imageUrl : String , image: UIImage?) {
        self.name = name
        self.teacherID = teacherID
        self.cNIC = cNIC
        self.qualification = qualification
        self.email = email
        self.phoneNo = phoneNo
        self.assignedClass = assignedClass
        self.imageUrl = imageUrl
        self.image = image
    }
}


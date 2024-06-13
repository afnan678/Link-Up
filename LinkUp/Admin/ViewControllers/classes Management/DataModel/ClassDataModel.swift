//
//  ClassDataModel.swift
//  LinkUp
//
//  Created by Hamza Malik on 08/06/2023.
//

import Foundation

struct ClassDataModel {
    
//    static var teacherRecordsWithoutImages : [TeacherDataModel] = []

    static var recordArray : [ClassDataModel] = []
    
    var className : String
    var assignedTeacher : String
    var enrolledStudentsId: [Int]
    
    init(className: String = "", assignedTeacher: String = "", enrolledStudentsId: [Int] = []) {
        self.className = className
        self.assignedTeacher = assignedTeacher
        self.enrolledStudentsId = enrolledStudentsId
    }
}
